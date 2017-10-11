require_relative '../models/student'
require_relative '../models/house'

Student.delete_all
House.delete_all

gryffindor = House.new ({
  'name' => 'Gryffindor',
  'logo' => '/gryffindor.png'
  })
gryffindor.save

ravenclaw = House.new ({
  'name' => 'Ravenclaw',
  'logo' => '/ravenclaw.png'
  })
ravenclaw.save

slytherin = House.new ({
  'name' => 'Slytherin',
  'logo' => '/slytherin.png'
  })
slytherin.save

hufflepuff = House.new ({
  'name' => 'Hufflepuff',
  'logo' => '/hufflepuff.png'
  })
hufflepuff.save

harry = Student.new ({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => gryffindor.id,
  'age' => 13
  })
harry.save

hermione = Student.new ({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'house' => gryffindor.id,
  'age' => 13
  })
hermione.save

draco = Student.new ({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'house' => slytherin.id,
  'age' => 13
  })
draco.save

luna = Student.new ({
  'first_name' => 'Luna',
  'last_name' => 'Lovegood',
  'house' => ravenclaw,
  'age' => 13
  })
luna.save
