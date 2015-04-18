require 'bcrypt'

class User < ActiveRecord::Base

  has_many :authored_surveys, class_name: 'Survey'
  # has_many :surveys, :through => :user_surveys

  validates :email,    presence: true
  validates :password, presence: true

  validate :email_is_an_email

 # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def email_is_an_email
    if email && !email.include?('@')
      errors.add(:email,'invalid email')
    end
  end

end
