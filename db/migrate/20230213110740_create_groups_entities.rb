class CreateGroupsEntities < ActiveRecord::Migration[7.0]
  def change
    create_join_table :entities, :groups 
  end
end
