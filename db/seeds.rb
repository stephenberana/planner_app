# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
    { category_title: 'Personal', category_description: 'Tasks relating to personal development.' },
    { category_title: 'Work', category_description: 'Tasks relating to career growth.' },
    { category_title: 'School', category_description: 'Tasks relating to academic load.' }
])