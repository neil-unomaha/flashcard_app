class CreateFillinCardTests < ActiveRecord::Migration[6.1]
  def change
    create_table :fillin_card_tests do |t|
      t.references :fillin_card, null: false
      t.boolean :position_hide
      t.boolean :correct
      t.references :test, null: false

      t.timestamps
    end
  end
end
