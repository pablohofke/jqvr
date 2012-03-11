class AddAllOtherFildsToFoo < ActiveRecord::Migration
  def change
    add_column :foos, :fld_acceptance, :boolean
    add_column :foos, :fld_confirmation, :string
    add_column :foos, :fld_exclusion_in, :string
    add_column :foos, :fld_format_with, :string
    add_column :foos, :fld_format_without, :string
    add_column :foos, :fld_inclusion_in, :string
    add_column :foos, :fld_length_minimum, :string
    add_column :foos, :fld_length_maximum, :string
    add_column :foos, :fld_length_within, :string
    add_column :foos, :fld_length_in, :string
    add_column :foos, :fld_numericality, :string
    add_column :foos, :fld_numericality_only_integer, :string
    add_column :foos, :fld_numericality_greater_than, :string
    add_column :foos, :fld_numericality_greater_than_or_equal_to, :string
    add_column :foos, :fld_numericality_equal_to, :string
    add_column :foos, :fld_numericality_less_than, :string
    add_column :foos, :fld_numericality_less_than_or_equal_to, :string
    add_column :foos, :fld_numericality_odd, :string
    add_column :foos, :fld_numericality_even, :string
  end
end
