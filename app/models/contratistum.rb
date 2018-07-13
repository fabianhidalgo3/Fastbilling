class Contratistum < ApplicationRecord
	has_and_belongs_to_many :subempresa
	has_many :orden_lectura
end
