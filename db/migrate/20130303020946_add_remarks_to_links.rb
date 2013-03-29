class AddRemarksToLinks < ActiveRecord::Migration
  def change
    add_column :links, :remarks, :text
  end
end
