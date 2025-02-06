class CreateEbooks < ActiveRecord::Migration[7.2]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :isbn
      t.decimal :price

      t.timestamps
    end
  end
end
