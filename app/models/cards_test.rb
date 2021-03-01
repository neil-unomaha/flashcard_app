class CardsTest < ApplicationRecord
  belongs_to :card
  belongs_to :test

  scope :unanswered, -> {where(correct: nil)}
  scope :answered, -> {where("correct IS NOT NULL")}
  scope :answered_correct, -> {where(correct: true)}

  def correct_to_s
    return "unanswered" if correct.nil?
    correct? ? "Yes" : "No"
  end

  def answered?
    !correct.nil?
  end
end
