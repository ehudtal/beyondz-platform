require 'csv'

class Admin::EnrollmentsController < Admin::ApplicationController
  def index
    @enrollments = Enrollment.all
    respond_to do |format|
      format.html { render }
      format.csv { render text: csv_export }
<<<<<<< HEAD
      format.xls { render text: @enrollments.to_xls }
=======
      format.xls { send_data(@enrollments.to_xls) }
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
    end
  end

  def show
    # We'll just reuse the form to display the data as a simple MVP,
    # punting this task back to the main enrollments controller which
    # knows how to do it
    redirect_to enrollment_path(params[:id])
  end

  private

  def csv_export
    CSV.generate do |csv|
<<<<<<< HEAD
      header = Array.new
      header << Enrollment.column_names
      csv << header
      @enrollments.each do |e|
        exportable = Array.new
        exportable << e.attributes.values_at(*Enrollment.column_names)
=======
      header = *Enrollment.column_names
      header << 'Uploaded Resume'
      csv << header
      @enrollments.each do |e|
        exportable = e.attributes.values_at(*Enrollment.column_names)
        if e.resume.present?
          exportable << e.resume.url
        else
          exportable << '<none uploaded>'
        end
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
        csv << exportable
      end
    end
  end
end
