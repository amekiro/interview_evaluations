class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|

      t.timestamps
    end
  end
end
