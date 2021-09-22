class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :code
      t.string :name
      t.string :status
      t.string :designation
      t.references :tracks
      t.timestamps
    end
  end
end
