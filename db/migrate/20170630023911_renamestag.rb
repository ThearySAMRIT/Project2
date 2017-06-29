class Renamestag < ActiveRecord::Migration[5.1]
  def change
       rename_table :tages, :tags
   end
end
