# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.connection.execute("TRUNCATE mappings")
ActiveRecord::Base.connection.execute("TRUNCATE partners RESTART IDENTITY CASCADE")

partner = Partner.create(name: "Lucid")
Partner.create(name: "PureSpectrum")
Partner.create(name: "Cint")

mapping_json = JSON.parse(File.read("#{Rails.root}/db/seeds_mapping.json"))

mapping_json.each do |mapping|
  dalia_key = mapping["dalia_demographic_key"]
  mapping["values"].each do |value|
    dalia_value = value["dalia_demographic_value"]
    partner_key = value["partner_user_demographic_key"]
    partner_value = value["partner_user_demographic_value"]
    Mapping.create(
      partner: partner,
      dalia_key: dalia_key,
      dalia_value: dalia_value,
      partner_key: partner_key,
      partner_value: partner_value
    )
  end
end
