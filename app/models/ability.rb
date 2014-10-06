class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all if user.role == 'admin'

    if user.role == 'artist'
      can :manage, Item, user_id: user.id
      can :project, Item
      can :modify, Projection
    end

  end
end
