class Answer < ApplicationRecord
  belongs_to :question

  validates :answer, presence: true,
    length: {maximum: Settings.answer_content_max_length}
end
