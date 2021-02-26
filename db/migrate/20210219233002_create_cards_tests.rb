class CreateCardsTests < ActiveRecord::Migration[6.1]
  def change
    create_table :cards_tests do |t|
      t.references :card, null: false
      t.references :test, null: false
      t.boolean :correct

      t.timestamps
    end
  end
end
