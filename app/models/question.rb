class Question < ApplicationRecord
  belongs_to :subject
  has_many :exams, through: :exam_questions
  has_many :answers
  has_many :user_exams, through: :question_answers

  validates :content, presence: true,
    length: {maximum: Settings.question_content_max_length}
  validates :question_type, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type: {single: 0, multi: 1}
end
