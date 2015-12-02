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

blanchehoegaarden = Beer.new
blanchehoegaarden.name = "Hoegaarden"
blanchehoegaarden.degree = 4.9
blanchehoegaarden.story = "La bière Hoegaarden est un excellent exemple du style de bière witbier, une bière blanche de blé. Ce style, le premier appartenant aux bières dites « blanches », fut créé par les moines du village Hoegaarden aux alentours de 1445. Les premières bières blanches brassées étaient très aigres jusqu’à ce que les moines y ajoutent de l’écorce d’orange et de la coriandre, des ingrédients en provenance de la colonie de Curaçao. L’industrie brassicole de Hoegaarden prospère et, en 1736, le village compte 36 brasseries et 110 malteries. Cependant, après la Révolution française, le village perd graduellement en importance et, face à l'explosion des ventes de bière blonde, le style disparaît avec la fermeture de la brasserie Thomsin en 1957.
En 1965, un ancien employé de la brasserie Thomsin, Pierre Celis, décide de relancer la production en créant la brasserie De Kluis. En 1985, un incendie détruit la brasserie alors que la production est de 75 000 hectolitres à l'année. Stella Artois aide la brasserie à se reconstruire en échange de parts dans la société vendues par Pierre Celis qui décide de poursuivre ses activités de brasseur aux États-Unis. En 1987, Interbrew prend le contrôle total de la brasserie."
blanchehoegaarden.description = "La Hoegaarden est une bière blanche originaire de Hoegaarden en Belgique. Elle est disponible dans 30 pays. C'est une marque du groupe AB InBev, le plus gros brasseur du monde."
blanchehoegaarden.confirmed = true

jupiler = Beer.new
jupiler.name = "Jupiler"
jupiler.degree = 5.2
jupiler.story = "La Jupiler est une bière relativement jeune : elle a été lancée par Piedbœuf en 1966 sous le nom de Jupiler 5 (car elle titrait 5° et comprenait cinq ingrédients) et est devenue le numéro un du marché des pils en Belgique. Le nom Jupiler 5 a été abandonné pour l'appellation actuelle."
jupiler.description = "La Jupiler est une bière belge blonde de fermentation basse de type pils. Elle a été créée et fabriquée par la brasserie Piedbœuf (aujourd'hui groupe A.B. InBev, anciennement InBev et Interbrew) dans le village de Jupille-sur-Meuse, banlieue de Liège dont elle tire son nom."
jupiler.confirmed = true

orval = Beer.new
orval.name = "Orval"
orval.degree = 6.2
orval.story = "En outre, le symbole de la bière d'Orval est une truite avec un anneau dans sa bouche. Il s'agit d'une légende qui raconte qu'en 1076, la Comtesse Mathilde perdit un jour une son anneau nuptial en s'approchant trop près d'une source jaillissante. Une truite blondit alors de la source et rendit l'anneau à la Contesse. Elle s'écria: ""Voici l'anneau d'or que je cherchais! Heureuse vallée qui me l'a rendue! Désormais et pour toujours, je voudrais qu'on l'appelle Val d'or"" D'où peut-être l'origine du nom Orval...
La bière d'Orval est unique. A cause de ses complexes processus de fermentation, la goût de l'Orval est en continuelle évolution. En général, le volume d'alcool de l'Orval est de 6,2%. Mais si on laisse reposer la bière un an en cave, le volume d'alcool peut monter jusqu'à 7,2%.
Ainsi, sur l'étiquette de la bouteille, le volume d'alcool indiqué est de 6,2°, la valeur intermédiaire.
La couleur de la bière est orangée et elle a une saveur riche, sèche et houblonnée avec un arôme de sauge."
orval.description = "L'Orval est une bière trappiste belge de fermentation haute, brassée à l'abbaye d'Orval située à Villers-devant-Orval en province de Luxembourg."
orval.confirmed = true

