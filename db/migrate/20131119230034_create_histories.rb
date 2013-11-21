class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :brewery_id
      t.integer :userID

      t.timestamps
    end
  end
end
