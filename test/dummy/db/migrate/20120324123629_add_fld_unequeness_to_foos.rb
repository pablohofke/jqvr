class AddFldUnequenessToFoos < ActiveRecord::Migration
  def change
    add_column :foos, :fld_unequeness, :string
  end
end
