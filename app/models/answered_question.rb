class AnsweredQuestion < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :response
  belongs_to :answer
  has_many :questions, through: :answers
end
