class CreateOpenings < ActiveRecord::Migration[6.1]
  def change
    create_table :openings do |t|
      t.string :firstname
      t.string :lastname
      t.string :geid
      t.boolean :program      
      t.text :description
      t.text :responsibility
      t.text :qualification
      t.text :level, default: [].to_yaml
      t.string :position
      t.string :status
      t.timestamps
    end
  end

  
end
