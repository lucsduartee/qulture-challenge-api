class CompanyService
  class << self
    def get_all_companies
      Company.all
    end

    def get_company(company_id)
      Company.find(company_id)
    end

    def create_company(company_params)
      Company.create(company_params)
    end
  end
end
