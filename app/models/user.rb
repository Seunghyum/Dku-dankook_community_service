class User < ActiveRecord::Base
 	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lecture_estimates
 	has_many :posts
 	has_many :comments
  has_many :books, through: :bookables
#사물함의 경우 개념상 has_one이지만 모델에서 조건을 줘서 1개로 제어하면 됨.
  has_many :locker, through: :locker_particulars
  has_many :locker_particulars

  belongs_to :major
  validates :username, :email, uniqueness: true, presence: true
  validates :gender, presence: true,
            inclusion: { in: %w(남자 여자) }
  validates_uniqueness_of :lnum, allow_blank: true, scope: [:major_id]
  validate :validate_username

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
end
