class UserPolicy < ApplicationPolicy
  def index?
    return true if user
  end

  def show?
    return true unless user
  end

  def create?
    return true
  end

  def update?
    return true if user.admin?
    return true if record.id == user.id
  end

  def destroy?
    return true if user.admin?
    return true if record.id == user.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
