class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :code
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
