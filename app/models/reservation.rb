class Reservation < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :room , optional: true

  validates :checkin_at, presence: true
  validates :checkout_at, presence: true
  validates :person_count, presence: true
  validate :start_end_check

  has_one_attached :image
  def start_end_check
    if checkin_at.present? && checkout_at.present? && checkin_at >= checkout_at
      errors.add(:checkout_at, "は開始日より後の日付を入力してください")
    end
  end

  def total_price
    total_price = (total_day * person_count * room.fee)
  end

  def total_day
    total_day = ( checkout_at - checkin_at).to_i
  end
end
