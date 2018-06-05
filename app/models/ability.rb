class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.is_admin
      can :manage, Techbit
      can :manage, User
    else
      can :manage, Techbit
    end
  end
end
