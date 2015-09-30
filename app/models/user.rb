class User < ActiveRecord::Base
  has_many :reviews
  has_many :products

  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    @user_type = user_type
    user_type == "admin"
  end
end
