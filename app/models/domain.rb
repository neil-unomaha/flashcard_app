class Domain < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :categories, dependent: :destroy
end
