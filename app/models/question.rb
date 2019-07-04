class Question < ApplicationRecord
  belongs_to :subject
  has_many :exams, through: :exam_questions
  has_many :answers, through: :question_answers
  has_many :user_exams, through: :question_answers
end
