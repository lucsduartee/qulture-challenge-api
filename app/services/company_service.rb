class CompanyService
  class << self
    def get_all_companies
      Company.all.map do |company|
        company.attributes.merge(company.employees_balance)
      end
    end

    def get_company(company_id)
      company = Company.find(company_id)
      balance = company.employees_balance

      company.attributes.merge(balance)
    end

    def create_company(company_params)
      company = Company.create(company_params)

      company.attributes.merge(company.employees_balance)
    end
  end
end
