class Exam < ApplicationRecord
  belongs_to :subject
  has_many :users, through: :user_exams
  has_many :questions, through: :exam_questions
end
