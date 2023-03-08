class Race < ApplicationRecord
  belongs_to :universe
  has_many :pnjs
  has_many :party_races
  belongs_to :party, through: :party_races
end