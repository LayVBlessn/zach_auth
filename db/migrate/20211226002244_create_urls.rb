class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :long_url, null: false, index: {unique: true}
      t.string :key, null: false
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
