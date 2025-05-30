# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"


User.destroy_all
Reservation.destroy_all
Review.destroy_all
Comment.destroy_all

user_1 = User.create!(
  name: "Jean",
  phone_number: "0123456780",
  address: "1 Rue de la République, Paris",
  email: "jean@gmail.com",
  password: "password123",
  image: "https://res.cloudinary.com/dthdn3cs6/image/upload/development/pvo3w0wtcrihlxg8y8lmg4bpltf4"
)

user_2 = User.create!(
  name: "Augustin",
  phone_number: "0123456781",
  address: "2 Avenue des Champs-Élysées, Paris",
  email: "augustin@gmail.com",
  password: "password123",
  image: "https://res.cloudinary.com/dthdn3cs6/image/upload/Augustin_obr6tr"
)

user_3 = User.create!(
  name: "Matis",
  phone_number: "0123456782",
  address: "3 Boulevard Haussmann, Paris",
  email: "matis@gmail.com",
  password: "password123",
  image: "https://res.cloudinary.com/dthdn3cs6/image/upload/Matis_wtekkl"
)

user_4 = User.create!(
  name: "Clément",
  phone_number: "0123456783",
  address: "4 Rue de Rivoli, Paris",
  email: "clement@gmail.com",
  password: "password123",
  image: "https://res.cloudinary.com/dthdn3cs6/image/upload/Clement_vjsvzx"
)

user_5 = User.create!(
  name: "Vincent",
  phone_number: "0123456784",
  address: "5 Quai Branly, Paris",
  email: "vincent@gmail.com",
  password: "password123",
  image: "https://res.cloudinary.com/dthdn3cs6/image/upload/Vincent_hb5evt"
)


