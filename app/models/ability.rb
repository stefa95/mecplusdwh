# frozen_string_literal: true

class Ability
      include CanCan::Ability
     
      def initialize(user)

        # Da rimuovere ?
        user ||= User.new
        
        if user.admin?
          admin_abilities
        elsif user.editor?
          editor_abilities
        elsif user.worker?
          worker_abilities
        end
        
      end
     






      private
     
      def admin_abilities
        can :manage, :all
      end

      def editor_abilities
        can :manage, Item
      end

      def worker_abilities
        can :read, Item
      end


     
#      def writer_abilities
#        can :update, Post, user: Current.user # we define Current.user in the application controller so that the ability class (which is a model) is able to pick up the currently logged in user
#      end
     
#      def editor_abilities
#        cannot :create, Post # an editor role cannot create a post
#        can :update, Post # an editor can update any post
#      end
     
  #  end






    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  
end
