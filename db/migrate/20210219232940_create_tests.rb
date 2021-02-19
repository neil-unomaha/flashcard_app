class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.boolean :question_first

      t.timestamps
    end
  end
end
