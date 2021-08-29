# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.connection.execute("TRUNCATE mappings")
ActiveRecord::Base.connection.execute("TRUNCATE partners RESTART IDENTITY CASCADE")


mappings = [
  ["gender",
    "male",
    "gen",
    "1"
  ],
  ["gender",
    "female",
    "gen",
    "2"
  ],
  ["education",
    "low",
    "edu",
    "1"
  ],
  ["education",
    "midlow",
    "edu",
    "2"
  ],
  ["education",
    "mid",
    "edu",
    "3"
  ],
  ["education",
    "midhigh",
    "edu",
    "4"
  ],
  ["education",
    "high",
    "edu",
    "5"
  ],
]

partner = Partner.create(name: "Lucid")
Partner.create(name: "PureSpectrum")
Partner.create(name: "Cint")

mappings.each do |mapping|
  Mapping.create(
    partner: partner,
    dalia_key: mapping[0],
    dalia_value: mapping[1],
    partner_key: mapping[2],
    partner_value: mapping[3]
  )
end
