class Employee < ApplicationRecord
  belongs_to :company

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
