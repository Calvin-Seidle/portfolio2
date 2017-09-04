class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :subject
      t.text :body
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