triplewestmalle = Beer.new
triplewestmalle.name = "Westmalle Triple"
triplewestmalle.degree = 9.5
triplewestmalle.story = "La Tripel de Westmalle est également appelée la « mère de toutes les triples ». Ce type de bière a été brassé pour la première fois à l’abbaye de Westmalle en 1934, à l’occasion de la mise en service de la nouvelle salle de brassage. La formule actuelle n’a jamais subi aucune modification depuis 1956, soit depuis plus de 50 ans."
triplewestmalle.description = "La Tripel de Westmalle est une bière trappiste claire, à la robe dorée, ayant subi une refermentation en bouteille pendant trois semaines (9,5% alcool). Cette bière complexe dégage des arômes fruités et un parfum de houblon aussi agréable que nuancé. Au palais, on perçoit son caractère soyeux et velouté ainsi qu’une touche d’amertume soutenue par les arômes de fruits. Une bière exceptionnelle, pleine de finesse et d’élégance, se caractérisant également par une arrière-bouche longue et savoureuse."
triplewestmalle.confirmed = true

westvleteren12 = Beer.new
westvleteren12 .name = "Westvleteren 12 "
westvleteren12 .degree = 10.2
westvleteren12 .story = "Brassée par l'Abbaye Saint Sixtus à Westvleteren, cette bière trappiste belge a été élue deux fois meilleur bière au monde. L'abbaye n'aillant jamais augmenter son volume de production (5000 hectolitres par an), la Westvleteren 12 est rare et fort demandée. Sa robe est marron foncé et sa mousse est fine mais ne tient pas longtemps. Au nez, des arômes de malt caramélisé, de prune et de vanille. En bouche,  on découvre une bière complexe, sucrée et ronde. Une bière convoitée avec raison."
westvleteren12 .description = "Sa robe est marron foncé, couronnée d'une fine mousse peu persistante. Au nez, des arômes de malt caramélisé, de prune et de vanille. En bouche,  on découvre une bière complexe, sucrée et ronde. Une bière convoitée avec raison.
Car c'est à Toi qu'appartiennent le Règne, la Puissance et la Gloire, pour les siècles des siècles, Amen."
westvleteren12 .confirmed = true

triplekarmeliet = Beer.new
triplekarmeliet.name = "Triple Karmeliet"
triplekarmeliet.degree = 8.4
triplekarmeliet.story = "La Triple Karmeliet, brassée par la brasserie Bosteels, est inspirée d'une recette élaborée par les moines de Dendermonde au XVIIème siècle.
Comme la recette de la Karmeliet d'origine, elle est préparée à partir de trois céréales: le froment, l'orge et l'avoine, ce qui lui octroie des saveurs complexes qui se révèlent plutôt fruitées et épicées."
triplekarmeliet.description = "Cette bière blonde contient des nuances de doré et de bronze avec un col de mousse crémeux. On perçoit des touches de vanille mélangées avec un arôme citronné dans son odeur. On décèle un goût de froment, d'avoine mais aussi des touches épicées et citronnées."
triplekarmeliet.confirmed = true

bellevuekriek = Beer.new
bellevuekriek.name = "Belle-Vue Kriek"
bellevuekriek.degree = 5.2
bellevuekriek.story = "Traditionnellement les « Schaarbeek krieken » ou « griottes » (une variété de Morello belge) des environs de Bruxelles sont utilisées. Kriek est un mot néerlandais pour cerises acides, par opposition au mot kers, désignant la cerise douce. Comme les cerises de Schaerbeek sont devenues plus difficiles à trouver, des brasseurs les ont remplacées (partiellement ou entièrement) par d'autres variétés de cerises acides, parfois venant d'autres pays.
Traditionnellement, la Kriek est fabriquée par des brasseries de Bruxelles et ses alentours et utilisant une bière lambic dans lesquelles les cerises sont ajoutées (avec le noyau) . Une lambic est une bière belge sèche et acide, de fermentation spontanée sans pétillant ni mousse et connue pour être native de Bruxelles. Une kriek traditionnelle fabriquée à partir d'une bière lambic de base est acide et sèche. Les cerises sont laissées pendant plusieurs mois, causant une refermentation par l'ajout de sucre. Théoriquement aucun sucre n'est perdu ce qui donne un goût fruité. Il y a ensuite un processus de maturation après que les cerises ont été retirées.
Plus récemment, les brasseurs de lambic ajoutent des édulcorants au produit final de leur bière, dans le but de le rendre moins acide et accessible à un plus grand public. Ils utilisent également du jus de cerise plus que les fruits eux-mêmes, ce qui permet de diminuer le temps de maturation. Autrefois, bien avant cette pratique commerciale, certains avaient tendance à ajouter un morceau de sucre dans le verre de kriek afin d'en adoucir le goût."
bellevuekriek.description = "La Kriek est une bière belge aromatisée avec des cerises acides (aussi appelées cerises Morello). Traditionnellement il s'agit d'une lambic, bière de fermentation spontanée, mais la dénomination n'étant pas protégée toute bière aromatisée à la cerise peut être appelée kriek."
bellevuekriek.confirmed = true

