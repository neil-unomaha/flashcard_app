class CreateCardsTests < ActiveRecord::Migration[6.1]
  def change
    create_table :cards_tests do |t|
      t.references :card, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end
