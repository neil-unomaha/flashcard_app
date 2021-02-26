class AddColumnDomainIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :domain
  end
end
