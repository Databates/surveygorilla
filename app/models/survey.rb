class Survey < ActiveRecord::Base
  validates :status, :inclusion => { 
    :in => %w(draft open closed),
    :message => "%{value} is not a valid status" 
  }

  belongs_to  :creator, class_name: "User", foreign_key: "user_id"
  has_many    :questions
  has_many    :completions
  has_many    :takers, through: :completions
end
