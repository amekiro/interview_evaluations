class CreateDesignations < ActiveRecord::Migration[6.1]
  def change
    create_table :designations do |t|
      t.string :code
      t.string :designation
      t.timestamps
    end
  end
end
