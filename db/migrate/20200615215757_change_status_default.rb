class ChangeStatusDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :appointments, :status, 'invited'
  end
end
