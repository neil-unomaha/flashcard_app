class CreateFillinCardTestUserAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :fillin_card_test_user_answers do |t|
      t.text :user_answer
      t.references :fillin_card_test, null: false
      t.references :fillin_card_answer, null: false
      t.boolean :hidden

      t.timestamps
    end
  end
end
