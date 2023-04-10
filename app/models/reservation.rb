class Reservation < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :room , optional: true

  validates :checkin_at, presence: true
  validates :checkout_at, presence: true
  validates :number, presence: true
  validate :in_out_check

  has_one_attached :image
  
  def in_out_check
    if checkin_at.present? && checkout_at.present? && checkin_at > checkout_at
      errors.add(:checkout_at, "は開始日より後の日付を入力してください")
  end
end
end