pils365 = Beer.new
pils365 .name = "365"
pils365 .degree = 4.7
pils365 .story = "Brassée pour le compte des magasins Delhaize."
pils365 .description = "Brassée pour le compte des magasins Delhaize."
pils365 .confirmed = true

maes = Beer.new
maes .name = "Maes"
maes .degree = 5.2
maes .story = "En 1880, Egied Maes décide d’insuffler une vie nouvelle à la petite brasserie Sint Michaël de Waarloos. Il développe des projets ambitieux pour sa brasserie. En 1901, il passe le flambeau à ses fils, Ferdinand et Theophiel. Ceux-ci y introduisent une mécanisation moderne : une machine à vapeur actionne dorénavant la meule de la malterie et les pales dans les cuves. Une telle révolution exige une modification du nom de l’entreprise qui devient la « Brasserie - Malterie à vapeur St-Michaël - Frères Maes ».
Les frères anticipent également la demande de la clientèle en bières de basse fermentation. Ils lancent leur première pils dans les années 20. En 1926, la troisième génération Maes entre dans l’affaire. Celle-ci investit généreusement dans une salle de brassage de qualité et ces investissements sont rapidement suivis d’effets. En 1930, la brasserie Maes introduit sa Prima Maezenbier à l’occasion de l’Exposition universelle d’Anvers. Les générations suivantes exploitent toute l’expérience accumulée pour mettre le produit parfaitement au point. La pils qui lancée en 1946 sous le nom de Maes, repose donc sur des bases solides.
La brasserie passe dans les mains du groupe anglais Watney Man de 1969 à 1986, date à laquelle elle est reprise par Belgian United Beverages, société contrôlée à 51 % par M. Théo Maes, l'arrière-arrière-petit-fils du fondateur, et à 49 % par le groupe Akkerman-Van Haaren."
maes .description = "La Maes est une bière belge de type pils appartenant à Alken-Maes, filiale du groupe Heineken."
maes .confirmed = true

carapils = Beer.new
carapils.name = "Carapils"
carapils.degree = 4.4
carapils.story = "Commercialisée par le groupe Colruyt en Belgique"
carapils.description = "La Cara Pils est une bière blonde de type pils bon marché qui aurait été produite par la brasserie Alken-Maes, mais qui serait actuellement produite par la Brasserie de Saint-Omer (Nord-Pas-de-Calais - France).
Commercialisée par le groupe Colruyt en Belgique et disponible dans la plupart des night shops. Son taux d'alcool est de 4,4 % en canette et de 4,7 % en bouteille. Son prix dépasse rarement les 50 centimes d'euros en night shops."
carapils.confirmed = true

