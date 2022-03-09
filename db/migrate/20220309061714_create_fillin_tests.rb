class CreateFillinTests < ActiveRecord::Migration[6.1]
  def change
    create_table :fillin_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
