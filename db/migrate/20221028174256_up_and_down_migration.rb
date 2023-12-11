class UpAndDownMigration < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :gender, 'boolean USING CAST(gender AS boolean)'
  end
end
