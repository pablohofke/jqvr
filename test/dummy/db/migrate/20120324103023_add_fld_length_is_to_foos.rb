class AddFldLengthIsToFoos < ActiveRecord::Migration
  def change
    add_column :foos, :fld_length_is, :string
  end
end
