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

  def promote
    promoted = EmployeeService.promote_to_leader(params[:id], params[:employee_id])

    render json: promoted, status: :ok
  end

  def peers
    peers = EmployeeService.get_employee_peers(params[:id])

    render json: peers, status: :ok
  end

  def subordinates
    subordinates = EmployeeService.get_subordinates(params[:id])

    render json: subordinates, status: :ok
  end

  def deep_subordinates
    deep_subordinates = EmployeeService.get_deep_subordinates(params[:id])

    render json: deep_subordinates, status: :ok
  end

  def employee_params
    params.require(:employee).permit(:email, :name, :picture)
  end
end
