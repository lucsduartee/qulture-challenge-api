class EmployeePromotion
  include UseCase

  def initialize(manager, employee)
    @manager = manager
    @employee = employee
  end

  def perform
    validate

    promote_to_leader
  end

  private

  attr_reader :manager, :employee

  def validate
    validate_same_company
    validate_already_has_manager
    validate_no_hierarchy_loop
  end

  def validate_same_company
    if manager.company_id != employee.company_id
      raise ArgumentError, "Manager and employee must belong to the same company"
    end
  end

  def validate_already_has_manager
    if employee.manager.present?
      raise ArgumentError, "Employee already has a manager"
    end
  end

  def validate_no_hierarchy_loop
    current = manager

    while current
      if current == employee
        raise ArgumentError, "Cannot create hierarchy loop"
      end
      current = current.manager
    end
  end

  def promote_to_leader
    employee.update!(manager: manager)
  end
end
