class Subject < ApplicationRecord
  has_many :exams
  has_many :questions

   validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: Settings.subject_name_max_length}
  validates :description,
    length: {maximum: Settings.subject_description_max_length}

  scope :not_disable, ->{where disable: false}
end
