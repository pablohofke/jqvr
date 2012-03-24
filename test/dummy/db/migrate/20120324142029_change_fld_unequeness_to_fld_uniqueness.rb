class ChangeFldUnequenessToFldUniqueness < ActiveRecord::Migration
  def change
    rename_column :foos, :fld_unequeness, :fld_uniqueness
  end
end