class PendienteFacturacionController < ApplicationController
	
	def index
		@empresas = Empresa.all
		@tipo_documentos = TipoDocumento.all	
		@estado_facturacions = EstadoFacturacion.all
	end
	
end
