class AnswerChoice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many   :responses
end
