class InitCategories < ActiveRecord::Migration[6.1]
  def up
    d = Domain.find_or_create_by(name: 'CISSP')
    Category.create(domain: d, name: '1. Security and Risk Management')
    Category.create(domain: d, name: '2. Asset Security')
    Category.create(domain: d, name: '3. Security Architecture and Engineering')
    Category.create(domain: d, name: '4. Communication and Network Security')
    Category.create(domain: d, name: '5. Identity and Access Management')
    Category.create(domain: d, name: '6. Security Assessment Tools')
    Category.create(domain: d, name: '7. Security Operations')
    Category.create(domain: d, name: '8. Software Development Security')
  end

  def down
    Category.destroy_all
  end
end
