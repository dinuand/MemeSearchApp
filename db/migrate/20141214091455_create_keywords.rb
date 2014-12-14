class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :key

      t.timestamps
    end
  end
end
