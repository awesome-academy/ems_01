class Answer < ApplicationRecord
  has_many :questions, through: :question_answers
end
