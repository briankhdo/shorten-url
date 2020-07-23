class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :source
      t.string :key
      t.bigint :clicks_count
      t.bigint :user_id

      t.timestamps

      t.index :user_id
    end
  end
end
