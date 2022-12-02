class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  
  has_many :reservations
  has_many :rooms
  has_one_attached :image

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  attr_accessor :current_password
end
