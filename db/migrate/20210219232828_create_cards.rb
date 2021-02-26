class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.references :domain, null: false
      t.references :category, null: false
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
