class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :order, foreign_key: true
      t.references :widget, foreign_key: true
      t.integer :quantity, null: false, default: 0
      t.integer :unit_price, null: false

      t.timestamps
    end
  end
end
