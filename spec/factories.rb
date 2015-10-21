# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |user|
  user.nom                   "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.pwd                   "foobar"
  user.pwd_confirmation      "foobar"
end
