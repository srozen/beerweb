
# Classe catégorisant un ami, et reprenant un statut de validation afin de
# permettre le blocage, l'acceptation, etc...

class Friend < ActiveRecord::Base
  belongs_to :friendlist
  belongs_to :user
  has_and_belongs_to_many :friend_statuses
end
