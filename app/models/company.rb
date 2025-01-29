class Company < ApplicationRecord
  has_many :employees

  validates :name, presence: true

  def employees_balance
    total_employees = employees.count
    leaders_count = employees.where(manager_id: nil).count
    followers_count = total_employees - leaders_count

    {
      total_employees: total_employees,
      leaders_count: leaders_count,
      followers_count: followers_count
    }
  end
end
