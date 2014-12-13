class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :title
      t.text :keywords
      t.string :url
      t.float :rating

      t.timestamps
    end
  end
end
