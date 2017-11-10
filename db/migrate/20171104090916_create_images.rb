class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer     :tweet_id, null: false
      t.string      :file, null: false
      t.timestamps
    end
     add_index :images, :tweet_id
  end
end
