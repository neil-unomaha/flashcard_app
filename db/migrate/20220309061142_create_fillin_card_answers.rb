class CreateFillinCardAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :fillin_card_answers do |t|
      t.references :fillin_card, null: false
      t.integer :position
      t.text :answer

      t.timestamps
    end
  end
end
