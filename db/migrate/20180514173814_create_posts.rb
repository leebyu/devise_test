class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end

    add_index(:posts, :user_id)

    # add_index(table name, attribute name to add)
  end
end