vedett = Beer.new
vedett.name = "Vedett"
vedett.degree = 5.2
vedett.story = "La Vedett est une pils créée en 1945, confectionnée avec du houblon de Saaz et commercialisée essentiellement en Belgique ; on la trouve également en Grande-Bretagne. Des photos de consommateurs de Vedett, prises dans des bars ou lors d'événements, sont utilisées pour illustrer les étiquettes des bouteilles. Depuis les années 1970, le groupe Duvell Moortgat ne la soutenait plus du tout commercialement. On en buvait juste encore dans quelques cafés de la région de Breendonck (siège du groupe). C’est Frédéric Nicolay, le roi des cafés et restos branchés de la capitale qui l’exhumera de l’oubli. Il la remarque lors d’un de ses passages à la brasserie et décide la lancer dans ses cafés. Cette bière devient vite aussi branchée que les établissements qui la servent. « Alors qu’on n’avait fait aucune publicité, on s’est rendu compte avec surprise qu’elle rencontrait du succès », explique Michel Moortgat. En mai 2003, le brasseur décide d’exploiter le potentiel de cette marque et la relance. La bouteille et le graphique de l’étiquette sont légèrement modernisés mais le caractère rétro est soigneusement préservé. On ajoute la fameuse photo et on choisit une mascotte pour coller à l’image d’autodérision véhiculée par la marque : le pingouin. Le succès ne se fait pas attendre. Entre 2003 et 2004, Moortgat double ses ventes. En mai 2004, la bière fait aussi son entrée dans la grande distribution (Delhaize). Elle possède un degré d'alcool de 5,2° et elle est conditionné en bouteille de 33 cl."
vedett.description = "Cette bière, au logo de pingouin, a une couleur blonde pâle, une mousse blanche et un arôme malté. Il s'agit d'une bière qui se boit aisément grâce à sa saveur très légère. Son volume d'alcool est de 5%.
La Vedett est fabriquée à la brasserie Moorgat à Breendonk.
Il s'agit d'une bière de basse fermentation appartenant à la famille des ""pils"". Depuis un certain temps, la Vedett remporte un succès grandissant sur la marché de la bière."
vedett.confirmed = true
### categories

blondebelge = BeerCategory.new
blondebelge.name = "Blonde Belge"
blondebelge.description = "Une bière dorée modérément alcoolisée avec une complexité à la belge toute subtile et une finale sèche."

blanchebelge = BeerCategory.new
blanchebelge.name = "Blanche Belge"
blanchebelge.description = "Les bières blanches sont des bières brassées avec une forte proportion de froment malté ou non."

brunebelge = BeerCategory.new
brunebelge.name = "Brune Belge"
brunebelge.description = "La bière brune est une bière de couleur brune, du brun acajou au noir ébène, obtenue grâce à l'utilisation de malt plus ou moins torréfié."

stout = BeerCategory.new
stout.name = "Stout"
stout.description = "Un stout est une bière brassée à partir d'un moût caractérisé par sa teneur en grains hautement torréfiés. La présence de ces grains bien grillés dans la recette confère la couleur foncée à la bière ainsi qu'un goût de café ou de cacao. Cette bière est devenue une spécialité irlandaise. Son origine première est cependant anglaise par sa filiation avec la Porter."

trappiste = BeerCategory.new
trappiste.name = "Trappiste"
trappiste.description = "Une trappiste, ou bière trappiste, est une bière brassée au sein même de l'abbaye par ou sous contrôle des moines trappistes. Ces bières trappistes sont généralement de fermentation haute et doivent être brassées dans le respect des critères définis par l'Association Trappiste Internationale si elles veulent pouvoir arborer le logo Authentic trappist product délivré par cette association privée."

fruitees = BeerCategory.new
fruitees.name = "Fruitées"
fruitees.description = "Les bières fruitées sont brassées en ajoutant des fruits ou des jus de fruits au lambic. La plus commune variante est la « Kriek », faite avec des cerises (du nord du pays, de Schaerbeek parfois). Autres fruits utilisés : les framboises, les pêches, les myrtilles et les abricots (Fou’foune de Cantillon, très rare)."
### saving

blondebelge.save
blanchebelge.save
brunebelge.save
stout.save
trappiste.save
fruitees.save

