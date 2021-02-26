class Card < ApplicationRecord
  belongs_to :domain
  belongs_to :category
  has_many :cards_tags, dependent: :destroy
  has_many :tags, through: :cards_tags
  has_many :cards_tests, dependent: :destroy

  has_rich_text :front
  has_rich_text :back
end
