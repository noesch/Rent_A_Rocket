class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def show?
    return true
  end

  def create?
    record.booking.user == user
  end


end
