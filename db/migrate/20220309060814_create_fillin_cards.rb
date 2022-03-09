class CreateFillinCards < ActiveRecord::Migration[6.1]
  def change
    create_table :fillin_cards do |t|

      t.references :fillin_domain, null: false
      t.references :fillin_category, null: false
      t.timestamps
    end
  end
end
