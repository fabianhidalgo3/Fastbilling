class FactorCobro < ApplicationRecord
  belongs_to :subempresa
  belongs_to :sector
  belongs_to :tipo_sector
  belongs_to :tipo_tarifa
  has_and_belongs_to_many :comuna
end
