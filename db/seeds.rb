# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  
  # MySQL and PostgreSQL
  #ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

c1 = Candidate.create(fullname: 'Ashley Briggs', jobtype: 'Internship', university: 'NYU', degree: 'BS', major: 'Computer Science')
c2 = Candidate.create(fullname: 'Andy Myers', jobtype: 'Full Time', university: 'Cornell University', degree: 'MS', major: 'Cyber Security', notes: 'Came highly recommended by VP Sharon Wells')
c3 = Candidate.create(fullname: 'Sarah Martin', jobtype: 'Internship; Full Time', university: 'Rutgers University', degree: 'BS', major: 'Biology', notes: 'Career changer')