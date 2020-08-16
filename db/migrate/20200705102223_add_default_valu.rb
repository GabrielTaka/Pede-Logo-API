class AddDefaultValu < ActiveRecord::Migration[6.0]
  def change
    change_column :schedulings, :status, :integer, :default => 0
  end
end
