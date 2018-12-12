class AddThemeToWelcomeMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :welcom_messages, :theme, :string
  end
end
