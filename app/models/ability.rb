class Ability
  include CanCan::Ability

  def initialize(user)


       if user
         can :manage, Project,        user_id: user.id
         can :manage, Task,           project: {user_id: user.id}
         can :manage, Comment,        task:    {project: {user_id: user.id}}
         can :manage, FileAttachment, comment: {task: {project: {user_id: user.id}}}
       else
         can :manage, :all

       end
  end
end
