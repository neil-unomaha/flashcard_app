class FillinDomain < ApplicationRecord
  has_many :fillin_cards
  has_many :fillin_categories
end
