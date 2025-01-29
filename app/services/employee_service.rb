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
      reset_subordinates_manager(employee) if employee.subordinates.exists?
      employee.destroy
    end

    def promote_to_leader(leader_id, employee_id)
      leader = Employee.find(leader_id)
      employee = Employee.find(employee_id)

      EmployeePromotion.perform(leader, employee)
    end

    def get_employee_peers(employee_id)
      employee = Employee.find(employee_id)
      Employee.where(manager: employee.manager).where.not(manager_id: nil)
    end

    def get_deep_subordinates(employee_id)
      employee = Employee.find(employee_id)
      first_level_subordinates = employee.subordinates
      Employee.where(manager_id: first_level_subordinates.pluck(:id))
    end

    def get_subordinates(manager_id)
      Employee.find(manager_id).subordinates
    end

    private

    def reset_subordinates_manager(employee)
      employee.subordinates.update_all(manager_id: nil)
    end
  end
end
