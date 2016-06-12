class User < ActiveRecord::Base
 	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_one :locker
 	has_many :posts
 	has_many :comments
  belongs_to :major

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :gender, presence: true, 
            inclusion: { in: %w(남자 여자) }
  validate :validate_username

  #투표자
  acts_as_voter
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
