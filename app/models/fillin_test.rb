class FillinTest < ApplicationRecord
  has_many :fillin_card_tests, dependent: :destroy
  has_many :fillin_cards, through: :fillin_card_tests
end
