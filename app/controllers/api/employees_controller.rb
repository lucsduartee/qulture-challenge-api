class Api::EmployeesController < ApplicationController
  def index
    employees = EmployeeService.get_employees_by_company(params[:company_id])

    render json: employees, status: :ok
  end

  def create
    employee = EmployeeService.create_employee_by_company(params[:company_id], employee_params)

    render json: employee, status: :created
  end

  def destroy
    employee = EmployeeService.destroy_employee(params[:id])

    render json: employee, status: :ok
  end

  def employee_params
    params.require(:employee).permit(:email, :name, :picture)
  end
end
