class UserExam < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :questions, through: :question_answers
end
