# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.where(admin: "true").first_or_create do |admin|
  admin.name = "administrator"
  admin.email = "admin@admin"
  admin.password = "123456789"
  admin.password_confirmation = "123456789"
  admin.admin = true
end

ApplicationSetting.where(setting: 'GOOGLE_ANALYTICS_ID').first_or_create do |setting|
  setting.setting = 'GOOGLE_ANALYTICS_ID'
end

ApplicationSetting.where(setting: 'FACEBOOK_APP_ID').first_or_create do |setting|
  setting.setting = 'FACEBOOK_APP_ID'
end