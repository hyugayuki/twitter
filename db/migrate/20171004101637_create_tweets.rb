class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer     :user_id, null: false
      t.string      :content
      t.timestamps
    end
  end
end
