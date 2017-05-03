class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    user ||= Usuario.new    

    if user.es_admin?
      can :manage, :all
    else
      if user.email.blank? # si no hay nada en email es porque es un usuario invitado
        can :read, Post
      else
        can :crud, Post, usuario_id: user.id
      end
    end
  end
end
