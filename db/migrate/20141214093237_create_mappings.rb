class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :meme_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
