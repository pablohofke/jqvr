class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string :fld_presence

      t.timestamps
    end
  end
end
