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

d1 = Designation.create(code: "ACT001", designation: "SOA, Pre-Associate, ADP")
d2 = Designation.create(code: "ACT002", designation: "SOA, Associate, ADP")
d3 = Designation.create(code: "ACT003", designation: "SOA, Fellow")
d4 = Designation.create(code: "ACT004", designation: "SOA, Associate")

p1 = Participant.create(
  geid: '3159235', firstname: 'Anthony', lastname: 'Myers', email: 'a.myers@email.com', designation: d3,
  des1: 'FSA', year1: 2005, des2: 'CERA', year2: 2003, des3: 'ASA', year3: 2002, des4: 'FIA', year4: '1999',
  manfn: 'Karin', manln: 'Humphrey', manemail: 'k.humphrey@email.com', offfn: 'Mika', offln: 'Yuslav', offemail: 'm.yuslav@email.com',
  title: 'Actuary', lob: 'Audit', sublob: 'Internal Audit', dep: 'Actuarial', div: 'Actuarial', subdiv: 'Actuarial', sec: 'Actuarial',
  location: 'Cary, NC', hire: Date.new(2000, 3, 5), program: Date.new(2000, 3, 5), participant: "Inactive", employee: "Active",
  replace: 'Replaced', examstd: Date.new(2005, 6, 30), fsa: "CFE",
  datayr: 2005, salaryc: 130000, salaryc1: 120000, salaryc2: 100000, salaryc3: 80000,
  bonus: 1200, bonus1: 1000, bonus2: 1000, bonus3: 800,
  rating: 3, rating1: 4, rating2: 3, rating3: 1
)

p2 = Participant.create(
  geid: '3458234', firstname: 'Annie', lastname: 'Kaplan', email: 'a.kaplan@email.com', designation: d1,
  manfn: 'Anthony', manln: 'Myers', manemail: 'a.myers@email.com', offfn: 'Mika', offln: 'Yuslav', offemail: 'm.yuslav@email.com',
  title: 'Actuarial Student', lob: 'Audit', sublob: 'Internal Audit', dep: 'Actuarial', div: 'Actuarial', subdiv: 'Actuarial', sec: 'Actuarial',
  location: 'Tampa, FL', hire: Date.new(2016, 12, 3), program: Date.new(2018, 5, 5), participant: "Active", employee: "Active",
  replace: 'N/A', examstd: Date.new(2022, 12, 31),
  datayr: 2021, salaryc: 68000, salaryc1: 66000, salaryc2: 65000, salaryc3: 63000,
  bonus: 800, bonus1: 500, bonus2: 600, bonus3: 500,
  rating: 3, rating1: 2, rating2: 3, rating3: 3
)

p3 = Participant.create(
  geid: '3254643', firstname: 'Kerri', lastname: 'McLoughlin', email: 'k.mcloughlin@email.com', designation: d2,
  des1: 'ASA', year1: 2018,
  manfn: 'Joseph', manln: 'Connelly', manemail: 'j.connelly@email.com', offfn: 'Carleton', offln: 'Lopez', offemail: 'c.lopez@email.com',
  title: 'Actuarial Associate', lob: 'Pricing', sublob: 'Dental and Disability', dep: 'Disability', div: 'Actuarial', subdiv: 'Actuarial', sec: 'Actuarial',
  location: 'New York, NY', hire: Date.new(2005, 11, 6), program: Date.new(2005, 11, 6), participant: "Inactive", employee: "Inactive",
  term: Date.new(2020, 11, 20), replace: 'Pending', examstd: Date.new(2020, 12, 31), fsa: "QFI",
  datayr: 2020, salaryc: 120000, salaryc1: 110000, salaryc2: 105000, salaryc3: 90000,
  bonus: 1000, bonus1: 700, bonus2: 800, bonus3: 600,
  rating: 4, rating1: 2, rating2: 3, rating3: 2
)

progDes = 'This position is an opening for our program. We provide addtional benefits and a rotation program to develop well rounded employees.'
progRes = 'The employee is expected to complete certain requirements in a specific time frame.'
internDes = 'We provide an internship program as a pipeline towards full time employment.'
internRes = 'The intern will be assigned to a team and get real life experience.'

o1 = Opening.create(
  firstname: 'Anthony', lastname: 'Myers', geid: '3159235', program: false, 
  description: 'This is a very challening position where the employee will be coordinating with high level managers all across the world.',
  responsibility: '- Coordinate with high level managers around the world\r\n- Develop new procedures to make all steps efficient',
  qualification: '- VBA\r\n- SQL',
  level: ["Recent Associate"], position: 'Full Time', status: 'Draft'
)

o2 = Opening.create(
  firstname: 'Anthony', lastname: 'Myers', geid: '3159235', program: true,
  description: internDes, responsibility: internRes,
  qualification: 'None',
  level: ["Pre-Associate"], position: 'Internship', status: 'Draft'
)

o3 = Opening.create(
  firstname: 'Brenda', lastname: 'Collins', geid: '3261346', program: true,
  description: progDes, responsibility: progRes,
  qualification: 'We are looking for someone who has strong initiative and is able to complete tasks with minimal guidance.',
  level: ["Recent Associate", "Near Fellow"], position: 'Full Time', status: 'Pending Applications'
)

t1 = Track.create(
  code: 'CFE', name: 'Corporate Finance and ERM', status: 'Currently offered'
)

t1 = Track.create(
  code: 'QFI', name: 'Quantitative Finance and Investment', status: 'Currently offered'
)

t1 = Track.create(
  code: 'ILA', name: 'Individual Life and Annuities', status: 'Currently offered'
)

t1 = Track.create(
  code: 'RB', name: 'Retirement Benefits', status: 'Currently offered'
)

t1 = Track.create(
  code: 'GH', name: 'Group and Health', status: 'Currently offered'
)

t1 = Track.create(
  code: 'GI', name: 'General Insurance', status: 'Currently offered'
)

#c1 = Candidate.create(fullname: 'Ashley Briggs', jobtype: 'Internship', university: 'NYU', degree: 'BS', major: 'Computer Science')
#c2 = Candidate.create(fullname: 'Andy Myers', jobtype: 'Full Time', university: 'Cornell University', degree: 'MS', major: 'Cyber Security', notes: 'Came highly recommended by VP Sharon Wells')
#c3 = Candidate.create(fullname: 'Sarah Martin', jobtype: 'Internship; Full Time', university: 'Rutgers University', degree: 'BS', major: 'Biology', notes: 'Career changer')