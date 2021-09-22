class CreateInternetUsages < ActiveRecord::Migration[6.1]
  def change
    create_table :internet_usages do |t|
      t.text :region
      t.integer :year
      t.decimal :percentage
      t.text :source

      t.timestamps
    end
  end
end
