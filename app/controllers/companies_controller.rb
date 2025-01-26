class CompaniesController < ApplicationController
  # 1.2 GET /companies (Listar empresas)
  def index
  end

  # 1.3 GET /companies/:id (Pegar uma empresa)
  def show
  end

  # 1.1 POST /companies (Criar empresa)
  def create
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
