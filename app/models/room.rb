class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one_attached :image
  validates :name , presence: true
  validates :address , presence: true
  validates :fee , presence: true , numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user , optional: true
  has_one :reservation
  has_many :reservations 

  def self.search(search)
    if search != ""
      Room.where(['room_name LIKE(?) OR introduction LIKE(?) OR address LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end
end
