class RemoveAuthorFromEbooks < ActiveRecord::Migration[7.2]
  def change
    remove_column :ebooks, :author, :string
  end
end
