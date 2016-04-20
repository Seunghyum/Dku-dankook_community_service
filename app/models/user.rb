class User < ActiveRecord::Base
 	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 	has_many :posts
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :gender, presence: true
  
 	belongs_to :major, inverse_of: :users
 	#inverse_of는 메모리에 정보가 남아있는 경우 그것을 가져다 쓰기 때문에 db를 들리지 않아도 되어서 효율적인 방법.

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
