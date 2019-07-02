class QuestionOption < ApplicationRecord
  belongs_to :question

  validates :content, presence: true,
    length: {maximum: Settings.question_content_max_length}
end
