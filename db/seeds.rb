
p "importing seeds..."

p "importing user seeds..."
load(Rails.root.join('db', 'seeds', 'user_seeds.rb'))

p "importing universe seeds..."
load(Rails.root.join('db', 'seeds', 'universe_seeds.rb'))

universeMeta = Universe.find_by(name: "Meta")
metaId = universeMeta.id

universeScienceFiction = Universe.find_by(name: "ScienceFiction")
scienceFictionId = universeScienceFiction.id

universeFantasy = Universe.find_by(name: "Fantasy")
fantasyId = universeFantasy.id

universeModern = Universe.find_by(name: "Modern")
modernId = universeModern.id

universeHistorical = Universe.find_by(name: "Historical")
historicalId = universeHistorical.id

universePostApocalyptic = Universe.find_by(name: "Post Apocalyptic")
postApocalypticId = universePostApocalyptic.id

p "importing creatures seeds..."
load(Rails.root.join('db', 'seeds', 'creature_seeds.rb'))

p "importing races seeds..."
load(Rails.root.join('db', 'seeds', 'race_seeds.rb'))

p "importing weapons seeds..."
load(Rails.root.join('db', 'seeds', 'weapon_seeds.rb'))

# armory = Armory.find_by(type: "couteau")
# armoryId = armory.id

# party = Party.find_by(name: "Post Apocalyptic")
# partyId = party.id

p "importing armories seeds..."
load(Rails.root.join('db', 'seeds', 'armory_seeds.rb'))

p "importing parties seeds..."
load(Rails.root.join('db', 'seeds', 'party_seeds.rb'))
