# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'bjcameron@gmail.com', password: 'humblebaby', name: 'Brent')
User.create(email: 'humblebragger@humblebrag.com', password: 'humblebaby', name: 'humble')
User.create(email: 'fitnessgrampacer@test.com', password: 'pacertest', name: 'fitfam')
User.create(email: 'cfanerd@cra.com', password: 'cratest', name: 'taxman')
User.create(email: 'red@foo.bar', password: 'cratest', name: 'Red')
User.create(email: 'masterchief@mc.com', password: 'cratest', name: 'MasterChief')


