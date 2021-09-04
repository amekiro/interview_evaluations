class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      # Employee Details
      t.string :geid
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :designation
      t.string :des1
      t.integer :year1
      t.string :des2
      t.integer :year2
      t.string :des3
      t.integer :year3
      t.string :des4
      t.integer :year4
      t.text :globcom
      t.text :confcom

      # Work Details
      t.string :manfn
      t.string :manln
      t.string :manemail
      t.string :offfn
      t.string :offln
      t.string :offemail
      t.string :lob
      t.string :sublob
      t.string :dep
      t.string :div
      t.string :subdiv
      t.string :sec
      t.string :location
      t.date :hire
      t.date :program
      t.boolean :participant
      t.boolean :employee
      t.date :term
      t.string :replace
      t.date :examstd
      t.decimal :passrate
      t.string :fsa

      # Confidential Data
      t.integer :datayr
      t.integer :salaryc
      t.integer :salaryc1
      t.integer :salaryc2
      t.integer :salaryc3
      t.integer :bonus
      t.integer :bonus1
      t.integer :bonus2
      t.integer :bonus3
      t.string :rating
      t.string :rating1
      t.string :rating2
      t.string :rating3
      
      t.timestamps
    end
  end
end
