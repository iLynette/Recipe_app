class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :read, :all
    return unless user.present?

    can :create, :all
    can :destroy, :all, user_id: user.id
  end
end