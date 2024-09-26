class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable

  validates :password, presence: true, length: { in: 8..32 }
  validates :name, presence: true
  validates :birthday, presence: true
  validates :address, presence: true
  
  has_many :posts, dependent: :nullify 
  
end
