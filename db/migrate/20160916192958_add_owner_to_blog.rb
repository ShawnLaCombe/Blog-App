class AddOwnerToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :owner, :string
  end
end
