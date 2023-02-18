class ChangeIconInGroups < ActiveRecord::Migration[7.0]
  def change
    change_column :groups, :icon, :string, default: "https://cdn.dribbble.com/users/9685/screenshots/997495/avatarzzz.gif"
  end
end
