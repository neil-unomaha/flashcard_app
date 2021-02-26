class Test < ApplicationRecord
  attr_accessor :category_ids
  has_many :cards_tests
  has_many :cards, through: :cards_tests
end
