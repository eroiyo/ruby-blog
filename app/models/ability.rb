# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    return unless user.present?

    can :manage, :all, user: user
    
    return unless user.role == 'admin'
    can :manage, :all
  end
end
