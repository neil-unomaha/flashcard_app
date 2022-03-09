class CreateFillinDomains < ActiveRecord::Migration[6.1]
  def change
    create_table :fillin_domains do |t|
      t.string :name

      t.timestamps
    end
  end
end
