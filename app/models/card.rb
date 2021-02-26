class Card < ApplicationRecord
  belongs_to :domain
  belongs_to :category
  has_many :cards_tags
  has_many :tags, through: :cards_tags

  has_rich_text :front
  has_rich_text :back
end
