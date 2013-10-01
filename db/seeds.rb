# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# General User
User.create(email: "mberwanger@yahoo.com", password: "test1234", password_confirmation: "test1234")

# Admin Users
User.create(email: "martin.berwanger@gmail.com", password: "test1234", password_confirmation: "test1234", is_admin: true)
User.create(email: "umana.ali@gmail.com", password: "test1234", password_confirmation: "test1234", is_admin: true)
User.create(email: "d.mcgary@verizon.net", password: "test1234", password_confirmation: "test1234", is_admin: true)
User.create(email: "cpicche@gmail.com", password: "test1234", password_confirmation: "test1234", is_admin: true)
User.create(email: "pr257@njit.edu", password: "test1234", password_confirmation: "test1234", is_admin: true)

# Pilots
Pilot.create(fname: 'Louis', lname: 'Lee')
Pilot.create(fname: 'Earl', lname: 'Mitchell')
Pilot.create(fname: 'Diane', lname: 'Kelly')
Pilot.create(fname: 'Marie', lname: 'Sanchez')
Pilot.create(fname: 'Terry', lname: 'Reed')
Pilot.create(fname: 'Ralph', lname: 'Martinez')
Pilot.create(fname: 'Benjamin', lname: 'Williams')
Pilot.create(fname: 'Samuel', lname: 'Russell')
Pilot.create(fname: 'Mark', lname: 'Turner')
Pilot.create(fname: 'Fred', lname: 'White')
Pilot.create(fname: 'Marilyn', lname: 'Smith')
Pilot.create(fname: 'Heather', lname: 'Brooks')
Pilot.create(fname: 'Kimberly', lname: 'Clark')
Pilot.create(fname: 'Ernest', lname: 'Lewis')
Pilot.create(fname: 'Steven', lname: 'Taylor')
Pilot.create(fname: 'Bruce', lname: 'Henderson')
Pilot.create(fname: 'Anne', lname: 'Evans')
Pilot.create(fname: 'Martha', lname: 'Alexander')
Pilot.create(fname: 'Tammy', lname: 'Campbell')
Pilot.create(fname: 'Denise', lname: 'King')
Pilot.create(fname: 'Edward', lname: 'Gonzales')
Pilot.create(fname: 'Harry', lname: 'Cooper')
Pilot.create(fname: 'Jimmy', lname: 'Bell')
Pilot.create(fname: 'Jesse', lname: 'Thompson')
Pilot.create(fname: 'Gloria', lname: 'Rivera')

# Navigator
Navigator.create(fname: 'Eugene', lname: 'Lee')
Navigator.create(fname: 'Jerry', lname: 'Lopez')
Navigator.create(fname: 'Emily', lname: 'Baker')
Navigator.create(fname: 'Jennifer', lname: 'Griffin')
Navigator.create(fname: 'Deborah', lname: 'Ramirez')
Navigator.create(fname: 'Henry', lname: 'Roberts')
Navigator.create(fname: 'Joshua', lname: 'Wood')
Navigator.create(fname: 'Joseph', lname: 'Bailey')
Navigator.create(fname: 'Janet', lname: 'Miller')
Navigator.create(fname: 'Helen', lname: 'Lewis')
Navigator.create(fname: 'Nicholas', lname: 'Smith')
Navigator.create(fname: 'Diana', lname: 'Clark')
Navigator.create(fname: 'Angela', lname: 'King')
Navigator.create(fname: 'Lois', lname: 'Murphy')
Navigator.create(fname: 'Ernest', lname: 'Phillips')
Navigator.create(fname: 'Julie', lname: 'Howard')
Navigator.create(fname: 'Ann', lname: 'Peterson')
Navigator.create(fname: 'Lori', lname: 'Morgan')
Navigator.create(fname: 'Jesse', lname: 'Alexander')
Navigator.create(fname: 'Kimberly', lname: 'Martin')
Navigator.create(fname: 'Katherine', lname: 'Simmons')
Navigator.create(fname: 'Anne', lname: 'Mitchell')
Navigator.create(fname: 'Sharon', lname: 'Watson')
Navigator.create(fname: 'Bruce', lname: 'Ward')
Navigator.create(fname: 'Pamela', lname: 'Cox')

