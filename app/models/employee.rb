class Employee < ApplicationRecord
  belongs_to :department
  has_many :bills, dependent: :destroy

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]{2,20}\z/, message: "Required condition not met" }
  validates :last_name, format: { with: /\A[a-zA-Z]{2,20}\z/, message: "Required condition not met" }, allow_blank: true
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: 'Address is Already Registered !' }, format: { with: /\A[^@\s]+@[^@\s]+\z/i }
  validates :designation, presence: true, format: { with: /\A[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}\z/i }

  def full_name
    "#{first_name} #{last_name}"
  end
end
