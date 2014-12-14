class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :key
      t.integer :meme_id

      t.timestamps
    end
  end
end
