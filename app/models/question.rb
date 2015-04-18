class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many :answers
  has_many :answered_questions

  validates :question, presence: true
end
