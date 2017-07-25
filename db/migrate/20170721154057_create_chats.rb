class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :recipient, references: :user
      t.references :sender, references: :user

      t.timestamps
    end
  end
end
