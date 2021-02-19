class CreateCardsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cards_tags do |t|
      t.references :card, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
