class FillinCategory < ApplicationRecord
  belongs_to :fillin_domain
  has_many :fillin_cards, dependent: :destroy

  def test_creation_selectbox_to_s
    "#{fillin_domain.name} - #{name}"
  end
end
