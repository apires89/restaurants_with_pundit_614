class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    #this will work for new and create
    true
  end

  def update?
    #record.user.id == current_user.id
    record.user == user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end
end
