class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
      can :create, Like
      can :destroy, Post do |post|
        post.user_id == user.id
      end
      can :destroy, Comment do |comment|
        comment.user_id == user.id
      end
    end
  end
end
