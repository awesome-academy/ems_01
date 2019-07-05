class User < ApplicationRecord
  has_many :exams, through: :user_exams

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.user_name_max_length}
  validates :email, presence: true,
    length: {maximum: Settings.user_email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user_password_min_length}

  has_secure_password

  before_save{email.downcase!}
end
