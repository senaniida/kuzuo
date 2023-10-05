class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :pointa
      t.integer :pointb
      t.integer :pointc
      t.string :genre

      t.timestamps
    end
  end
end
