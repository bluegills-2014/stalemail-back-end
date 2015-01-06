class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :subject
      t.string :sender
      t.date :created_at
      t.text :message

      t.timestamps
  end
end
