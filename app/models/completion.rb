class Completion < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :taker, class_name: "User", foreign_key: :user_id
  belongs_to :survey
end
