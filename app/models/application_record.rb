class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :sort_created_desc, ->{order created_at: :desc}
end
