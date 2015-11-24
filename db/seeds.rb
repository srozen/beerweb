# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#############
### beers ###
#############

leffeblonde = Beer.new
leffeblonde.name = 'Leffe Blonde'
leffeblonde.degree = 6.6
leffeblonde.story = 'Dans les années 50 eut lieu une rencontre que tous les amateurs de bière devraient fêter en levant leur verre de Leffe. Cette rencontre, c’est celle du Père Abbé Nys, de l’abbaye de Leffe et d’Albert Lootvoet, un Maître Brasseur à la solide expérience. Passionné par l’histoire de son abbaye, le Père Nys se désolait que depuis la visite pas très amicale des troupes révolutionnaires françaises, la brasserie avait lentement périclité et fini par fermer ses portes en 1809. Un tel trésor ne pouvait tomber dans l’oubli. Il fallait faire renaître la bière de Leffe. Le défi fut relevé avec enthousiasme par le Père et le Maître Brasseur. Et quelques temps plus tard, le brassage de la bière Leffe reprit de plus belle. Après Leffe Brune, une bière aussi dorée qu’un soleil d’été se mit à couler dans les verres, c’était Leffe Blonde. Une des plus belles pages de l’histoire de Leffe.'
leffeblonde.description = 'Un savoir-faire ancestral associé au malt pâle, à l’eau, au houblon et aux levures confère à la Leffe Blonde une saveur subtile et une robe dorée aux reflets lumineux. Des nuances de vanille et de clou de girofle ajoutent à sa délicatesse comme un supplément d’âme. Laissez-la s’exprimer dans un verre calice de Leffe pour que sa douceur et sa fraîcheur révèlent toute son élégance'
leffeblonde.confirmed = true

duvelblonde = Beer.new
duvelblonde.name = "Duvel"
duvelblonde.degree = 8.5
duvelblonde.story = 'Pour commémorer la fin de la Première Guerre mondiale, la nouvelle bière reçoit d’abord le nom « Victory Ale », à savoir « Bière de la victoire ». Le cordonnier Van De Wouwer fait toutefois tout chambouler lors d’une dégustation : il décrit la bière comme « een echte duvel » ou « un véritable diable ».'
duvelblonde.description = "La Duvel est une bière naturelle dotée d’une amertume subtile, d’un arôme raffiné et d’un goût prononcé de houblon. Le procédé de brassage unique de 90 jours garantit un style authentique, un perlant délicat et un goût doux d’alcool agréable."
duvelblonde.confirmed = true

leffebrune = Beer.new
leffebrune.name = "Leffe Brune"
leffebrune.degree = 6.5
leffebrune.story = "Jusqu'à la fin du 17ème siècle, toutes les bières étaient brunes. Pour les fabriquer, les malts étaient séchés sur de grandes tourailles au-dessus de feux de bois. Imaginez les malteurs munis de grandes pelles de bois en train de retourner cette céréale sous une chaleur dantesque. La fumée était en contact direct avec le grain, donnant à ce-dernier un arôme singulier que l’on retrouvait jusque dans le verre. Certains grains étaient brûlés ou grillés. D’autres encore se voyaient légèrement toastés ou caramélisés, et prenaient alors des couleurs étonnantes allant du brun ambre au noir torréfié."
leffebrune.description = "Leffe Brune est une authentique bière d’Abbaye à la belle robe acajou et à la saveur pleine et légèrement sucrée qui fait de chaque gorgée un moment d’exception. Une couleur et une saveur uniques provenant de l’utilisation de malt torréfié."
leffebrune.confirmed = true

