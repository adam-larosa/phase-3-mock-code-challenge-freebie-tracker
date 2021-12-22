class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
    create_table :freebies do |t|
      t.belongs_to :dev
      t.references :company
      t.string :item_name
      t.integer :value

    end
  end
end
