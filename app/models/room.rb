class Room < ApplicationRecord
    has_one_attached :image
    has_one :reservation
    belongs_to :user

    validates :title, :introduction, :price, :address, presence: true
end

