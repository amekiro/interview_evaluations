class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.text :address
      t.text :designation, default: [].to_yaml
      t.text :exam, default: [].to_yaml

      t.string :university1
      t.string :degree1
      t.string :major1
      t.string :minor1
      t.integer :gradyr1
      t.string :university2
      t.string :degree2
      t.string :major2
      t.string :minor2
      t.integer :gradyr2
      
      t.string :status
      t.boolean :progint
      t.integer :appid
      t.text :recruiternotes

      t.timestamps
    end
  end
end
