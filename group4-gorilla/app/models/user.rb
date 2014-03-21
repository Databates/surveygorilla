class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :responses
  has_many :user_surveys
  has_many :taken_surveys,source: :survey, through: :user_surveys

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true
end



# Keep a counter going:  (survey monkey)
# def all_surveys_user_count
#     count = 0
#     self.surveys.each do |survey|
#       count += survey.users.count
#     end
#     count
#   end
# end
