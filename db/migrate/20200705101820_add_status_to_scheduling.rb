class AddStatusToScheduling < ActiveRecord::Migration[6.0]
  def change
    add_column :schedulings, :status, :integer

  end
end
