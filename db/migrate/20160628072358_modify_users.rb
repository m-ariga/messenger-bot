class ModifyUsers < ActiveRecord::Migration
  def change
    add_column :users, :sender_id, :string
  end
end
