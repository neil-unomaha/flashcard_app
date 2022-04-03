class Category < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :domain

  def test_creation_selectbox_to_s
    "#{domain.name} - #{name}"
  end
end
