class CreateOpenings < ActiveRecord::Migration[6.1]
  def change
    create_table :openings do |t|
      t.string :firstname
      t.string :lastname
      t.text :qualification
      t.string :level
      t.string :position
      t.string :status
      t.timestamps
    end
  end
end
