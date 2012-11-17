# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
BlogPost.delete_all
Statistic.delete_all

User.create(:name => "Thien Lam", :email => "thien.lam@eastagile.com", :admin => true,
            :password => "123456", :password_confirmation => "123456")
Statistic.create(:name => "Page view", :value => "0")