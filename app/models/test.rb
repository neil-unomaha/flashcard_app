class Test < ApplicationRecord
  has_many :cards_tests
  has_many :cards, through: :cards_tests
end
