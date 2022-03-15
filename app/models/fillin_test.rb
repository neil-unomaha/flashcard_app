class FillinTest < ApplicationRecord
  attr_accessor :fillin_category_ids
  has_many :fillin_card_tests, dependent: :destroy
  has_many :fillin_cards, through: :fillin_card_tests

  accepts_nested_attributes_for :fillin_card_tests


  def fillin_cards_correct
    count = 0
    fillin_card_tests.each {|fct| count += 1 if fct.correct? }
    count
  end

  def fillin_total_cards
    fillin_card_tests.size
  end

  def test_not_started?
    return true if fillin_card_tests.all? {|fct| fct.correct.nil?}
  end

  def completed?
    return true if fillin_card_tests.all? {|fct| fct.correct != nil }
  end

  def at_least_one_card_incorrect?
    return if !completed?
    return true if fillin_card_tests.any? {|fct| fct.correct == false }
  end

  def generate_next_question
    fillin_card_tests.unanswered.to_a.shuffle.first
  end

  def all_answered?
    fillin_card_tests.all?(&:answered?)
  end
end
