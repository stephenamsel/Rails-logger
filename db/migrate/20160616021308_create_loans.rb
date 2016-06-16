class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.decimal :amount
      t.date :enddate

      t.timestamps null: false
    end
  end
end
