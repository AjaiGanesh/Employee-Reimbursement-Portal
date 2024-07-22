class Department < ApplicationRecord
  has_many :employeee, dependent: :destroy
end