Item.destroy_all
baguette_de_sureau = Item.create!(
  name: "Baguette de sureau",
  description: "Légendaire et rare, immense pouvoir.",
  long_description: "Cette baguette a appartenu au maître des ténèbres. Très peu utilisée, elle peut canaliser des sorts puissants mais attention, elle choisit son sorcier.",
  category: "Baguette",
  rating: 4.9,
  power: 10,
  price: 50,
  user: user_1
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/baguette-de-sureau-albus-dumbledore-ollivander_w8jpd8.jpg")
baguette_de_sureau.image.attach(io: file, filename: "baguette-de-sureau.jpg", content_type: "image/jpg")

# 2
baguette_de_houx = Item.create!(
  name: "Baguette de houx",
  description: "Idéale pour les débutants.",
  long_description: "Baguette légère, parfaite pour les sorts de défense. Très prisée chez les apprentis sorciers, elle offre une grande souplesse en duel.",
  category: "Baguette",
  rating: 4.2,
  power: 6,
  price: 20,
  user: user_2
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/Baguette_de_Houx_mkeiiq.jpg")
baguette_de_houx.image.attach(io: file, filename: "baguette_de_houx.jpg", content_type: "image/jpg")

# 3
amulette_phenix = Item.create!(
  name: "Amulette du phénix",
  description: "Protège contre les maléfices.",
  long_description: "Cette amulette irradie d’une douce chaleur, conférant une protection magique qui renaît de ses cendres après chaque combat.",
  category: "Amulette",
  rating: 4.7,
  power: 8,
  price: 40,
  user: user_3
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/Phoenix_p3zsqy.jpg")
amulette_phenix.image.attach(io: file, filename: "amulette_du_phenix.jpg", content_type: "image/jpg")

# 4
amulette_tenebres = Item.create!(
  name: "Amulette des ténèbres",
  description: "Parfaite pour les sortilèges noirs.",
  long_description: "Une aura mystérieuse entoure cette amulette. Elle amplifie les pouvoirs obscurs mais exige prudence et sagesse à son porteur.",
  category: "Amulette",
  rating: 4.5,
  power: 8,
  price: 35,
  user: user_4
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/Amulette_des_tenebres_zqydga.jpg")
amulette_tenebres.image.attach(io: file, filename: "amulette_des_tenebres.jpg", content_type: "image/jpg")

# 5
cape_invisibilite = Item.create!(
  name: "Cape d'invisibilité",
  description: "Invisible aux yeux de tous.",
  long_description: "Rare et précieuse, cette cape permet de se fondre dans l’ombre. Attention, son utilisation excessive peut fatiguer le porteur.",
  category: "Cape",
  rating: 5.0,
  power: 9,
  price: 45,
  user: user_5
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/cape_invisibilite_sysryx.jpg")
cape_invisibilite.image.attach(io: file, filename: "cape_invisibilite.jpg", content_type: "image/jpg")

# 6
cape_protection = Item.create!(
  name: "Cape de protection",
  description: "Bouclier magique personnel.",
  long_description: "Tissée avec des fibres enchantées, cette cape protège contre les attaques magiques, idéale lors des duels ou des missions périlleuses.",
  category: "Cape",
  rating: 4.3,
  power: 7,
  price: 25,
  user: user_1
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/v1/cape_de_protection_g5ublg")
cape_protection.image.attach(io: file, filename: "cape_de_protection.jpg", content_type: "image/jpg")

# 7
chaudron_etain = Item.create!(
  name: "Chaudron en étain",
  description: "Pour potions et mixtures.",
  long_description: "Parfait pour les apprentis potionniers. Robuste et facile à nettoyer, il supporte la majorité des concoctions magiques.",
  category: "Chaudron",
  rating: 4.1,
  power: 4,
  price: 15,
  user: user_2
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/v1/chaudron_etain_ycc1vc")
chaudron_etain.image.attach(io: file, filename: "chaudron_en_etain.jpg", content_type: "image/jpg")

# 8
chaudron_cuivre = Item.create!(
  name: "Chaudron de cuivre",
  description: "Idéal pour potions avancées.",
  long_description: "Utilisé par les sorciers expérimentés, il favorise la précision des mélanges et améliore l’efficacité des sorts incorporés aux potions.",
  category: "Chaudron",
  rating: 4.6,
  power: 6,
  price: 30,
  user: user_3
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/v1/chaudron_cuivre_vbhqyo")
chaudron_cuivre.image.attach(io: file, filename: "chaudron_de_cuivre.jpg", content_type: "image/jpg")

# 9
balai_nimbus = Item.create!(
  name: "Balai Nimbus 2000",
  description: "Rapide et élégant.",
  long_description: "Balai préféré des joueurs de Quidditch, il allie vitesse et maniabilité. Parfait pour survoler Poudlard ou échapper aux mangemorts.",
  category: "Balais",
  rating: 4.8,
  power: 9,
  price: 50,
  user: user_4
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/v1/Nimbus_2000_keqkow")
balai_nimbus.image.attach(io: file, filename: "balai_nimbus_2000.jpg", content_type: "image/jpg")

# 10
balai_eclair = Item.create!(
  name: "Balai Éclair de Feu",
  description: "Puissant et redoutable.",
  long_description: "Ce balai ne laisse aucune chance à ses adversaires. Sa rapidité fulgurante et sa stabilité en font un compagnon idéal en vol.",
  category: "Balais",
  rating: 4.9,
  power: 9,
  price: 48,
  user: user_5
)
file = URI.open("https://res.cloudinary.com/dthdn3cs6/image/upload/v1/eclair_de_Feu_qbwpqk")
balai_eclair.image.attach(io: file, filename: "balai_eclair_de_feu.jpg", content_type: "image/jpg")


# Reviews pour baguette_de_sureau
Review.create!(
  content: "Incroyable baguette, j'ai ressenti une puissance rare.",
  rating: 9,
  item: baguette_de_sureau,
  user: user_2
)
Review.create!(
  content: "Très puissante, mais demande de la maîtrise.",
  rating: 8,
  item: baguette_de_sureau,
  user: user_3
)

# Reviews pour baguette_de_houx
Review.create!(
  content: "Parfaite pour débuter en magie, très légère.",
  rating: 7,
  item: baguette_de_houx,
  user: user_1
)
Review.create!(
  content: "Bonne baguette, mais un peu fragile en duel.",
  rating: 6,
  item: baguette_de_houx,
  user: user_4
)

# Reviews pour amulette_phenix
Review.create!(
  content: "Protège vraiment bien contre les maléfices, un must-have.",
  rating: 8,
  item: amulette_phenix,
  user: user_5
)
Review.create!(
  content: "Belle amulette, très efficace en combat.",
  rating: 9,
  item: amulette_phenix,
  user: user_1
)

# Reviews pour amulette_tenebres
Review.create!(
  content: "Puissante mais dangereuse si mal utilisée.",
  rating: 7,
  item: amulette_tenebres,
  user: user_3
)
Review.create!(
  content: "Excellente pour les sortilèges noirs, je recommande.",
  rating: 8,
  item: amulette_tenebres,
  user: user_4
)

# Reviews pour cape_invisibilite
Review.create!(
  content: "Parfaite pour passer inaperçu, la meilleure cape.",
  rating: 10,
  item: cape_invisibilite,
  user: user_2
)
Review.create!(
  content: "Un peu fatigante à porter, mais très utile.",
  rating: 9,
  item: cape_invisibilite,
  user: user_5
)

# Reviews pour cape_protection
Review.create!(
  content: "Idéale en duel, protection magique au top.",
  rating: 7,
  item: cape_protection,
  user: user_1
)
Review.create!(
  content: "Bonne cape mais pourrait être plus légère.",
  rating: 6,
  item: cape_protection,
  user: user_3
)

# Reviews pour chaudron_etain
Review.create!(
  content: "Parfait pour les débutants en potions.",
  rating: 6,
  item: chaudron_etain,
  user: user_4
)
Review.create!(
  content: "Solide et facile à nettoyer, j’adore.",
  rating: 7,
  item: chaudron_etain,
  user: user_2
)

# Reviews pour chaudron_cuivre
Review.create!(
  content: "Très précis pour les potions avancées.",
  rating: 8,
  item: chaudron_cuivre,
  user: user_5
)
Review.create!(
  content: "Un indispensable pour les sorciers expérimentés.",
  rating: 9,
  item: chaudron_cuivre,
  user: user_1
)

# Reviews pour balai_nimbus
Review.create!(
  content: "Rapide et maniable, parfait pour le Quidditch.",
  rating: 9,
  item: balai_nimbus,
  user: user_3
)
Review.create!(
  content: "Excellent balai, je ne l’échangerais pour rien.",
  rating: 10,
  item: balai_nimbus,
  user: user_4
)

# Reviews pour balai_eclair
Review.create!(
  content: "Rapidité fulgurante, un vrai bijou de technologie.",
  rating: 10,
  item: balai_eclair,
  user: user_2
)
Review.create!(
  content: "Très stable en vol, très satisfait.",
  rating: 9,
  item: balai_eclair,
  user: user_5
)
