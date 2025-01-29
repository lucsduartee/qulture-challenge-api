require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  setup do
    @company = Company.create(name: "Test Company")
  end

  test "should not save employee without email" do
    employee = Employee.new(name: "John Doe", company: @company)

    assert_not employee.save, "Saved the employee without an email"
  end

  test "should not save employee without name" do
    employee = Employee.new(email: "john@example.com", company: @company)

    assert_not employee.save, "Saved the employee without a name"
  end

  test "should not save employee with duplicate email" do
    Employee.create(name: "John", email: "john@example.com", company: @company)
    employee = Employee.new(name: "Jane", email: "john@example.com", company: @company)

    assert_not employee.save, "Saved the employee with a duplicate email"
  end

  test "should not save employee with duplicate name" do
    Employee.create(name: "John Doe", email: "john@example.com", company: @company)
    employee = Employee.new(name: "John Doe", email: "jane@example.com", company: @company)

    assert_not employee.save, "Saved the employee with a duplicate name"
  end

  test "should save valid employee" do
    employee = Employee.new(name: "Doe", email: "doe@gmail.com", company: @company)

    assert employee.save, "Failed to save a valid employee"
  end

  test "should belong to a company" do
    employee = Employee.new(name: "John Doe", email: "john@example.com")

    assert_not employee.save, "Saved the employee without a company"
  end
end
