class Tag < ApplicationRecord
  has_many :cards_tags
  has_many :cards, through: :cards_tags
end
