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

Role.create(type: "Basic")
Role.create(type: "Admin")
