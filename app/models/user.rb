class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :exams, through: :user_exams

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.user_name_max_length}
  validates :email, presence: true,
    length: {maximum: Settings.user_email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user_password_min_length}, allow_nil: true

  has_secure_password

  before_save{email.downcase!}

  enum role: {trainee: 0, supervisor: 1, admin: 2}

  class << self
    def digest string
      cost =
        if ActiveModel::SecurePassword.min_cost
          BCrypt::Engine::MIN_COST
        else
          BCrypt::Engine.cost
        end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? remember_token
    return false unless remember_digest
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def send_account_info_email user
    UserMailer.new_user_account(user).deliver_now
  end
end
