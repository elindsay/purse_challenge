class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.date :earliest_deliver
      t.date :deliver_by

      t.timestamps

    end
  end
end
