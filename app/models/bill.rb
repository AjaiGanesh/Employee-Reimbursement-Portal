class Bill < ApplicationRecord
  belongs_to :employee

  validates :amount, presence: true, numericality: { only_numeric: true}

end
