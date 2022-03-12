class FillinDomain < ApplicationRecord
  has_many :fillin_cards, dependent: :destroy
  has_many :fillin_categories, dependent: :destroy
end