guinness = Beer.new
guinness.name = "Guinness"
guinness.degree = 8
guinness.story = "L'histoire de la brasserie débute en 1759 lorsqu'Arthur Guinness, fils de brasseur, décide de louer une brasserie à Dublin pour fabriquer de la bière. Le 31 décembre 1759, il signe un bail lui accordant l'usage d'un site pour neuf mille ans, en contrepartie d'un loyer annuel de 45 livres. Le site choisi est une brasserie désaffectée, la St. James's Gate Brewery (en), qui comprend une maison d'habitation, une salle de brassage, deux malteries et des écuries. Ce bail n'est plus valide puisque la famille Guinness a depuis racheté et agrandi la propriété mais le document est toujours visible au Guinness Storehouse, grenier à grains racheté en face de la brasserie et reconverti en un musée ludique retraçant l'histoire de la bière Guinness."
guinness.description = "La Guinness est un stout, une bière noire coiffée d'une mousse blanche, connue mondialement pour sa saveur et son aspect si particuliers. La Guinness est fortement liée à l'histoire de l'Irlande, elle en est un des symboles au niveau international. La brasserie historique de St. James, fondée en 1759, se trouve à Dublin."
guinness.confirmed = true

### categories

blondebelge = BeerCategory.new
blondebelge.name = "Blonde Belge"
blondebelge.description = "Une bière dorée modérément alcoolisée avec une complexité à la belge toute subtile et une finale sèche."

brunebelge = BeerCategory.new
brunebelge.name = "Brune Belge"
brunebelge.description = "La bière brune est une bière de couleur brune, du brun acajou au noir ébène, obtenue grâce à l'utilisation de malt plus ou moins torréfié."

stout = BeerCategory.new
stout.name = "Stout"
stout.description = "Un stout est une bière brassée à partir d'un moût caractérisé par sa teneur en grains hautement torréfiés. La présence de ces grains bien grillés dans la recette confère la couleur foncée à la bière ainsi qu'un goût de café ou de cacao. Cette bière est devenue une spécialité irlandaise. Son origine première est cependant anglaise par sa filiation avec la Porter."

### saving

blondebelge.save
brunebelge.save
stout.save

leffeblonde.beer_category = blondebelge
duvelblonde.beer_category = blondebelge
leffebrune.beer_category = brunebelge
guinness.beer_category = stout

leffeblonde.save
duvelblonde.save
leffebrune.save
guinness.save

#############
### Users ###
#############

admin = User.new
admin.login = "admin"
admin.email = "michashh@gmail.com"
admin.pwd = "grosbatard"
admin.pwd_confirmation = "grosbatard"
admin.admin = true

admin.save


willfrit = User.new
willfrit.login = "Willfrit"
willfrit.email = "will.frit@gmail.com"
willfrit.pwd = "groschicon"
willfrit.pwd_confirmation = "groschicon"

willfrit.save

srozen = User.new
srozen.login = "Srozen"
srozen.email = "spat.monroe@gmail.com"
srozen.pwd = "groschicon"
srozen.pwd_confirmation = "groschicon"

srozen.save

#########################
### Collection admin ###
#########################

ca = Collection.new
ca.user = admin
ca.save

###########################
### Collection Willfrit ###
###########################

cw = Collection.new
cw.user = willfrit
cw.save

cwlb = Review.new
cwlb.note = 6
cwlb.comment = "Un peu trop sucrée à mon goût, mais rafraîchissante et valeur sûre si on veut déguster une bière agréable et pas trop forte."
cwlb.beer = leffeblonde
cwlb.collection = cw
cwlb.save

cwdb = Review.new
cwdb.note = 7.8
cwdb.comment = "Amerthume agréable, assez forte, une bonne bière de qualité que je recommande sans hésitation"
cwdb.beer = duvelblonde
cwdb.collection = cw
cwdb.save

#########################
### Collection Srozen ###
#########################

cz = Collection.new
cz.user = srozen
cz.save

czlb = Review.new
czlb.note = 3
czlb.comment = "Vraiment pas top, trop légère, goût assez linéaire, mais Leffe Leffe, la bière de tout les barakis."
czlb.beer = leffeblonde
czlb.collection = cz
czlb.save

czdb = Review.new
czdb.note = 9
czdb.comment = "Voilà une très bonne bière de qualité, la Duuuuuuuuuuuuuuvel"
czdb.beer = duvelblonde
czdb.collection = cz
czdb.save
