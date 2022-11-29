class DeleteIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :passengers, :email
  end
end
