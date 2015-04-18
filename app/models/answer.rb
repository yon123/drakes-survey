class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answered_questions

  validates :answer, presence: true
end
