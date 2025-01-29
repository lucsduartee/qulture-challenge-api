class CompanyTest < ActiveSupport::TestCase
  test "should not save company without a name" do
    company = Company.new
    assert_not company.save, "Saved the company without a name"
  end

  test "should save company with a name" do
    company = Company.new(name: "Test Company")
    assert company.save, "Failed to save the company with a name"
  end

  test "employees_balance should return correct counts" do
    company = Company.create(name: "Test Company")

    employee1 = Employee.create(name: "Employee 1", email: "email1", manager_id: nil, company_id: company.id)
    Employee.create(name: "Employee 2", email: "email2", manager_id: employee1.id, company_id: company.id)
    Employee.create(name: "Employee 3", email: "email3", manager_id: nil, company_id: company.id)

    company.reload

    balance = company.employees_balance

    assert_equal 3, balance[:total_employees], "Total employees count is incorrect"
    assert_equal 2, balance[:leaders_count], "Leaders count is incorrect"
    assert_equal 1, balance[:followers_count], "Followers count is incorrect"
  end
end
