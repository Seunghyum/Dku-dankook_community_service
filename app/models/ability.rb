class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
  #롤을 만들 경우 여기에서 User.new를 통해 role: 외부인 으로 설정하면 외부 session을 롤이 외부인인 유저로 인식한다. 이걸으로 조정하면 된다.
    user ||= User.new(role: '노가입') # guest user (not logged in)
    if user.role == '슈퍼관리자'
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    elsif user.role == "인액터스"
      can [:manage], [Book, BookList]
      can [:create], [Post, Comment]
      can [:update, :destroy], Post do |post|
        post.user_id == user.id
      end
      can [:update, :destroy], Comment do |comment|
        comment.user_id == user.id
      end
    elsif user.role == '일반대표' || user.role == '학생'
      can :read, BookList
      can [:create, :read, :upvote, :downvote], [Post, Comment, LectureEstimate, Locker]
      can [:update, :destroy], Post do |post|
        post.user_id == user.id
      end
      can [:update, :destroy], Comment do |comment|
        comment.user_id == user.id
      end
      if user.use_pause == false
        can [:update, :destroy], LectureEstimate do |esimate|
          esimate.user_id == user.id
        end
        can [:first_check, :lockerselect], Locker do |locker|
          locker.user_id == user.id
        end
      end
    elsif user.role == '외부인'
      if user.use_pause == false
        cannot [:index, :show], Locker
        can :home, Locker
      end
      can :read, [BookList, Book]
      can [:create, :read, :upvote, :downvote], [Post, Comment, LectureEstimate]
      can [:update, :destroy], Post do |post|
        post.user_id == user.id
      end
      can [:update, :destroy], Comment do |comment|
        comment.user_id == user.id
      end
      can [:update, :destroy], LectureEstimate do |esimate|
        esimate.user_id == user.id
      end
    else
      # can :show, [Book, BookList]
      can :home, [Locker]
    end
  end
end
