require "#{Rails.root}/app/usecases/employee_creation"

class EmployeeService
  class << self
    def get_employees_by_company(company_id)
      Company.find(company_id).employees
    end

    def create_employee_by_company(company_id, employee_params)
      company = Company.find(company_id)

      EmployeeCreation.perform(company, employee_params)
    end

    def destroy_employee(employee_id)
      employee = Employee.find(employee_id)
      employee.destroy
    end
  end
end
