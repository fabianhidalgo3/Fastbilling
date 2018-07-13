class Subempresa < ApplicationRecord
  belongs_to :comuna
  has_many :factor_cobro
  has_and_belongs_to_many :zona
  has_many  :empleado
  has_and_belongs_to_many :contratistum
end
