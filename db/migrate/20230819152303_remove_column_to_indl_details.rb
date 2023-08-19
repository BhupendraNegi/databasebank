class RemoveColumnToIndlDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :indl_details, :dt_of_tos_in_unit, :string
  end
end
