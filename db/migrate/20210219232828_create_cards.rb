class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.references :domain, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
