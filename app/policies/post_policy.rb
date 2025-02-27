class PostPolicy < ApplicationPolicy
  def index?
    true 
  end

  def show?
    true 
  end

  def create?
    user.present? 
  end

  def new?
    create?
  end

  def update?
    user.present? && record.author_id == user.id 
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && record.author_id == user.id
  end
end
