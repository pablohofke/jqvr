class ChangeFldConfirmationToFldToConfirm < ActiveRecord::Migration
    def change
      rename_column :foos, :fld_confirmation, :fld_to_confirm
    end
end