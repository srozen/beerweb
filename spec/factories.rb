# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
FactoryGirl.define do
  factory :user do |user|
    user.login                  "MichaelHartl"
    user.email                  "mhartl@example.com"
    user.pwd                    "foobar"
    user.pwd_confirmation       "foobar"
    user.firstName              "Samuel"
    user.lastName               "Monroe"
  end
end
