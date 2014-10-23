class EnrollmentsController < ApplicationController

  before_filter :authenticate_user!

  layout 'public'

  def new
    @enrollment = Enrollment.new
    @enrollment.user_id = current_user.id

    # We need to redirect them to edit their current application
    # if one exists. Otherwise, they can make a new one with some
    # prefilled data which we'll immediately send them to edit.
    existing_enrollment = Enrollment.find_by(:user_id => current_user.id)
    if existing_enrollment.nil?
      # pre-fill any fields that are available from the user model
      @enrollment.first_name = current_user.first_name
      @enrollment.last_name = current_user.last_name
      @enrollment.email = current_user.email
      @enrollment.accepts_txt = true # to pre-check the box

<<<<<<< HEAD
      @enrollment.save!
=======
      # we know this is incomplete data, the user will be able
      # to save as they enter more so we don't validate until the end
      @enrollment.save(validate: false)
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec

      # Sending them to the edit path ASAP means we can update the existing
      # row at any time as they input data, ensuring the AJAX thing doesn't
      # make duplicate rows and also won't lose rows
      redirect_to enrollment_path(@enrollment.id)
    else
      redirect_to enrollment_path(existing_enrollment.id)
    end
<<<<<<< HEAD
  end

  def show
    # We'll show it by just displaying the pre-filled form
    # as that's the fastest thing that can possibly work for MVP
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.user_id != current_user.id && !current_user.admin?
      redirect_to new_enrollment_path
    end

    render 'new'
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    @enrollment.update_attributes(enrollment_params)
    @enrollment.save!

    flash[:message] = 'Your application has been updated'
    redirect_to enrollment_path(@enrollment.id)
=======
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
  end

  def show
    # We'll show it by just displaying the pre-filled form
    # as that's the fastest thing that can possibly work for MVP
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.user_id != current_user.id && !current_user.admin?
      redirect_to new_enrollment_path
    end

    if @enrollment.explicitly_submitted
      # the user has hit the send button, so they finalized
      # their end. Since it may be in review already, we make
      # it read only.

      @enrollment_read_only = true
    end

    render 'new'
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    @enrollment.update_attributes(enrollment_params)

    # Always save without validating, this ensures the partial
    # data is not lost and allows resume upload to proceed even
    # if there are missing fields (which saves hassle for the user
    # having to re-upload it)
    @enrollment.save(validate: false)

    # Only validate on the explicit click of the submit button
    # because otherwise, they are probably just saving incomplete
    # data to finish later
    unless params[:user_submit].nil?
      @enrollment.save(validate: true)
    end

    if @enrollment.errors.any?
      # errors will be displayed with the form btw
      render 'new'
      return
    else
      if params[:user_submit].nil?
        # the user didn't explicitly submit, update it and allow
        # them to continue editing
        # (this can happen if they do an intermediate save of work in progress)
        flash[:message] = 'Your application has been updated'
        redirect_to enrollment_path(@enrollment.id)
      else
        # they did explicitly submit, finalize the application and show them the
        # modified welcome message so they know to wait for us to contact them

        @enrollment.explicitly_submitted = true
        @enrollment.save! # it should still validate successfully

        # Email Abby
        StaffNotifications.new_application(@enrollment).deliver

        redirect_to welcome_path
      end
    end
  end

  def create
    @enrollment = Enrollment.create(enrollment_params)

    if @enrollment.errors.any?
      render 'new'
      return
    else
      flash[:message] = 'Your application has been saved'
      redirect_to enrollment_path(@enrollment.id)
    end
  end

  def enrollment_params
    # allow all like 60 fields without listing them all
    params.require(:enrollment).permit!
  end

end
