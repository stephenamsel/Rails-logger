class CreateTransactionloggers < ActiveRecord::Migration
  def change
    create_table :transactionloggers do |t|
      t.string :user
      t.string :request
      t.datetime :timestamp

      t.timestamps null: false
    end
  end
end
