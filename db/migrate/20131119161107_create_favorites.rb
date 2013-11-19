class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :brewery_id

      t.timestamps
    end
  end
end
