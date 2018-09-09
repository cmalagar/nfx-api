# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 
# Investor
#     t.string :company
#     t.string :location
#     t.string :contact
#     t.string :stage
#     t.string :interest
# 
# Meeting
#     t.string :time
#     t.references :investor, foreign_key: true
require 'date'

d = DateTime.now

cameron = Investor.create(
    company: 'NASA', location: 'Mountain View', contact: 'Cameron', stage: 'research', interest: 'high'
)

meeko = Investor.create(
    company: 'Industry Dive', location: 'Washington D.C', contact: 'Meeko', stage: 'research', interest: 'medium'
)

dani = Investor.create(
    company: 'Blue Barn', location: 'San Francsico', contact: 'Dani', stage: 'negotiation', interest: 'low'
)

titan = Investor.create(
    company: 'Four Barrel', location: 'San Francisco', contact: 'Titan', stage: 'reject', interest: ''
)

Meeting.create(time: d.strftime("%d/%m/%Y %H:%M"), investor_id: cameron.id)
Meeting.create(time: d.next_month.strftime("%d/%m/%Y %H:%M"), investor_id: meeko.id)
Meeting.create(time: d.next_month.strftime("%d/%m/%Y %H:%M"), investor_id: dani.id)
