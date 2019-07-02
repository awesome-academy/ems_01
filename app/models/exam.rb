class Exam < ApplicationRecord
  attr_accessor :score_each_question

  belongs_to :subject
  has_many :users, through: :user_exams
  has_many :exam_questions
  has_many :questions, through: :exam_questions

  validates :limited_time, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :limited_time,
    in: Settings.exam_limited_time_min..Settings.exam_limited_time_max,
    message: I18n.t("exam_limited_time_in_range")
  validates :score, presence: true, numericality: true

  enum status: {unactive: 0, active: 1}

  delegate :name, to: :subject, prefix: true
end
