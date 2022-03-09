class AddColDomainIdToFillinCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :fillin_categories, :fillin_domain
  end
end
