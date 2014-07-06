class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :creator, class_name: "User", foreign_key: "user_id"
  has_many    :questions
  has_many    :completions
  has_many    :takers, through: :completions
end
