class CardsTest < ApplicationRecord
  belongs_to :card
  belongs_to :test


  def correct_to_s
    return "unanswered" if correct.nil?
    correct? ? "Yes" : "No"
  end
end
