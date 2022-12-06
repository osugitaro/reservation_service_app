class Reservation < ApplicationRecord
    belongs_to :room, optional: true
    belongs_to :user

    validates :start_date, :end_date, :number_of_people, presence: true

    validate :cannot_day_past
    validate :start_end_check


    def cannot_day_past
    if start_date.past?
        errors.add(:base, "開始日は今日よりも前の日付を選ぶことはできません。")
    elsif end_date.past?
        errors.add(:base, "終了日は今日よりも前の日付を選ぶことはできません。")
    end
    end


    def start_end_check
    if self.start_date > self.end_date
        errors.add(:base, "開始日は終了日よりも後の日付を選ぶことはできません。")
    end
    end

end
