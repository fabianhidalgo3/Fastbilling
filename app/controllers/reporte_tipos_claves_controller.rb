class ReporteTiposClavesController < ApplicationController
	def index # > Pagina Principal
		user = current_usuario	# > Busca usuario y zonas y porcion del usuario logueado
    @zonas = user.empleado.zona
		@claves = ClaveLectura.all
		@totales = Array.new
	end

	respond_to :js, :html, :json
	def carga_porciones 	# => Carga Porciones		
		zona = params[:zona].to_i
		@porciones = Porcion.where(zona_id: zona)
		respond_with @porciones
	end



	respond_to :js, :html, :json
	def carga_filtro 	# => Filtro del Reporte		
		@lista = Array.new
		@totales = Array.new
		t_asignado = 0
		t_claveEfectivo = 0
		t_claveImprocedente = 0
		t_problemasTecnicos = 0
		asignado = 0
		claveEfectivo = 0
		claveImprocedente = 0
		problemasTecnicos = 0
		total = 0
		t_efectividad =0
		contador = 0
		listaEmpleados = Empleado.joins(:usuario).where(usuarios: {perfil_id: [6,7]})		
	 	listaEmpleados.each do |empleado|
			listaAsignaciones = Asignacion.where(empleado_id: empleado.id).joins(:porcion,
				:orden_lectura).where(porcions:{ zona_id: params[:zona].to_i, id: params[:porcion].to_i },
				orden_lecturas:{estado_lectura_id: [2,3,4,5]}).group(:rutum_id)
		
		 if !listaAsignaciones.blank?
			 listaAsignaciones.each do |asignacion|
				 ruta = asignacion.rutum
				 comuna = asignacion.orden_lectura.comuna.nombre
				 asignado = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura).where(orden_lecturas:{relectura:false, estado_lectura_id:[2..5]}).count
				 ln = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "LN"}).count
				 ce = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "CE"}).count
				 xc = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "XC"}).count
				 ex = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "EX"}).count
				 mr = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "MR"}).count
				 ei = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "EI"}).count
				 cm = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "CM"}).count
				 lc = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "LC"}).count
				 sc = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "SC"}).count
				 gc = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "GC"}).count
				 cb = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "CB"}).count
				 sm = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "SM"}).count
				 vs = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "VS"}).count
				 es = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "ES"}).count
				 vr = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "VR"}).count
				 cc = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "CC"}).count
				 dh = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "DH"}).count
				 na = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "NA"}).count
				 cd = Asignacion.where(empleado_id: asignacion.empleado_id, rutum_id: asignacion.rutum_id).joins(:orden_lectura => [:detalle_orden_lectura => :clave_lectura]).where(orden_lecturas: {estado_lectura_id: [4,5],relectura:false}, clave_lecturas: {codigo: "CD"}).count
				 
				 
				 
				 @lista.push([ruta.porcion.codigo_nombre, comuna, empleado.nombre_completo, 
				 							ruta.codigo, asignado,ln,ce,xc,ex,mr,ei,cm,lc,sc,gc,cb,sm,vs,es,vr,cc,dh,na,cd])
			 end
			 	contador += contador
				t_asignado +=  asignado	
				t_claveEfectivo = t_claveEfectivo + claveEfectivo
				t_claveImprocedente = t_claveImprocedente + claveImprocedente
				t_problemasTecnicos = t_problemasTecnicos + problemasTecnicos	
				total = total + (claveEfectivo + claveImprocedente + problemasTecnicos)
				if t_efectividad > 0
					t_efectividad = (t_efectividad + (claveEfectivo*100.0)/asignado).round(2)/contador
				end
		 end 
	 end
	 @totales.push(t_asignado, t_claveEfectivo, t_claveImprocedente, t_problemasTecnicos, total, t_efectividad)
	 # > Ordena Lista por Nombre Ruta
	 @lista.sort! {|a,b| a[3] <=> b[3]}
	 respond_with @lista
	end
end
