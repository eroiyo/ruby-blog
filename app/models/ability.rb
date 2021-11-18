# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    return unless user.present?

    can %i[read update destroy create], Comment, user: user
    can %i[read update destroy create], Post, user: user
    can %i[read update destroy create], Like, user: user

    return unless user.role == 'admin'

    can :manage, :all
  end
end
