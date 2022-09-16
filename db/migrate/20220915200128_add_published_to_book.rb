class AddPublishedToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :published, :Date
  end
end
