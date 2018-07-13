class Tramo < ApplicationRecord
  belongs_to :tipo_tramo
  belongs_to :factor_cobro
end