leffeblonde.beer_category = blondebelge
duvelblonde.beer_category = blondebelge
leffebrune.beer_category = brunebelge
guinness.beer_category = stout
blanchehoegaarden.beer_category = blanchebelge
jupiler.beer_category = blondebelge
orval.beer_category = trappiste
triplewestmalle.beer_category = trappiste
westvleteren12.beer_category = trappiste
triplekarmeliet.beer_category = blondebelge
bellevuekriek.beer_category = fruitees
pils365.beer_category = blondebelge
maes.beer_category = blondebelge
carapils.beer_category = blondebelge
vedett.beer_category = blondebelge

leffeblonde.save
duvelblonde.save
leffebrune.save
guinness.save
blanchehoegaarden.save
jupiler.save
orval.save
triplewestmalle.save
westvleteren12.save
triplekarmeliet.save
bellevuekriek.save
pils365.save
maes.save
carapils.save
vedett.save
#############
### Deals ###
#############

dil = Deal.new
dil.name = "Leffe Promo"
dil.description = "Leffe moitié prix"
dil.start_date = "1888-02-21T21:38"
dil.end_date = "1888-02-21T21:38"
dil.reference = 9
dil.beer_id = leffeblonde.id
dil.save

dealduvel = Deal.new
dealduvel.name = "Duvel Summer"
dealduvel.description = "Pack 6+2 Gratuites"
dealduvel.start_date = "1888-02-21T21:38"
dealduvel.end_date = "1888-02-21T21:38"
dealduvel.reference = 10
dealduvel.beer_id = duvelblonde.id
dealduvel.save

#############
### Users ###
#############
adminfriend = Friendlist.new
adminfriend.save

admin = User.new
admin.login = "admin"
admin.email = "michashh@gmail.com"
admin.pwd = "grosbatard"
admin.pwd_confirmation = "grosbatard"
admin.friendlist = adminfriend
admin.admin = true

admin.save

willfriend = Friendlist.new
willfriend.save

willfrit = User.new
willfrit.login = "Willfrit"
willfrit.email = "will.frit@gmail.com"
willfrit.pwd = "groschicon"
willfrit.pwd_confirmation = "groschicon"
willfrit.friendlist = willfriend
willfrit.save

srofriend = Friendlist.new
srofriend.save

srozen = User.new
srozen.login = "Srozen"
srozen.email = "spat.monroe@gmail.com"
srozen.pwd = "groschicon"
srozen.pwd_confirmation = "groschicon"
srozen.friendlist = srofriend
srozen.save

maxfriend = Friendlist.new
maxfriend.save

maxime = User.new
maxime.login = "Maxime"
maxime.email = "maxime9540@gmail.com"
maxime.pwd = "groschicon"
maxime.pwd_confirmation = "groschicon"
maxime.friendlist = maxfriend
maxime.save

########################
### Friends addition ###
########################

#srozenisfriend = Friend.new(:user_id => srozen.id, :friendlist_id => willfriend.id)
#srozenfriendstatus = FriendStatus.new(:status => 'ami', :friends_id => srozen.id, :users_id => willfrit.id)
#srozenisfriend.save
#srozenfriendstatus.save

#willfritisfriend = Friend.new(:user_id => willfrit.id, :friendlist_id => srofriend.id)
#willfritfriendstatus = FriendStatus.new(:status => 'ami', :friends_id => willfrit.id, :users_id => srozen.id)
#willfritisfriend.save
#willfritfriendstatus.save

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

###########################
### Collection Maxime ###
###########################

cm = Collection.new
cm.user = maxime
cm.save
###################
### Bars'n'Shop ###
###################

bl = Shop.new
bl.name = "BeerLover's Shop LLN"
bl.latitude = 50.669723
bl.longitude = 4.615458

blc = ContactDetail.new
blc.telephone = "0497533673"
blc.website = "http://special-beer.com/magasins/antre-de-special-beer/"
blc.street = "Rue des Wallons"
blc.number = "8"
blc.zipcode = "1348"
blc.city = "Louvain-la-Neuve"
blc.country = "Belgique"

