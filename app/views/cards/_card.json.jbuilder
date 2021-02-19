json.extract! card, :id, :name, :domain_id, :category_id, :question, :answer, :created_at, :updated_at
json.url card_url(card, format: :json)
