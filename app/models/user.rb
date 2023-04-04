class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :visits, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
        #  :recoverable

  def email_required?
    false
  end 
end
