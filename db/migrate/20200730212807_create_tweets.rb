class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text
      t.references :author

      t.timestamps
    end
    add_foreign_key :tweets, :users, column: :author_id
  end
end
