class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    user ||= Usuario.new    

    if user.es_admin?
      can :manage, :all
    else
      can :crud, Post, usuario_id: user.id
      can :read, Post
    end
  end
end
