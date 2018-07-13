# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180627133226) do

  create_table "asignacion_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ruta_reparto_id"
    t.integer  "porcion_reparto_id"
    t.integer  "empleado_id"
    t.integer  "orden_reparto_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["empleado_id"], name: "index_asignacion_repartos_on_empleado_id", using: :btree
    t.index ["orden_reparto_id"], name: "index_asignacion_repartos_on_orden_reparto_id", using: :btree
    t.index ["porcion_reparto_id"], name: "index_asignacion_repartos_on_porcion_reparto_id", using: :btree
    t.index ["ruta_reparto_id"], name: "index_asignacion_repartos_on_ruta_reparto_id", using: :btree
  end

  create_table "asignacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "rutum_id"
    t.integer  "porcion_id"
    t.integer  "orden_lectura_id"
    t.integer  "empleado_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["empleado_id"], name: "index_asignacions_on_empleado_id", using: :btree
    t.index ["orden_lectura_id"], name: "index_asignacions_on_orden_lectura_id", using: :btree
    t.index ["porcion_id"], name: "index_asignacions_on_porcion_id", using: :btree
    t.index ["rutum_id"], name: "index_asignacions_on_rutum_id", using: :btree
  end

  create_table "ciudads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "comuna_id"
    t.index ["comuna_id"], name: "index_ciudads_on_comuna_id", using: :btree
  end

  create_table "clave_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.integer  "tipo_cobro_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "codigo"
    t.string   "descripcion_corta"
    t.integer  "num_fotografias"
    t.boolean  "requerido"
    t.boolean  "efectivo"
    t.boolean  "factura"
    t.index ["tipo_cobro_id"], name: "index_clave_lecturas_on_tipo_cobro_id", using: :btree
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "numero_cliente"
    t.string   "rut"
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "direccion"
    t.string   "giro"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "telefono"
    t.string   "memo"
    t.string   "duenorespo"
    t.index ["numero_cliente"], name: "index_clientes_on_numero_cliente", using: :btree
  end

  create_table "comunas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "codigo_sii"
    t.string   "codigo_tesoreria"
    t.string   "nombre"
    t.integer  "provincium_id"
    t.integer  "zona_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "{:foreign_key=>true}_id"
    t.index ["provincium_id"], name: "index_comunas_on_provincium_id", using: :btree
    t.index ["zona_id"], name: "index_comunas_on_zona_id", using: :btree
    t.index ["{:foreign_key=>true}_id"], name: "index_comunas_on_{:foreign_key=>true}_id", using: :btree
  end

  create_table "comunas_factor_cobros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "factor_cobro_id"
    t.integer  "comuna_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["comuna_id"], name: "index_comunas_factor_cobros_on_comuna_id", using: :btree
    t.index ["factor_cobro_id"], name: "index_comunas_factor_cobros_on_factor_cobro_id", using: :btree
  end

  create_table "comunas_sectors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "comuna_id"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comuna_id"], name: "index_comunas_sectors_on_comuna_id", using: :btree
    t.index ["sector_id"], name: "index_comunas_sectors_on_sector_id", using: :btree
  end

  create_table "contratista", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "codigo"
  end

  create_table "contratista_subempresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contratistum_id"
    t.integer  "subempresa_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contratistum_id"], name: "index_contratista_subempresas_on_contratistum_id", using: :btree
    t.index ["subempresa_id"], name: "index_contratista_subempresas_on_subempresa_id", using: :btree
  end

  create_table "contratista_zonas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contratista_id"
    t.integer  "zona_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["contratista_id"], name: "index_contratista_zonas_on_contratista_id", using: :btree
    t.index ["zona_id"], name: "index_contratista_zonas_on_zona_id", using: :btree
  end

  create_table "descuentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.decimal  "monto",          precision: 10
    t.integer  "instalacion_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["instalacion_id"], name: "index_descuentos_on_instalacion_id", using: :btree
  end

  create_table "detalle_documentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "detalle"
    t.decimal  "monto",        precision: 10
    t.integer  "documento_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["documento_id"], name: "index_detalle_documentos_on_documento_id", using: :btree
  end

  create_table "detalle_orden_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "orden_lectura_id"
    t.integer  "numerador_id"
    t.decimal  "lectura_anterior",         precision: 10
    t.decimal  "lectura_promedio",         precision: 10
    t.decimal  "lectura_actual",           precision: 10
    t.decimal  "rango_superior",           precision: 10
    t.decimal  "rango_inferior",           precision: 10
    t.datetime "fecha_ejecucion"
    t.integer  "clave_lectura_id"
    t.integer  "observacione_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "clave_lectura_anterior"
    t.decimal  "m3_acumulados",            precision: 10
    t.integer  "numero_digitos_numerador"
    t.string   "clave_lectura_anterior_2"
    t.string   "clave_lectura_anterior_3"
    t.datetime "fecha_lectura_anterior"
    t.string   "id_gasco"
    t.string   "detalle_id_gasco"
    t.index ["clave_lectura_id"], name: "index_detalle_orden_lecturas_on_clave_lectura_id", using: :btree
    t.index ["numerador_id"], name: "index_detalle_orden_lecturas_on_numerador_id", using: :btree
    t.index ["observacione_id"], name: "index_detalle_orden_lecturas_on_observacione_id", using: :btree
    t.index ["orden_lectura_id"], name: "index_detalle_orden_lecturas_on_orden_lectura_id", using: :btree
  end

  create_table "documentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "monto_total",       precision: 10
    t.integer  "tipo_documento_id"
    t.integer  "orden_lectura_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "folio_id"
    t.index ["folio_id"], name: "index_documentos_on_folio_id", using: :btree
    t.index ["orden_lectura_id"], name: "index_documentos_on_orden_lectura_id", using: :btree
    t.index ["tipo_documento_id"], name: "index_documentos_on_tipo_documento_id", using: :btree
  end

  create_table "empleados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "rut"
    t.integer  "contratistum_id"
    t.integer  "subempresa_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "usuario_id"
    t.index ["contratistum_id"], name: "index_empleados_on_contratistum_id", using: :btree
    t.index ["subempresa_id"], name: "index_empleados_on_subempresa_id", using: :btree
    t.index ["usuario_id"], name: "index_empleados_on_usuario_id", using: :btree
  end

  create_table "empleados_zonas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "empleado_id"
    t.integer  "zona_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["empleado_id"], name: "index_empleados_zonas_on_empleado_id", using: :btree
    t.index ["zona_id"], name: "index_empleados_zonas_on_zona_id", using: :btree
  end

  create_table "empresa_subempresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "empresa_id"
    t.integer  "subempresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["empresa_id"], name: "index_empresa_subempresas_on_empresa_id", using: :btree
    t.index ["subempresa_id"], name: "index_empresa_subempresas_on_subempresa_id", using: :btree
  end

  create_table "empresa_zonas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "empresa_id"
    t.integer  "zona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_empresa_zonas_on_empresa_id", using: :btree
    t.index ["zona_id"], name: "index_empresa_zonas_on_zona_id", using: :btree
  end

  create_table "empresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rut"
    t.string   "razon_social"
    t.string   "giro"
    t.string   "direccion"
    t.integer  "comuna_id"
    t.string   "imagen"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["comuna_id"], name: "index_empresas_on_comuna_id", using: :btree
  end

  create_table "equipos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "mac"
    t.integer  "modelo_id"
    t.integer  "empleado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["empleado_id"], name: "index_equipos_on_empleado_id", using: :btree
    t.index ["modelo_id"], name: "index_equipos_on_modelo_id", using: :btree
  end

  create_table "estado_facturacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estado_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estado_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estanques", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "factor_cobros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "subempresa_id"
    t.integer  "sector_id"
    t.integer  "tipo_sector_id"
    t.integer  "tipo_tarifa_id"
    t.decimal  "cargo_fijo",               precision: 10
    t.decimal  "cargo_unico",              precision: 10
    t.decimal  "cargo_energia_base",       precision: 10
    t.decimal  "cargo_energia_adicional",  precision: 10
    t.decimal  "precio_energia_inyectada", precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "nombre"
    t.index ["sector_id"], name: "index_factor_cobros_on_sector_id", using: :btree
    t.index ["subempresa_id"], name: "index_factor_cobros_on_subempresa_id", using: :btree
    t.index ["tipo_sector_id"], name: "index_factor_cobros_on_tipo_sector_id", using: :btree
    t.index ["tipo_tarifa_id"], name: "index_factor_cobros_on_tipo_tarifa_id", using: :btree
  end

  create_table "folios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "numero_folio"
    t.integer  "codigo_autorizacion"
    t.integer  "estado_facturacion_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["estado_facturacion_id"], name: "index_folios_on_estado_facturacion_id", using: :btree
  end

  create_table "fotografia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "detalle_orden_lectura_id"
    t.string   "archivo"
    t.string   "descripcion"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["detalle_orden_lectura_id"], name: "index_fotografia_on_detalle_orden_lectura_id", using: :btree
  end

  create_table "instalacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint   "codigo_sap"
    t.index ["codigo"], name: "index_instalacions_on_codigo", using: :btree
  end

  create_table "intentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "detalle_orden_lectura_id"
    t.decimal  "lectura",                  precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["detalle_orden_lectura_id"], name: "index_intentos_on_detalle_orden_lectura_id", using: :btree
  end

  create_table "localidades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "zona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zona_id"], name: "index_localidades_on_zona_id", using: :btree
  end

  create_table "marcas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medidors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "numero_medidor"
    t.integer  "modelo_id"
    t.boolean  "propiedad_cliente"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "nro_digitos"
    t.integer  "diametro"
    t.integer  "ano"
    t.index ["modelo_id"], name: "index_medidors_on_modelo_id", using: :btree
    t.index ["numero_medidor"], name: "index_medidors_on_numero_medidor", using: :btree
  end

  create_table "modelos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.text     "caracteristicas", limit: 65535
    t.integer  "marca_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "medidor"
    t.index ["marca_id"], name: "index_modelos_on_marca_id", using: :btree
  end

  create_table "numeradors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observacion_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "observacion"
    t.boolean  "efectivo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "codigo"
  end

  create_table "observaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.integer  "clave_lectura_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "codigo"
    t.string   "codigo_ptc"
    t.integer  "num_fotografias"
    t.boolean  "requerido"
    t.boolean  "efectivo"
    t.boolean  "factura"
    t.boolean  "folio"
    t.index ["clave_lectura_id"], name: "index_observaciones_on_clave_lectura_id", using: :btree
  end

  create_table "orden_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "codigo"
    t.integer  "posicion"
    t.string   "direccion"
    t.string   "direccion_entrega"
    t.string   "numero_poste"
    t.datetime "fecha_carga"
    t.datetime "fecha_propuesta"
    t.datetime "fecha_asignacion"
    t.decimal  "gps_latitud",              precision: 10, scale: 7
    t.decimal  "gps_longitud",             precision: 10, scale: 7
    t.decimal  "ajuste_sencillo_anterior", precision: 6,  scale: 2
    t.decimal  "ajuste_sencillo_actual",   precision: 6,  scale: 2
    t.integer  "instalacion_id"
    t.integer  "medidor_id"
    t.integer  "cliente_id"
    t.integer  "rutum_id"
    t.integer  "tipo_lectura_id"
    t.integer  "estado_lectura_id"
    t.integer  "tipo_tarifa_id"
    t.integer  "tipo_entrega_id"
    t.integer  "tipo_establecimiento_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nro_municipal"
    t.integer  "factor_cobro_id"
    t.string   "calle"
    t.string   "block"
    t.string   "numero_propieda"
    t.string   "numero_departamento"
    t.string   "adicional_direccion"
    t.string   "objeto_conex"
    t.integer  "linea_orden"
    t.integer  "tipo_cliente_id"
    t.integer  "contratista_id"
    t.string   "observacion"
    t.integer  "meses_sin_lectura"
    t.integer  "meses_sin_consumo"
    t.boolean  "flag_corte_suministro"
    t.boolean  "estado_corte"
    t.boolean  "lectura_obligada"
    t.integer  "secuencia_lector"
    t.integer  "ciudad_id"
    t.integer  "comuna_id"
    t.boolean  "relectura"
    t.integer  "folio_casa_cerrada"
    t.boolean  "autorizado_facturacion"
    t.boolean  "facturado"
    t.integer  "tipo_documento_id"
    t.integer  "analisis"
    t.integer  "proceso_lecturas_id"
    t.string   "id_gasco"
    t.string   "lectura_dictada"
    t.string   "foto_lectura_dictada"
    t.integer  "tipo_aparato_id"
    t.index ["ciudad_id"], name: "index_orden_lecturas_on_ciudad_id", using: :btree
    t.index ["cliente_id"], name: "index_orden_lecturas_on_cliente_id", using: :btree
    t.index ["comuna_id"], name: "index_orden_lecturas_on_comuna_id", using: :btree
    t.index ["contratista_id"], name: "index_orden_lecturas_on_contratista_id", using: :btree
    t.index ["estado_lectura_id"], name: "index_orden_lecturas_on_estado_lectura_id", using: :btree
    t.index ["factor_cobro_id"], name: "index_orden_lecturas_on_factor_cobro_id", using: :btree
    t.index ["instalacion_id"], name: "index_orden_lecturas_on_instalacion_id", using: :btree
    t.index ["medidor_id"], name: "index_orden_lecturas_on_medidor_id", using: :btree
    t.index ["proceso_lecturas_id"], name: "index_orden_lecturas_on_proceso_lecturas_id", using: :btree
    t.index ["rutum_id"], name: "index_orden_lecturas_on_rutum_id", using: :btree
    t.index ["tipo_aparato_id"], name: "index_orden_lecturas_on_tipo_aparato_id", using: :btree
    t.index ["tipo_cliente_id"], name: "index_orden_lecturas_on_tipo_cliente_id", using: :btree
    t.index ["tipo_documento_id"], name: "index_orden_lecturas_on_tipo_documento_id", using: :btree
    t.index ["tipo_entrega_id"], name: "index_orden_lecturas_on_tipo_entrega_id", using: :btree
    t.index ["tipo_establecimiento_id"], name: "index_orden_lecturas_on_tipo_establecimiento_id", using: :btree
    t.index ["tipo_lectura_id"], name: "index_orden_lecturas_on_tipo_lectura_id", using: :btree
    t.index ["tipo_tarifa_id"], name: "index_orden_lecturas_on_tipo_tarifa_id", using: :btree
  end

  create_table "orden_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "numero_interno"
    t.bigint   "numero_boleta"
    t.integer  "tipo_documento_id"
    t.date     "fecha_emision"
    t.date     "fecha_vencimiento"
    t.datetime "fecha_entrega"
    t.integer  "total_pago"
    t.integer  "orden_ruta"
    t.integer  "correlativo_impresion"
    t.string   "direccion_entrega"
    t.integer  "comuna_id"
    t.integer  "cliente_id"
    t.integer  "ruta_reparto_id"
    t.integer  "estado_reparto_id"
    t.integer  "tipo_reparto_id"
    t.integer  "tipo_entrega_id"
    t.integer  "observacion_reparto_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "instalacion_id"
    t.datetime "fecha_asignacion"
    t.decimal  "gps_longitud",           precision: 10, scale: 7
    t.decimal  "gps_latitud",            precision: 10, scale: 7
    t.datetime "fecha_carga"
    t.string   "calle"
    t.string   "nro"
    t.string   "edificio"
    t.string   "depto"
    t.string   "piso"
    t.integer  "estanques_id"
    t.index ["cliente_id"], name: "index_orden_repartos_on_cliente_id", using: :btree
    t.index ["comuna_id"], name: "index_orden_repartos_on_comuna_id", using: :btree
    t.index ["estado_reparto_id"], name: "index_orden_repartos_on_estado_reparto_id", using: :btree
    t.index ["estanques_id"], name: "index_orden_repartos_on_estanques_id", using: :btree
    t.index ["instalacion_id"], name: "index_orden_repartos_on_instalacion_id", using: :btree
    t.index ["numero_boleta"], name: "index_orden_repartos_on_numero_boleta", using: :btree
    t.index ["numero_interno"], name: "index_orden_repartos_on_numero_interno", using: :btree
    t.index ["observacion_reparto_id"], name: "index_orden_repartos_on_observacion_reparto_id", using: :btree
    t.index ["ruta_reparto_id"], name: "index_orden_repartos_on_ruta_reparto_id", using: :btree
    t.index ["tipo_documento_id"], name: "index_orden_repartos_on_tipo_documento_id", using: :btree
    t.index ["tipo_entrega_id"], name: "index_orden_repartos_on_tipo_entrega_id", using: :btree
    t.index ["tipo_reparto_id"], name: "index_orden_repartos_on_tipo_reparto_id", using: :btree
  end

  create_table "perfils", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "porcion_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "ano"
    t.integer  "mes"
    t.integer  "zona_id"
    t.integer  "subempresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "abierto"
    t.index ["subempresa_id"], name: "index_porcion_repartos_on_subempresa_id", using: :btree
    t.index ["zona_id"], name: "index_porcion_repartos_on_zona_id", using: :btree
  end

  create_table "porcions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "ano"
    t.integer  "mes"
    t.integer  "zona_id"
    t.integer  "subempresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "abierto"
    t.index ["codigo"], name: "index_porcions_on_codigo", using: :btree
    t.index ["subempresa_id"], name: "index_porcions_on_subempresa_id", using: :btree
    t.index ["zona_id"], name: "index_porcions_on_zona_id", using: :btree
  end

  create_table "proceso_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provincia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_provincia_on_region_id", using: :btree
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumen_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "porcion_id"
    t.string   "proceso"
    t.datetime "fecha_lectura"
    t.string   "conndicion_climatica"
    t.integer  "asignado_plectura"
    t.integer  "claven_plectura"
    t.integer  "pendiente_plectura"
    t.integer  "sin_lectura_plectura"
    t.decimal  "efec_diad_mes_anterior", precision: 6, scale: 2
    t.decimal  "meta",                   precision: 6, scale: 2
    t.integer  "asignado_repaso"
    t.decimal  "inverosimil",            precision: 6, scale: 2
    t.integer  "claven_repaso"
    t.integer  "sin_elctura"
    t.decimal  "efect_repaso",           precision: 6, scale: 2
    t.integer  "clave_nd_repaso"
    t.datetime "fecha_mes_actual"
    t.datetime "fecha_mes_anterior"
    t.datetime "fecha_mes_ano_anterior"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["porcion_id"], name: "index_resumen_lecturas_on_porcion_id", using: :btree
  end

  create_table "ruta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "porcion_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "mes"
    t.integer  "ano"
    t.boolean  "abierto"
    t.string   "condicion_climatica"
    t.index ["codigo"], name: "index_ruta_on_codigo", using: :btree
    t.index ["porcion_id"], name: "index_ruta_on_porcion_id", using: :btree
  end

  create_table "ruta_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "porcion_reparto_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "abierto"
    t.index ["porcion_reparto_id"], name: "index_ruta_repartos_on_porcion_reparto_id", using: :btree
  end

  create_table "saldos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "instalacion_id"
    t.decimal  "monto",          precision: 10
    t.decimal  "intereses",      precision: 10
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["instalacion_id"], name: "index_saldos_on_instalacion_id", using: :btree
  end

  create_table "sectors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subempresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rut"
    t.string   "razon_social"
    t.string   "giro"
    t.string   "direccion"
    t.integer  "comuna_id"
    t.string   "imagen"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["comuna_id"], name: "index_subempresas_on_comuna_id", using: :btree
  end

  create_table "subempresas_zonas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "zona_id"
    t.integer  "subempresa_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["subempresa_id"], name: "index_subempresas_zonas_on_subempresa_id", using: :btree
    t.index ["zona_id"], name: "index_subempresas_zonas_on_zona_id", using: :btree
  end

  create_table "tipo_aparatos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_cobros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_documentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo_sii"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_entregas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "facturacion_en_terreno"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_establecimientos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.boolean  "facturacion_en_terreno"
    t.boolean  "excento"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "codigo"
  end

  create_table "tipo_repartos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_sectors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_tarifas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.boolean  "facturacion_en_terreno"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_tramos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tramos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.integer  "desde"
    t.integer  "hasta"
    t.integer  "precio"
    t.integer  "tipo_tramo_id"
    t.integer  "factor_cobro_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["factor_cobro_id"], name: "index_tramos_on_factor_cobro_id", using: :btree
    t.index ["tipo_tramo_id"], name: "index_tramos_on_tipo_tramo_id", using: :btree
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "perfil_id"
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_usuarios_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  create_table "zonas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "asignacion_repartos", "empleados"
  add_foreign_key "asignacion_repartos", "orden_repartos"
  add_foreign_key "asignacion_repartos", "porcion_repartos"
  add_foreign_key "asignacion_repartos", "ruta_repartos"
  add_foreign_key "asignacions", "empleados"
  add_foreign_key "asignacions", "orden_lecturas"
  add_foreign_key "asignacions", "porcions"
  add_foreign_key "asignacions", "ruta"
  add_foreign_key "ciudads", "comunas"
  add_foreign_key "clave_lecturas", "tipo_cobros"
  add_foreign_key "comunas", "provincia"
  add_foreign_key "comunas", "zonas"
  add_foreign_key "comunas_factor_cobros", "comunas"
  add_foreign_key "comunas_factor_cobros", "factor_cobros"
  add_foreign_key "comunas_sectors", "comunas"
  add_foreign_key "comunas_sectors", "sectors"
  add_foreign_key "contratista_subempresas", "contratista"
  add_foreign_key "contratista_subempresas", "subempresas"
  add_foreign_key "contratista_zonas", "contratista", column: "contratista_id"
  add_foreign_key "contratista_zonas", "zonas"
  add_foreign_key "descuentos", "instalacions"
  add_foreign_key "detalle_documentos", "documentos"
  add_foreign_key "detalle_orden_lecturas", "clave_lecturas"
  add_foreign_key "detalle_orden_lecturas", "numeradors"
  add_foreign_key "detalle_orden_lecturas", "observaciones"
  add_foreign_key "detalle_orden_lecturas", "orden_lecturas"
  add_foreign_key "documentos", "folios"
  add_foreign_key "documentos", "orden_lecturas"
  add_foreign_key "documentos", "tipo_documentos"
  add_foreign_key "empleados", "contratista"
  add_foreign_key "empleados", "subempresas"
  add_foreign_key "empleados", "usuarios"
  add_foreign_key "empleados_zonas", "empleados"
  add_foreign_key "empleados_zonas", "zonas"
  add_foreign_key "empresa_subempresas", "empresas"
  add_foreign_key "empresa_subempresas", "subempresas"
  add_foreign_key "empresa_zonas", "empresas"
  add_foreign_key "empresa_zonas", "zonas"
  add_foreign_key "empresas", "comunas"
  add_foreign_key "equipos", "empleados"
  add_foreign_key "equipos", "modelos"
  add_foreign_key "factor_cobros", "sectors"
  add_foreign_key "factor_cobros", "subempresas"
  add_foreign_key "factor_cobros", "tipo_sectors"
  add_foreign_key "factor_cobros", "tipo_tarifas"
  add_foreign_key "folios", "estado_facturacions"
  add_foreign_key "fotografia", "detalle_orden_lecturas"
  add_foreign_key "intentos", "detalle_orden_lecturas"
  add_foreign_key "localidades", "zonas"
  add_foreign_key "medidors", "modelos"
  add_foreign_key "modelos", "marcas"
  add_foreign_key "observaciones", "clave_lecturas"
  add_foreign_key "orden_lecturas", "ciudads"
  add_foreign_key "orden_lecturas", "clientes"
  add_foreign_key "orden_lecturas", "comunas"
  add_foreign_key "orden_lecturas", "contratista", column: "contratista_id"
  add_foreign_key "orden_lecturas", "estado_lecturas"
  add_foreign_key "orden_lecturas", "factor_cobros"
  add_foreign_key "orden_lecturas", "instalacions"
  add_foreign_key "orden_lecturas", "medidors"
  add_foreign_key "orden_lecturas", "proceso_lecturas", column: "proceso_lecturas_id"
  add_foreign_key "orden_lecturas", "ruta"
  add_foreign_key "orden_lecturas", "tipo_aparatos"
  add_foreign_key "orden_lecturas", "tipo_clientes"
  add_foreign_key "orden_lecturas", "tipo_documentos"
  add_foreign_key "orden_lecturas", "tipo_entregas"
  add_foreign_key "orden_lecturas", "tipo_establecimientos"
  add_foreign_key "orden_lecturas", "tipo_lecturas"
  add_foreign_key "orden_lecturas", "tipo_tarifas"
  add_foreign_key "orden_repartos", "clientes"
  add_foreign_key "orden_repartos", "comunas"
  add_foreign_key "orden_repartos", "estado_repartos"
  add_foreign_key "orden_repartos", "estanques", column: "estanques_id"
  add_foreign_key "orden_repartos", "instalacions"
  add_foreign_key "orden_repartos", "observacion_repartos"
  add_foreign_key "orden_repartos", "ruta_repartos"
  add_foreign_key "orden_repartos", "tipo_documentos"
  add_foreign_key "orden_repartos", "tipo_entregas"
  add_foreign_key "orden_repartos", "tipo_repartos"
  add_foreign_key "porcion_repartos", "subempresas"
  add_foreign_key "porcion_repartos", "zonas"
  add_foreign_key "porcions", "subempresas"
  add_foreign_key "porcions", "zonas"
  add_foreign_key "provincia", "regions"
  add_foreign_key "resumen_lecturas", "porcions"
  add_foreign_key "ruta", "porcions"
  add_foreign_key "ruta_repartos", "porcion_repartos"
  add_foreign_key "saldos", "instalacions"
  add_foreign_key "subempresas", "comunas"
  add_foreign_key "subempresas_zonas", "subempresas"
  add_foreign_key "subempresas_zonas", "zonas"
  add_foreign_key "tramos", "factor_cobros"
  add_foreign_key "tramos", "tipo_tramos"
  add_foreign_key "usuarios", "perfils"
end
