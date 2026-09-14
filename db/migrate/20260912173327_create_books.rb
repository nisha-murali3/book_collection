class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
