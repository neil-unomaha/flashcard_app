class Category < ApplicationRecord
  has_many :cards
  belongs_to :domain
end
