class User < ActiveRecord::Base
 	attr_accessor :login

  # mount_uploader :profile, ProfileUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :lecture_estimates
 	has_many :posts
  has_many :bloging
 	has_many :comments
  has_many :books, through: :bookables
# #사물함의 경우 개념상 has_one이지만 모델에서 조건을 줘서 1개로 제어하면 됨.
#   has_many :locker, through: :locker_particulars
#   has_many :locker_particulars

  belongs_to :major
  validates :username, :email, uniqueness: true
  # , presence: true
  # validates :gender, presence: true,
  #           inclusion: { in: %w(남자 여자) }
  validates_uniqueness_of :lnum, allow_blank: true, scope: [:major_id]
  validate :validate_username

  # after_save :check_gender
  #투표자
  acts_as_voter
  #태그자
  acts_as_tagger

  #로그인시 서로의 username과 email이 같은 유저 발생시 예외처리
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # active_admin
  def role?(r)
    role.include? "슈퍼관리자"
  end

  #username으로 로그인할 수있게 만들기
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # def check_gender
  #   if self.gender == "여성"
  #     self.update_column(:gender, "여성")
  #   else
  #     self.update_column(:gender, "남성")
  #   end
  # end

# 페이스북 start
  def self.find_for_facebook_oauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.profile = auth.info.image # assuming the user model has an image
    end
    # 이 때는 이상하게도 after_create 콜백이 호출되지 않아서 아래와 같은 조치를 했다.
    # user.add_role :user if user.roles.empty?
    # user   # 최종 반환값은 user 객체이어야 한다.
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
#페이스북 end

end
