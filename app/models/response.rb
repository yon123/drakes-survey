class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :survey
  has_many :answered_questions
end
