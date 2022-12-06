class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable


  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_one_attached :image

  validates :name, :email, presence: true, on: :create
  validates :password, length: {minimum: 6}, on: :create


  attr_accessor :current_password
end
