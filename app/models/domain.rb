class Domain < ApplicationRecord
  has_many :cards
  has_many :categories
end
