class User < ApplicationRecord
  has_many :exams, through: :user_exams
end
