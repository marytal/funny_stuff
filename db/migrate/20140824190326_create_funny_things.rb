class CreateFunnyThings < ActiveRecord::Migration
  def change
    create_table :funny_things do |t|
      t.string :url
      t.integer :friend_id

      t.timestamps
    end
  end
end
