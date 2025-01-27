class EmployeeService
  class << self
    def get_employees_by_company(company_id)
      Company.find(company_id).employees
    end

    def create_employee_by_company(company_id, employee_params)
      company = Company.find(company_id)

      Employee.create(
        email: employee_params[:email],
        name: employee_params[:name],
        picture: employee_params[:picture],
        company: company,
      )
    end

    def destroy_employee(employee_id)
      employee = Employee.find(employee_id)
      employee.destroy
    end
  end
end
