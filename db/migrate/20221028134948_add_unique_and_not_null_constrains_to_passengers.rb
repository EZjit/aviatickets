class AddUniqueAndNotNullConstrainsToPassengers < ActiveRecord::Migration[7.0]
  def change
    change_table :passengers do |t|
      t.index :email, unique: true
    end
    change_column_null(:passengers, :email, false)
    change_column_null(:passengers, :name, false)
  end
end
