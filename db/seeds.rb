# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Shoot.destroy_all

@user = User.create(name: 'Bob Woodward',
 email: 'bwoodward@press.com',
 phone_number: '810-448-7321',
 admin: 'false',
 uid: '999')

 @user = User.create(name: 'Photo Steve',
  email: 'psteve@press.com',
  phone_number: '810-448-7321',
  admin: 'false',
  uid: '888')

@user = User.create(name: 'Carl Bernstein',
  email: 'cbernstein@press.com',
  phone_number: '810-448-7344',
  admin: 'true',
  uid: '777')

@shoot = Shoot.create(slug: 'Political Rally',
  assignment_description: 'The news desk needs a gallery of photos from a political rally.',
  start: 'DateTime.new(2018,9,1,7)',
  end: 'DateTime.new(2018,9,1,12)',
  location: 'Navy Pier',
  contact_name: 'PR Agent',
  contact_phone: '555-123-4324',
  desk: 'News',
  deadline: 'DateTime.new(2018,9,3,12)',
  user_assigned: 'Carl Bernstein',
)

@shoot = Shoot.create(slug: 'Cubs game',
  assignment_description: 'The sports desk needs some photos of the Cubs game.',
  start: 'DateTime.new(2018,7,1,7)',
  end: 'DateTime.new(2018,7,1,10)',
  location: 'Cubs field',
  contact_name: 'Cubs press agent' ,
  contact_phone: '555-555-0000' ,
  desk: 'Sports',
  deadline: 'DateTime.new(2018,7,1,12)',
  user_assigned: 'Photo Steve')

@shoot = Shoot.create(slug: 'Dog Feature',
  assignment_description: 'The features desk needs a picture of a dog in an animal shelter.',
  start: 'DateTime.new(2018,6,1,7)',
  end: 'DateTime.new(2018,6,1,12)',
  location: 'Anywhere',
  contact_name: 'Dog shelter' ,
  contact_phone: '555-555-4524' ,
  desk: 'Features',
  deadline: 'DateTime.new(2018,6,3,12)',
  user_assigned: 'Photo Steve')
