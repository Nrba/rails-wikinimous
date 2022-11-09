class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, unique: true, null: false
      t.text :content, unique: true, null: false

      t.timestamps
    end
  end
end
