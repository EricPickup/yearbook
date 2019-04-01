class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :college
      t.string :relationship
      t.string :location

      t.timestamps
    end
  end
end
