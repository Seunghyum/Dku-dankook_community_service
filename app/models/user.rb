class User < ActiveRecord::Base
 	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 	has_many :posts
 	has_many :comments
 	
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :gender, presence: true

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
