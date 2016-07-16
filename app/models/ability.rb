class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
  #롤을 만들 경우 여기에서 User.new를 통해 role: 외부인 으로 설정하면 외부 session을 롤이 외부인인 유저로 인식한다. 이걸으로 조정하면 된다.
    user ||= User.new(role: '외부인') # guest user (not logged in)
    if user.role == '슈퍼관리자'
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    elsif user.role == "인액터스"
      can [:manage], [Book, BookList]
      can [:create], [Post, Comment, LectureEstimate, Locker]
      can [:update, :destroy], Post do |post|
        post.user_id == user.id
      end
      can [:update, :destroy], Comment do |comment|
        comment.user_id == user.id
      end
    elsif user.role == '일반대표' || user.role == '학생'
      can [:create], [Post, Comment, LectureEstimate, Locker]
      can [:update, :destroy], Post do |post|
        post.user_id == user.id
      end
      can [:update, :destroy], Comment do |comment|
        comment.user_id == user.id
      end
      can [:update, :destroy], LectureEstimate do |esimate|
        esimate.user_id == user.id
      end
      can [:first_check, :lockerselect], Locker do |locker|
        locker.user_id == user.id
      end
    else
      can :home, [Locker]
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
