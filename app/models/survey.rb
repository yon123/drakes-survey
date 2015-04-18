class Survey < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions
  belongs_to :user
  has_many :responses
  has_many :users, through: :responses
end
