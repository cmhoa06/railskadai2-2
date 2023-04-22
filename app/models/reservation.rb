class Reservation < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :room , optional: true

  validates :checkin_at, presence: { message: "項目を入力してください" }
  validates :checkout_at, presence: { message: "項目を入力してください" }
  validates :person_count, presence: { message: "項目を入力してください" } , numericality: {only_integer: true, greater_than: 0}

  validate :start_end_check
  

  has_one_attached :image
  def start_end_check
    if checkin_at == nil
      errors.add(:checkin_at,"開始日を入力してください")
    elsif checkout_at == nil
      errors.add(:checkout_at,"終了日を入力してください")
    elsif checkout_at < checkin_at
      errors.add(:checkout_at,"終了日は開始日以降の日付にしてください")
    end
  end

  def total_day
    total_day = (checkout_at - checkin_at).to_i
  end

  def total_price
    total_price = (total_day * person_count * room.fee)
  end

end
