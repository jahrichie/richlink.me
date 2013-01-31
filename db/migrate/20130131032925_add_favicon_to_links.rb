class AddFaviconToLinks < ActiveRecord::Migration
  def change
    add_column :links, :favicon, :text
  end
end
