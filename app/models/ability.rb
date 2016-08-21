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
      can :read, [Book, BookList]
      if user.use_pause == false
        can [:create, :read, :upvote, :downvote, :index], [Post, Comment, LectureEstimate, Locker]
        can [:update, :destroy], Post do |post|
          post.user_id == user.id
        end
        can [:update, :destroy], Comment do |comment|
          comment.user_id == user.id
        end
        can [:upvote, :downvote], Professor do |professor|
          professor.votes.each do |puser|
            if puser.voter_id == user.id
              return true
            end
          end
        end
      end
      if user.use_pause == false && user.certification == true
        can [:first_check, :lockerselect, :destroy, :update, :selecting_page, :result], [Locker]
        can [:destroy], UsedBook do |used_book|
          used_book.user_id == user.id
        end
        can [:update, :destroy], LectureEstimate do |esimate|
          esimate.user_id == user.id
        end
      end
    elsif user.role == '외부인'
      can :read, [BookList, Book]
      if user.use_pause == false
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
      end
      if user.use_pause == false && user.certification == true
        cannot [:index, :show], Locker
        can :home, Locker
      end
    else

    end
  end
end