blc.beer_place = bl
bl.contact_detail = blc
blc.save
bl.save


bll = Shop.new
bll.name = "BeerLovers' Café & Shop"
bll.latitude = 50.645289
bll.longitude = 5.576112

bllc = ContactDetail.new
bllc.telephone = "042213977"
bllc.website = "http://beer-lovers.be/"
bllc.street = "Rue de la Violette"
bllc.number = "9"
bllc.zipcode = "4000"
bllc.city = "Liège"
bllc.country = "Belgique"

bllc.beer_place = bll
bll.contact_detail = bllc
bllc.save
bll.save

bwc = Shop.new
bwc.name = "Beer, Wine & Coffee"
bwc.latitude = 50.487951
bwc.longitude = 4.793117

bwcc = ContactDetail.new
bwcc.telephone = "081588493"
bwcc.website = "http://www.beerwineandcoffee.be/"
bwcc.street = "Rue du Fond du Maréchal"
bwcc.number = "25"
bwcc.zipcode = "5020"
bwcc.city = "Suarlée"
bwcc.country = "Belgique"

bwcc.beer_place = bwc
bwc.contact_detail = bwcc
bwcc.save
bwc.save


bc = Shop.new
bc.name = "BEER CITY"
bc.latitude = 50.464502
bc.longitude = 4.346180

bcc = ContactDetail.new
bcc.telephone = "0474868984"
bcc.website = "http://www.beer-city.be/fr/"
bcc.street = "Rue de l’épine"
bcc.number = "78"
bcc.zipcode = "6183"
bcc.city = "Trazegnies"
bcc.country = "Belgique"

bcc.beer_place = bc
bc.contact_detail = bcc
bcc.save
bc.save

bb = Bar.new
bb.name = "Beer Bar"
bb.latitude = 50.669048
bb.longitude = 4.613728


### BBC est de très mauvais goût par ailleurs
bbc = ContactDetail.new
bbc.telephone = "010245838"
bbc.website = "http://www.beer-bar.be/"
bbc.street = "Grand-Rue"
bbc.number = "5"
bbc.zipcode = "1348"
bbc.city = "Louvain-la-Neuve"
bbc.country = "Belgique"

bbc.beer_place = bb
bb.contact_detail = bbc
bbc.save
bb.save
##
ch = Bar.new
ch.name = "Café des Halles"
ch.latitude = 50.669260
ch.longitude = 4.616288


### BBC est de très mauvais goût par ailleurs
chc = ContactDetail.new
chc.telephone = "010450334"
chcwebsite = ""
chc.street = "Rue des Wallons"
chc.number = "13"
chc.zipcode = "1348"
chc.city = "Louvain-la-Neuve"
chc.country = "Belgique"

chc.beer_place = ch
ch.contact_detail = chc
chc.save
ch.save
##
ow = Bar.new
ow.name = "Onlywood"
ow.latitude = 50.668620
ow.longitude = 4.616778


### BBC est de très mauvais goût par ailleurs
owc = ContactDetail.new
owc.telephone = "010450361"
owc.website = ""
owc.street = "Place des Wallons"
owc.number = "37"
owc.zipcode = "1348"
owc.city = "Louvain-la-Neuve"
owc.country = "Belgique"

owc.beer_place = ow
ow.contact_detail = owc
owc.save
ow.save
##
cb = Bar.new
cb.name = "Le Cambridge"
cb.latitude = 50.669134
cb.longitude = 4.613501


### BBC est de très mauvais goût par ailleurs
cbc = ContactDetail.new
cbc.telephone = "010451322"
cbc.website = "http://www.lecambridge.be/"
cbc.street = "Grand-Rue"
cbc.number = "3"
cbc.zipcode = "1348"
cbc.city = "Louvain-la-Neuve"
cbc.country = "Belgique"

cbc.beer_place = cb
cb.contact_detail = cbc
cbc.save
cb.save

dil.beer_place = bl
dealduvel.beer_place = bl
bl.deal << dil
bl.deal << dealduvel
dealduvel.save
dil.save
