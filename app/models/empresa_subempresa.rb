class EmpresaSubempresa < ApplicationRecord
  belongs_to :empresa
  belongs_to :subempresa
end