# AircraftType
AircraftType.create(code: 'AB3', name: 'Airbus A300')
AircraftType.create(code: '310', name: 'Airbus A310')
AircraftType.create(code: '320', name: 'Airbus A320')
AircraftType.create(code: '330', name: 'Airbus A330')
AircraftType.create(code: '38F', name: 'Airbus A380F')
AircraftType.create(code: 'AB4', name: 'Airbus A300B4/C4')
AircraftType.create(code: 'AB6', name: 'Airbus A300-600/600C/601')
AircraftType.create(code: 'ABB', name: 'Airbus A300B4-608ST \'Beluga\'')
AircraftType.create(code: 'ANF', name: 'Antonov An-12')
AircraftType.create(code: 'AN6', name: 'Antonov An-26')
AircraftType.create(code: 'A4F', name: 'Antonov An-124')
AircraftType.create(code: 'A5F', name: 'Antonov An-225')
AircraftType.create(code: '14Z', name: 'British Aerospace 146QT')
AircraftType.create(code: '72F', name: 'Boeing 727')
AircraftType.create(code: '73F', name: 'Boeing 737')
AircraftType.create(code: '75F', name: 'Boeing 757')
AircraftType.create(code: '76F', name: 'Boeing 767')
AircraftType.create(code: '74F', name: 'Boeing 747 Freighter')
AircraftType.create(code: '74H', name: 'Boeing 747-8 Freighter')
AircraftType.create(code: '77F', name: 'Boeing 777 Freighter')
AircraftType.create(code: 'D3F', name: 'Douglas DC-3')
AircraftType.create(code: 'D8F', name: 'Douglas DC-8')
AircraftType.create(code: 'D9F', name: 'Douglas DC-9')
AircraftType.create(code: 'IL7', name: 'Ilyushin Il-76')
AircraftType.create(code: 'I9X', name: 'Ilyushin Il-96')
AircraftType.create(code: 'L1F', name: 'Lockheed L-1011 Tristar Freighter')
AircraftType.create(code: 'LOF', name: 'Lockheed L-188 Electra Freighter')
AircraftType.create(code: 'D1F', name: 'McDonnell Douglas DC-10')
AircraftType.create(code: 'M1F', name: 'McDonnell Douglas MD-11')
AircraftType.create(code: 'T2F', name: 'Tupolev Tu-204')

# Aircraft
Aircraft.create(tail_number: '123456', aircraft_type_id: 1, fuel_amount: 10000)

# Airport
Airport.create(code: 'ATL', name: 'Hartsfield-Jackson Atlanta International')
Airport.create(code: 'ANC', name: 'Ted Stevens Anchorage International Airport')
Airport.create(code: 'AUS', name: 'Austin-Bergstrom International')
Airport.create(code: 'BWI', name: 'Baltimore/Washington International - BWI Airport')
Airport.create(code: 'BOS', name: 'Logan International')
Airport.create(code: 'CLT', name: 'Charlotte Douglas International')
Airport.create(code: 'MDW', name: 'Chicago Midway Airport')
Airport.create(code: 'ORD', name: 'Chicago O\'Hare International')
Airport.create(code: 'CVG', name: 'Cincinnati/Northern Kentucky International')
Airport.create(code: 'CLE', name: 'Cleveland Hopkins International')
Airport.create(code: 'CMH', name: 'Port Columbus International')
Airport.create(code: 'DFW', name: 'Dallas/Ft. Worth International - DFW Airport')
Airport.create(code: 'DEN', name: 'Denver International Airport')
Airport.create(code: 'DTW', name: 'Detroit Metropolitan Wayne County Airport')
Airport.create(code: 'FLL', name: 'Fort Lauderdale/Hollywood International')
Airport.create(code: 'RSW', name: 'Southwest Florida International')
Airport.create(code: 'BDL', name: 'Bradley International')
Airport.create(code: 'HNL', name: 'Hawaii Honolulu International')
Airport.create(code: 'IAH', name: 'George Bush Intercontinental')
Airport.create(code: 'HOU', name: 'William P. Hobby Airport')
Airport.create(code: 'IND', name: 'Indianapolis International')
Airport.create(code: 'MCI', name: 'Kansas City International')
Airport.create(code: 'LAS', name: 'McCarran International')
Airport.create(code: 'LAX', name: 'Los Angeles International - LAX Airport')
Airport.create(code: 'MEM', name: 'Memphis International')
Airport.create(code: 'MIA', name: 'Miami International Airport')
Airport.create(code: 'MSP', name: 'Minneapolis/St. Paul International')
Airport.create(code: 'BNA', name: 'Nashville International')
Airport.create(code: 'MSY', name: 'Louis Armstrong International')
Airport.create(code: 'JFK', name: 'John F. Kennedy International')
Airport.create(code: 'LGA', name: 'LaGuardia International')
Airport.create(code: 'EWR', name: 'Newark Liberty International')
Airport.create(code: 'OAK', name: 'Metropolitan Oakland International')
Airport.create(code: 'ONT', name: 'Ontario International')
Airport.create(code: 'MCO', name: 'Orlando International')
Airport.create(code: 'PHL', name: 'Philadelphia International')
Airport.create(code: 'PHX', name: 'Sky Harbor International')
Airport.create(code: 'PIT', name: 'Pittsburgh International')
Airport.create(code: 'PDX', name: 'Portland International')
Airport.create(code: 'RDU', name: 'Raleigh-Durham International')
Airport.create(code: 'SMF', name: 'Sacramento International')
Airport.create(code: 'SLC', name: 'Salt Lake City International')
Airport.create(code: 'SAT', name: 'San Antonio International')
Airport.create(code: 'SAN', name: 'Lindbergh Field International')
Airport.create(code: 'SFO', name: 'San Francisco International')
Airport.create(code: 'SJC', name: 'Mineta San Jose International')
Airport.create(code: 'SNA', name: 'John Wayne Airport, Orange County')
Airport.create(code: 'SEA', name: 'Seattle-Tacoma International - Seatac Airport')
Airport.create(code: 'STL', name: 'Lambert-St. Louis International')
Airport.create(code: 'TPA', name: 'Tampa International')
Airport.create(code: 'IAD', name: 'Dulles International Airport')
Airport.create(code: 'DCA', name: 'Ronald Reagan Washington National')
