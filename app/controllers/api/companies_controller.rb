class Api::CompaniesController < ApplicationController
  def index
    companies = CompanyService.get_all_companies
    render json: companies, status: :ok
  end

  def show
    company = CompanyService.get_company(params[:id])
    render json: company, status: :ok
  end

  def create
    company = CompanyService.create_company(company_params)
    render json: company, status: :created
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
