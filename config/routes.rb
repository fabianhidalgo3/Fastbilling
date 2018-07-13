Rails.application.routes.draw do

  resources :estanques
  
  devise_for :usuarios

  # > Ruta Principal
  root 'bienvenida#index'
  
  # > General
  resources :bienvenida do
    collection do 
      get 'dashboard'
      get 'descargar_manual_web'
      get 'descargar_manual_app'
    end
  end
 
  # > Rutas Catastros
  # > Perfiles de Usuarios
  resources :perfils do
    collection do
      get 'exportar_csv'
      get 'exportar_pdf'
    end
  end
  match 'catastro/perfiles' => 'perfils#index', via: [:get, :post]

  # > Usuarios Administrativos
  resources :usuarios_administrativos do 
    collection do 
    	post 'cambiar'
      get 'modificar_contrasena'
      get 'exportar_pdf'
      get 'exportar_csv'
    end
  end
  match 'catastro/empleados/administrativos' => 'usuarios_administrativos#index', via: [:post, :get]

  # > Usuarios Agente de Terreno
  resources :usuarios_agentes_terreno do 
    collection do 
    	post 'cambiar'
      get 'modificar_contrasena'
      get 'exportar_pdf'
      get 'exportar_csv'
    end
  end
  match 'catastro/empleados/agentes_terreno' => 'usuarios_agentes_terreno#index', via: [:post, :get]

	# > Factor de Cobros 
  resources :factor_cobros do
    collection do
      get 'carga_tramos'
    end
  end
  match 'catastro/tarifas' => 'factor_cobros#index', via: [:get, :post]
  
  # > Comunas Factor Cobros
  resources :comunas_factor_cobros do
    collection do
      get 'carga_comunas'
      get 'carga_provincias'
    end
  end
  match 'catastro/vinculacion_tarifa' => 'comunas_factor_cobros#index', via: [:post, :get]

  # > Claves y Observaciones de lectura
  resources :clave_lecturas do 
    collection do
      get 'exportar_csv'
      get 'exportar_pdf'
    end
  end
  match 'catastro/clave_lecturas' => 'clave_lecturas#index', via: [:get, :post]

  # > Observaciones de Reparto
  resources :observacion_repartos do 
    collection do 
      get 'exportar_csv'
      get 'exportar_pdf'
    end
  end
  match 'catastro/observacion_repartos' => 'observacion_repartos#index', via: [:get, :post]


  # > Routes Lectura
  # > Importar Ordenes de Lectura
  resources :cargaordenes do 
    collection do
      get :import_csv, :as => :import_csv
      get :import_xml, :as => :import_xml
    end
  end
  match 'lectura/operaciones/importar_ordenes_lectura' => 'cargaordenes#index', via: [:post, :get]
  match  'cargaordenes/import_csv'        =>          'cargaordenes#import_csv', via: [:post]
  match  'cargaordenes/import_xml'        =>          'cargaordenes#import_xml', via: [:post]

  resources :asignacions do #Asignacion de Ordenes de Lectura
    collection do
      get 'carga_porciones'
      get 'carga_filtro'
      get 'carga_dividir_ruta_asignacion'
      get 'carga_dividir_ruta_desasignacion'
      get 'asignacion_lecturas'
      get 'asignacion_completa'
      get 'desasignacion_completa'
      get 'desasignacion_parcial'
      get 'asignacion_parcial'
    end
  end
  match 'lectura/operaciones/asignacion_lecturas' => 'asignacions#index', via: [:post, :get]


  resources :impresion_ruteros do #Impresión de Ruteros
    collection do
      get 'carga_filtro'
      get 'carga_porciones'
      get 'carga_rutas'
      get 'exportar_csv'
      get 'exportar_pdf'
    end
  end
  match 'lectura/operaciones/impresion_ruteros' => 'impresion_ruteros#index', via: [:post, :get]

  resources :monitor_lectores do #Monitor de Lectores en Terreno
    collection do
      get 'carga_filtro'
      get 'carga_ubicacion'
      get 'carga_porciones'
    end
  end
  match 'lectura/operaciones/monitor_lectores' => 'monitor_lectores#index', via: [:post, :get]

  resources :cerrar_procesos_lecturas do #Cerrar Procesos de lectura
    collection do
      get 'carga_filtro'
    end
  end
  match 'lectura/operaciones/cerrar_procesos_lecturas' => 'cerrar_procesos_lecturas#index', via: [:post, :get]
  
  resources :lectura_dictada_cliente do # Lecturas Dictadas por Cliente
    collection do
      get 'tabla_contenido'
      get 'form_lectura_dictada'
      get 'agregar_lectura_dictada'
      get 'alertas'
    end
  end
  match 'lectura/analisis_online/lectura_dictada_cliente' => 'lectura_dictada_cliente#index', via: [:post, :get]

  resources :analisis do #Analisis Dudosos e Improcedentes
    collection do
      get 'carga_fotografia'
      get 'carga_comuna'
      get 'carga_dudosos'
      get 'carga_improcedentes'
      get 'modificar_lectura'
      get 'guardar_lectura'
      get 'dudosos'
      get 'improcedentes'
      get 'consumo_descontable'
      get 'consumo_no_descontable'
      get 'releer'
      get 'relectura'
      get 'autoriza_facturacion'
    end
  end
  match 'lectura/analisis_online/clientes_dudosos' => 'analisis#dudosos', via: [:post, :get]
  match 'lectura/analisis_online/clientes_improcedentes' => 'analisis#improcedentes', via: [:post, :get]

  resources :historico_lecturas do #Historico de lecturas de un cliente
    collection do 
      get 'carga_filtro'
      get 'carga_fotografia'
      get 'exportar_csv'
      get 'exportar_pdf'
      get 'carga_ubicacion'
    end
  end
  match 'lectura/analisis_online/historico_lecturas' => 'historico_lecturas#index', via: [:get, :post]

  
  resources :clientes_repaso do #Clientes Pendientes de Verificación
    collection do 
      get 'exportar_csv'
    end
  end
  match 'lectura/analisis_online/clientes_pendientes_verificacion' => 'clientes_repaso#index', via: [:post, :get]

  resources :completitud_lecturas # Reporte Efectividad Procesos
  match 'lectura/reportes/efectividad_procesos' => 'completitud_lecturas#index', via: [:post, :get]

  resources :reporte_efectividad_porcion do # Reporte Efectividad Porción
    collection do
      get 'carga_porciones'
      get 'carga_filtro'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
  end
  match 'lectura/reportes/efectividad_porcion' => 'reporte_efectividad_porcion#index', via: [:post, :get]

	resources :reporte_efectividad_lector do #Reporte Efectividad por porcion
    collection do
      get 'carga_lectores'
      get 'carga_filtro'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
  end
  match 'lectura/reportes/efectividad_lector' => 'reporte_efectividad_lector#index', via: [:post, :get]


	resources :reporte_casa_cerrada do #Reporte casa cerrada
		collection do 
			get 'carga_porciones'
      get 'carga_filtro'
      get 'exportar_excel'
			get 'exportar_pdf'
			get 'carga_lectores'
		end
  end
  match 'lectura/reportes/casa_cerrada' => 'reporte_casa_cerrada#index', via: [:post, :get]

  resources :reporte_control_coordenadas do # => OK
    collection do
      get 'carga_rutas'
      get 'carga_porciones'
      get 'carga_empleados'
      get 'carga_filtro'
      get 'carga_ubicacion'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
  end
	match 'lectura/reportes/control_coordenadas_gps' => 'reporte_control_coordenadas#index', via: [:post, :get]
  
  resources :reporte_numero_intentos_lector do #Reporte numero de intentos por lector
    collection do
      get 'carga_porciones'
      get 'carga_empleados'
      get 'carga_comunas'
      get 'carga_filtro'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
  end
  match 'lectura/reportes/numero_intentos_lector' => 'reporte_numero_intentos_lector#index', via: [:post, :get]


	resources :reporte_tipos_claves do # Reporte Tipo de Claves 
    collection do
      get 'carga_porciones'
      get 'carga_filtro'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
  end
  match 'lectura/reportes/tipos_claves' => 'reporte_tipos_claves#index', via: [:post, :get]

  resources :reporte_llenado_estanques do
    collection do
      get 'tabla_contenido'
      get 'porciones'
    end
  end
  match 'lectura/reportes/llenado_estanques' => 'reporte_llenado_estanques#index', via: [:post, :get]
  
  resources :reporte_control_horas_terreno do
    collection do
      get 'carga_porciones'
      get 'carga_empleados'
      get 'carga_comunas'
      get 'carga_filtro'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
  end
  match 'lectura/reportes/control_horas_lector_terreno' => 'reporte_control_horas_terreno#index', via: [:post, :get]
 
	
	resources :reporte_nveces_sinlecturaefectiva do
    collection do
      get 'carga_porciones'
      get 'carga_filtro'
      get 'carga_comunas'
      get 'exportar_excel'
      get 'exportar_pdf'
    end
	end	
  match 'reportes/efectividad_lector_proceso' => 'reporte_once#index', via: [:post, :get]


  # ---------------------------------------------------------------------- Reparto-------###############
 resources :carga_ordenes_reparto do #Importar Ordenes de Repartos
    collection do
      post :import
    end
  end
  match 'reparto/operaciones/importar_ordenes_reparto' => 'carga_ordenes_reparto#index', via: [:post, :get]

  resources :asignacion_repartos do #Asignaciones de Repartos
    collection do 
      get 'porciones'
      get 'tabla_contenido'
      get 'asignacion_completa'
      get 'dividir_ruta_asignacion'
      get 'asignacion_parcial'
      get 'desasignacion_completa'
      get 'dividir_ruta_desasignacion'
      get 'desasignacion_parcial'
   		get 'alertas'
    end
  end
  match 'reparto/operaciones/asignacion_repartos' => 'asignacion_repartos#index', via: [:post, :get]

  resources :monitor_repartidores do #Monitor de Repartidores
    collection do
      get 'carga_filtro'
      get 'carga_ubicacion'
      get 'carga_porciones'
    end
  end
  match 'reparto/operaciones/monitor_repartidores' => 'monitor_repartidores#index', via: [:post, :get]

  
	resources :cerrar_procesos_repartos do #Cerrar Procesos de Repartos
		collection do 
			get 'carga_filtro'
		end
	end
  match 'reparto/operaciones/cerrar_procesos_repartos' => 'cerrar_procesos_repartos#index', via: [:post, :get]

	resources :historico_documentos do #Historico de Documentos
		collection do
			get 'carga_filtro'
			get 'carga_fotografia'
			get 'exportar_excel'
			get 'exportar_pdf'
		end
	end
  match 'reparto/gestion_repartos/historico_documentos' => 'historico_documentos#index', via: [:post, :get]

	resources :devoluciones do #Devolución de Documentos
		collection do
			get 'carga_filtro'
			get 'crear_devolucion'
		end
	end
  match 'reparto/gestion_repartos/devoluciones' => 'devoluciones#index', via: [:post, :get]

	resources :completitud_repartos #Reporte de Efectividad de Procesos
  match 'reparto/reportes/efectividad_procesos' => 'completitud_repartos#index', via: [:post, :get]

	
	resources :reporte_devoluciones do #Reporte de Devoluciones
		collection do 
			get 'carga_filtro'
		end
	end
  match 'reparto/reportes/devoluciones' => 'reporte_devoluciones#index', via: [:post, :get]

  resources :reporte_control_entregas do #Reporte Control de Entregas
		collection do 
			get 'carga_filtro'
		end
	end
  match 'reparto/reportes/control_entregas' => 'reporte_control_entregas#index', via: [:post, :get]


  # ---------------------------------------------------------------------- Mantenedores
  resources :empleados do
    collection do
      get 'carga_subempresas'
      get 'carga_zonas'
      get 'carga_equipos'
      get 'carga_modelos'
      get 'carga_contratistas'
    end
  end


 # ---------------------------------------------------------------------- Facturación

  resources :libro_ventas do 
    collection do 
      get 'crear_libro'
      get 'rectificar_libro'
    end
  end

  resources :folios_disponibles do 
    collection do 
    end
  end

  resources :documentos_emitidos do 
    collection do 
      get 'carga_filtro'
    end
  end

  resources :pendiente_facturacion do 
    collection do 
    end
  end

  resources :facturacion do
    collection do
      get 'facturacion_pendiente'
      get 'consumo_folios'
      get 'index'
    end
  end
  
  
  # ---------------------------------------------------------------------- Api/Android
  namespace :api, :defaults => {:format => :json} do
    resources :perfils
    resources :equipos
    resources :clave_lecturas
    resources :observaciones
    resources :usuarios
    resources :asignacions do
      collection do
        get 'desasignacion'
      end
    end
    resources :ruta
    resources :orden_lecturas
    resources :clientes
    resources :instalacions
    resources :medidors
    resources :intentos
    resources :detalle_orden_lecturas
    resources :fotografia
    resources :orden_repartos
    resources :asignacion_repartos
    devise_for :usuario, :controllers => {:registrations => "api/registrations", :sessions => "api/sessions"}
  end

end
