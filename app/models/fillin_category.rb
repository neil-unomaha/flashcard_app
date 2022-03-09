class FillinCategory < ApplicationRecord
  belongs_to :fillin_domain
  has_many :fillin_cards
end
