class Test < ApplicationRecord
  attr_accessor :category_ids
  has_many :cards_tests, dependent: :destroy
  has_many :cards, through: :cards_tests

  def cards_correct
    count = 0
    cards_tests.each {|ct| count += 1 if ct.correct? }
    count
  end

  def total_cards
    cards_tests.size
  end

  def test_not_started?
    return true if cards_tests.all? {|ct| ct.correct.nil?}
  end
end
