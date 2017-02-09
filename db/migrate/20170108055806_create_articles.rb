class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
