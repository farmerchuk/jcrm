# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Industry.create(name: "Technology")
Industry.create(name: "Finance")
Industry.create(name: "Healthcare")
Industry.create(name: "Food/Entertainment")

OpportunityStage.create(stage: "No Stage")
OpportunityStage.create(stage: "Pipeline")
OpportunityStage.create(stage: "Best Case")
OpportunityStage.create(stage: "Commit")
OpportunityStage.create(stage: "Closed - Won")
OpportunityStage.create(stage: "Closed - Lost")

Role.create(name: "Basic")
Role.create(name: "Admin")

Product.create(name: "Widget A", price: 100)
Product.create(name: "Widget B", price: 200)
Product.create(name: "Widget C", price: 500)

User.create(first_name: "Jason", last_name: "Slusarchuk", time_zone: "Pacific Time (US & Canada)", two_factor: true, phone_number: "6044387361", role_id: "2", password: "password", password_confirmation: "password", email: "jason@gmail.com")
