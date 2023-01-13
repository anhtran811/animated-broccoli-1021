class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :doctors, :university, :education
  end
end
