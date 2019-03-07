class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :status
      t.string :email
      t.text :password
      t.boolean :is_private

      t.timestamps
    end
  end
end
