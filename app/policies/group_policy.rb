class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def update?
    user.id == record.user.id
  end
end
