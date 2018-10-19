class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.timestamp :shipped_at
      t.timestamps
    end
  end
end
