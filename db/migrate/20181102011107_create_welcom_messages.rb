class CreateWelcomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :welcom_messages do |t|
      t.text :message
      t.string :client
      t.string :colour

      t.timestamps
    end
  end
end
