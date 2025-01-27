class EmployeeCreation
  include UseCase

  def initialize(company, params)
    @company = company
    @name = params[:name]
    @email = params[:email]
    @picture = params[:picture]
  end

  def perform
    validate_params
    create_employee
  end

  private

  attr_reader :name, :email, :picture, :company

  def validate_params
    raise ArgumentError, "Company is required" if company.blank?
    raise ArgumentError, "Name is required" if name.blank?
    raise ArgumentError, "Email is required" if email.blank?
    raise ArgumentError, "Picture is required" if picture.blank?
  end

  def create_employee
    Employee.create!(
      name: name,
      email: email,
      picture: picture,
      company: company,
    )
  end
end
