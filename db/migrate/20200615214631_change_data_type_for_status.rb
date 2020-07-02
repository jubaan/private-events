class ChangeDataTypeForStatus < ActiveRecord::Migration[6.0]
  def change
    change_column(:appointments, :status, :string)
  end
end
