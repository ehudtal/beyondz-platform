class Enrollment < ActiveRecord::Base

  belongs_to :user

<<<<<<< HEAD
=======
  has_attached_file :resume
  validates_attachment :resume,
                       content_type: {
                         content_type: [
                           'application/pdf',
                           'application/msword',
                           'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
                         ]
                       },
                       size: { in: 0..2.megabytes }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  validates :university, presence: true, if: "position == 'coach'"
  validates :why_bz, presence: true, if: "position == 'coach'"
  validates :personal_passion, presence: true, if: "position == 'coach'"
  validates :meaningful_experience, presence: true, if: "position == 'coach'"
  validates :teaching_experience, presence: true, if: "position == 'coach'"

  validates :current_volunteer_activities, presence: true, if: "position == 'student'"
  validates :last_summer, presence: true, if: "position == 'student'"
  validates :post_graduation_plans, presence: true, if: "position == 'student'"
  validates :why_bz, presence: true, if: "position == 'student'"
  validates :community_connection, presence: true, if: "position == 'student'"
  validates :meaningful_experience, presence: true, if: "position == 'student'"
  validates :commitments, presence: true, if: "position == 'student'"
  validates :affirm_qualified, presence: true, if: "position == 'student'"
  validates :affirm_commit, presence: true, if: "position == 'student'"
  validates :will_be_student, presence: true, if: "position == 'student'"

  # at least one "applying for" needs to be checked. For students, there's only
  # one option, so we require it
  validates :program_col_col_sjsu, presence: true, if: "position == 'student'"

  validates :reference_name, presence: true, if: "position == 'student'"
  validates :reference2_name, presence: true, if: "position == 'student'"
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
end
