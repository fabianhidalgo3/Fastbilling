# > Zonas
puts "Creando zonas"
Zona.create(id:1, codigo: '01',nombre: 'Región de Tarapacá')
Zona.create(id:2, codigo: '02',nombre: 'Región de Antofagasta')
Zona.create(id:3, codigo: '03',nombre: 'Región de Atacama')
Zona.create(id:4, codigo: '04',nombre: 'Región de Coquimbo')
Zona.create(id:5, codigo: '05',nombre: 'Región  de Valparaíso')
Zona.create(id:6, codigo: '06',nombre: 'Región del Libertador Gral. Bernardo O`Higgins')
Zona.create(id:7, codigo: '07',nombre: 'Región del Maule')
Zona.create(id:8, codigo: '08',nombre: 'Región del Bio Bio')
Zona.create(id:9, codigo: '09',nombre: 'Región de la Araucania')
Zona.create(id:10, codigo: '10',nombre: 'Región de los Lagos')
Zona.create(id:11, codigo: '11',nombre: 'Región Aisén del Gral. Carlos Ibáñez del Campo')
Zona.create(id:12, codigo: '12',nombre: 'Región de Magallanes y de la Antártica Chilena')
Zona.create(id:13, codigo: '13',nombre: 'Región Metropolitana de Santiago')
Zona.create(id:14, codigo: '14',nombre: 'Región de los Rios')
Zona.create(id:15, codigo: '15',nombre: 'Region de Arica y Parinacota')

 # > Regiones
p "Creando Region y Provincias de  Región Tarapacá" # I
Region.create(id:1, codigo: '01',nombre: 'Región de Tarapacá')
  Provincium.create(id:1,codigo: '011', nombre: 'Iquique', region_id: 1)
    Comuna.create(codigo: '01101', nombre: 'Iquique', provincium_id: 1, zona_id: 1)
    Comuna.create(codigo: '01107', nombre: 'Alto Hospicio', provincium_id: 1, zona_id: 1)
  Provincium.create(id:2,codigo: '014', nombre: 'Tamarugal', region_id: 1)
    Comuna.create(codigo: '01401', nombre: 'Pozo Almonte', provincium_id: 2, zona_id: 1)
    Comuna.create(codigo: '01402', nombre: 'Camiña', provincium_id: 2, zona_id: 1)
    Comuna.create(codigo: '01403', nombre: 'Colchane', provincium_id: 2, zona_id: 1)
    Comuna.create(codigo: '01404', nombre: 'Huara', provincium_id: 2, zona_id: 1)
    Comuna.create(codigo: '01405', nombre: 'Pica', provincium_id: 2, zona_id: 1)

p "Creando Region y Provincias de  Región de Antofasta" # II
Region.create(id:2, codigo: '02', nombre: 'Región de Antofagasta')
  Provincium.create(id:3, codigo: '021', nombre: 'Antofagasta', region_id: 2)
    Comuna.create(codigo: '02101', nombre: 'Antofagasta', provincium_id: 3, zona_id: 2)
    Comuna.create(codigo: '02102', nombre: 'Mejillones', provincium_id: 3, zona_id: 2)
    Comuna.create(codigo: '02103', nombre: 'Sierra Gorda', provincium_id: 3, zona_id: 2)
    Comuna.create(codigo: '02104', nombre: 'Taltal', provincium_id: 3, zona_id: 2)
  Provincium.create(id:4, codigo: '022', nombre: 'El Loa', region_id: 2)
    Comuna.create(codigo: '02201', nombre: 'Calama', provincium_id: 4, zona_id: 2)
    Comuna.create(codigo: '02202', nombre: 'Ollague', provincium_id: 4, zona_id: 2)
    Comuna.create(codigo: '02203', nombre: 'San Pedro de Atacama', provincium_id: 4, zona_id: 2)
  Provincium.create(id:5, codigo: '023', nombre: 'Tocopilla', region_id: 2)
    Comuna.create(codigo: '02301', nombre: 'Tocopilla', provincium_id: 5, zona_id: 2)
    Comuna.create(codigo: '02302', nombre: 'Maria Elena', provincium_id: 5, zona_id: 2)

p "Creando Región y Provincias de Región de Atacama" # III
Region.create(id:3, codigo: '03', nombre: 'Región de Atacama')
  Provincium.create(id:6,codigo: '031', nombre:'Copiapo', region_id: 3)
    Comuna.create(codigo: '03101', nombre: 'Copiapo', provincium_id: 6, zona_id: 3)
    Comuna.create(codigo: '03102', nombre: 'Caldera', provincium_id: 6, zona_id: 3)
    Comuna.create(codigo: '03103', nombre: 'Tierra Amarilla', provincium_id: 6, zona_id: 3)
  Provincium.create(id:7,codigo: '032', nombre:'Chañaral', region_id:3)
    Comuna.create(codigo: '03201', nombre: 'Chañaral', provincium_id: 7, zona_id: 3)
    Comuna.create(codigo: '03202', nombre: 'Diego de Almagro', provincium_id: 7, zona_id: 3)
  Provincium.create(id:8,codigo: '033', nombre:'Huasco', region_id:3)
    Comuna.create(codigo: '03301', nombre: 'Vallenar', provincium_id: 8, zona_id: 3)
    Comuna.create(codigo: '03302', nombre: 'Alto del Carmen', provincium_id: 8, zona_id: 3)
    Comuna.create(codigo: '03303', nombre: 'Freirina', provincium_id: 8, zona_id: 3)
    Comuna.create(codigo: '03304', nombre: 'Huasco', provincium_id: 8, zona_id: 3)

p "Creando Región y Provincias de Región de Coquimbo" # IV
Region.create(id:4, codigo: '04',nombre: 'Región de Coquimbo')
  Provincium.create(id:9, codigo: '041', nombre: 'Elqui', region_id: 4)
    Comuna.create(codigo: '04101', nombre: 'La Serena', provincium_id: 9, zona_id: 4)
    Comuna.create(codigo: '04102', nombre: 'Coquimbo', provincium_id: 9, zona_id: 4)
    Comuna.create(codigo: '04103', nombre: 'Andacollo', provincium_id: 9, zona_id: 4)
    Comuna.create(codigo: '04104', nombre: 'La Higuera', provincium_id: 9, zona_id: 4)
    Comuna.create(codigo: '04105', nombre: 'Paiguano', provincium_id: 9, zona_id: 4)
    Comuna.create(codigo: '04106', nombre: 'Vicuña', provincium_id: 9, zona_id: 4)
  Provincium.create(id:10, codigo: '042', nombre: 'Choapa', region_id: 4)
    Comuna.create(codigo: '04201', nombre: 'Illapel', provincium_id: 10, zona_id: 4)
    Comuna.create(codigo: '04202', nombre: 'Canela', provincium_id: 10, zona_id: 4)
    Comuna.create(codigo: '04203', nombre: 'Los Vilos', provincium_id: 10, zona_id: 4)
    Comuna.create(codigo: '04204', nombre: 'Salamanca', provincium_id: 10, zona_id: 4)
  Provincium.create(id:11,codigo: '043', nombre: 'Limarí', region_id: 4)
    Comuna.create(codigo: '04301', nombre: 'Ovalle', provincium_id: 11, zona_id: 4)
    Comuna.create(codigo: '04302', nombre: 'Combarbala', provincium_id: 11, zona_id: 4)
    Comuna.create(codigo: '04303', nombre: 'Monte Patria', provincium_id: 11, zona_id: 4)
    Comuna.create(codigo: '04304', nombre: 'Punitaqui', provincium_id: 11, zona_id: 4)
    Comuna.create(codigo: '04305', nombre: 'Rio Hurtado', provincium_id: 11, zona_id: 4)

p "Creando Región y Provincias de Región de Valparaiso" # V
Region.create(id:5, codigo: '05',nombre: 'Región  de Valparaíso')
  Provincium.create(id:12, codigo: '051', nombre: 'Valparaíso', region_id: 5)
    Comuna.create(codigo: '05101', nombre: 'Vaparaiso', provincium_id: 12, zona_id: 5)
    Comuna.create(codigo: '05102', nombre: 'Casablanca', provincium_id: 12, zona_id: 5)
    Comuna.create(codigo: '05103', nombre: 'Concon', provincium_id: 12, zona_id: 5)
    Comuna.create(codigo: '05104', nombre: 'Juan Fernandez', provincium_id: 12, zona_id: 5)
    Comuna.create(codigo: '05105', nombre: 'Puchuncavi', provincium_id: 12, zona_id: 5)
    Comuna.create(codigo: '05107', nombre: 'Quintero', provincium_id: 12, zona_id: 5)
    Comuna.create(codigo: '05109', nombre: 'Viña del Mar', provincium_id: 12, zona_id: 5)
  Provincium.create(id:13,codigo: '052', nombre: 'Isla de Pascua', region_id: 5)
    Comuna.create(codigo: '05201', nombre: 'Isla de Pascua', provincium_id: 13, zona_id: 5)
  Provincium.create(id:14,codigo: '053', nombre: 'Los Andes', region_id: 5)
    Comuna.create(codigo: '05301', nombre: 'Los Andes', provincium_id: 14, zona_id: 5)
    Comuna.create(codigo: '05302', nombre: 'Calle Larga', provincium_id: 14, zona_id: 5)
    Comuna.create(codigo: '05303', nombre: 'Rinconada', provincium_id: 14, zona_id: 5)
    Comuna.create(codigo: '05304', nombre: 'San Esteban', provincium_id: 14, zona_id: 5)
  Provincium.create(id:15,codigo: '054', nombre: 'Petorca', region_id: 5)
    Comuna.create(codigo: '05401', nombre: 'La Ligua', provincium_id: 15, zona_id: 5)
    Comuna.create(codigo: '05402', nombre: 'Cabildo', provincium_id: 15, zona_id: 5)
    Comuna.create(codigo: '05403', nombre: 'Papudo', provincium_id: 15, zona_id: 5)
    Comuna.create(codigo: '05404', nombre: 'Petorca', provincium_id: 15, zona_id: 5)
    Comuna.create(codigo: '05405', nombre: 'Zapallar', provincium_id: 15, zona_id: 5)
  Provincium.create(id:16,codigo: '055', nombre: 'Quillota', region_id: 5)
    Comuna.create(codigo: '05501', nombre: 'Quillota', provincium_id: 16, zona_id: 5)
    Comuna.create(codigo: '05502', nombre: 'Calera', provincium_id: 16, zona_id: 5)
    Comuna.create(codigo: '05503', nombre: 'Hijuelas', provincium_id: 16, zona_id: 5)
    Comuna.create(codigo: '05504', nombre: 'La Cruz', provincium_id: 16, zona_id: 5)
    Comuna.create(codigo: '05506', nombre: 'Nogales', provincium_id: 16, zona_id: 5)
  Provincium.create(id:17, codigo: '056', nombre: 'San Antonio', region_id: 5)
    Comuna.create(codigo: '05601', nombre: 'San Antonio', provincium_id: 17, zona_id: 5)
    Comuna.create(codigo: '05602', nombre: 'Algarrobo', provincium_id: 17, zona_id: 5)
    Comuna.create(codigo: '05603', nombre: 'Cartagena', provincium_id: 17, zona_id: 5)
    Comuna.create(codigo: '05604', nombre: 'El Quisco', provincium_id: 17, zona_id: 5)
    Comuna.create(codigo: '05605', nombre: 'El Tabo', provincium_id: 17, zona_id: 5)
    Comuna.create(codigo: '05506', nombre: 'Santo Domingo', provincium_id: 17, zona_id: 5)
  Provincium.create(id:18, codigo: '057', nombre: 'San Felipe de Aconcagua', region_id: 5)
    Comuna.create(codigo: '05701', nombre: 'San Felipe', provincium_id: 18, zona_id: 5)
    Comuna.create(codigo: '05702', nombre: 'Catemu', provincium_id: 18, zona_id: 5)
    Comuna.create(codigo: '05703', nombre: 'Llaillay', provincium_id: 18, zona_id: 5)
    Comuna.create(codigo: '05704', nombre: 'Panquehue', provincium_id: 18, zona_id: 5)
    Comuna.create(codigo: '05705', nombre: 'Putaendo', provincium_id: 18, zona_id: 5)
    Comuna.create(codigo: '05706', nombre: 'Santa Maria', provincium_id: 18, zona_id: 5)
  Provincium.create(id:19,codigo: '058', nombre: 'Marga Marga', region_id: 5)
    Comuna.create(codigo: '05801', nombre: 'Quilpué', provincium_id: 19, zona_id: 5)
    Comuna.create(codigo: '05802', nombre: 'Limache', provincium_id: 19, zona_id: 5)
    Comuna.create(codigo: '05803', nombre: 'Olmue', provincium_id: 19, zona_id: 5)
    Comuna.create(codigo: '05804', nombre: 'Villa Alemana', provincium_id: 19, zona_id: 5)

p "Creando Región y Provincias de Región del Libertador Gral. Bernardo O`Higgins"
Region.create(id:6, codigo: '06',nombre: 'Región del Libertador Gral. Bernardo O`Higgins')
  Provincium.create(id:20,codigo: '061', nombre: 'Cachapoal', region_id: 6)
    Comuna.create(codigo: '06101', nombre: 'Rancagua', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06102', nombre: 'Codegua', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06103', nombre: 'Coinco', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06104', nombre: 'Coltauco', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06105', nombre: 'Doñihue', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06106', nombre: 'Graneros', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06107', nombre: 'Las Cabras', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06108', nombre: 'Machali', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06109', nombre: 'Malloa', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06110', nombre: 'Mostazal  ', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06111', nombre: 'Olivar', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06112', nombre: 'Peumo', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06113', nombre: 'Pichidegua', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06114', nombre: 'Quinta de Tilcoco', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06115', nombre: 'Rengo', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06116', nombre: 'Requinoa', provincium_id: 20, zona_id: 6)
    Comuna.create(codigo: '06117', nombre: 'San Vicente', provincium_id: 20, zona_id: 6)
  Provincium.create(id:21,codigo: '062', nombre: 'Cardenal Caro', region_id: 6)
    Comuna.create(codigo: '06201', nombre: 'Pichilemu', provincium_id: 21, zona_id: 6)
    Comuna.create(codigo: '06202', nombre: 'La Estrella', provincium_id: 21, zona_id: 6)
    Comuna.create(codigo: '06203', nombre: 'Litueche', provincium_id: 21, zona_id: 6)
    Comuna.create(codigo: '06204', nombre: 'Marchihue', provincium_id: 21, zona_id: 6)
    Comuna.create(codigo: '06205', nombre: 'Navidad', provincium_id: 21, zona_id: 6)
    Comuna.create(codigo: '06206', nombre: 'Paredones', provincium_id: 21, zona_id: 6)
  Provincium.create(id:22,codigo: '063', nombre: 'Colchagua', region_id: 6)
    Comuna.create(codigo: '0630', nombre: 'San Fernando', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Chepica', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Chimbarongo', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Lolol', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Nancahua', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Palmilla', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Peralillo', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Placilla', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Pumanque', provincium_id: 22, zona_id: 6)
    Comuna.create(codigo: '0630', nombre: 'Santa Cruz', provincium_id: 22, zona_id: 6)

p "Creando Región y Provincias y Comunas de Región del Maule"
Region.create(id:7, codigo: '07',nombre: 'Región del Maule')
  Provincium.create(id:23, codigo: '071', nombre: 'Talca', region_id: 7)
    Comuna.create(codigo: '07101', nombre: 'Talca', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07102', nombre: 'Constitucion', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07103', nombre: 'Curepto', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07104', nombre: 'Empedrado', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07105', nombre: 'Maule', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07106', nombre: 'Pelarco', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07107', nombre: 'Pencahue', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07108', nombre: 'Rio Claro', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07109', nombre: 'San Clemente', provincium_id: 23, zona_id: 7)
    Comuna.create(codigo: '07110', nombre: 'San Rafael', provincium_id: 23, zona_id: 7)
  Provincium.create(id:24, codigo: '072', nombre: 'Cauquenes', region_id:7 )
    Comuna.create(codigo: '07201', nombre: 'Cauquenes', provincium_id: 24, zona_id: 7)
    Comuna.create(codigo: '07202', nombre: 'Chanco', provincium_id: 24, zona_id: 7)
    Comuna.create(codigo: '07203', nombre: 'Pelluhue', provincium_id: 24, zona_id: 7)
  Provincium.create(id:25, codigo: '073', nombre: 'Curico', region_id: 7)
    Comuna.create(codigo: '07301', nombre: 'Curico', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07302', nombre: 'Hualañe', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07303', nombre: 'Licanten', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07304', nombre: 'Molina', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07305', nombre: 'Rauco', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07306', nombre: 'Romeral', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07307', nombre: 'Sagrada Familia', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07308', nombre: 'Teno', provincium_id: 25, zona_id: 7)
    Comuna.create(codigo: '07309', nombre: 'Vichuquen', provincium_id: 25, zona_id: 7)
  Provincium.create(id:26, codigo: '074', nombre: 'Linares', region_id: 7)
    Comuna.create(codigo: '07401', nombre: 'Linares', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07402', nombre: 'Colbun', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07403', nombre: 'Longavi', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07404', nombre: 'Parral', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07405', nombre: 'Retiro', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07406', nombre: 'San Javier', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07407', nombre: 'Villa Alegre', provincium_id: 26, zona_id: 7)
    Comuna.create(codigo: '07408', nombre: 'Yerbas Buenas', provincium_id: 26, zona_id: 7)

p "Creando Región y Provincias de Región del Bio Bío"
Region.create(id:8, codigo: '08',nombre: 'Región del Bio Bío')
  Provincium.create(id:27,codigo: '081', nombre: 'Concepción', region_id: 8)
    Comuna.create(codigo: '08101', nombre: 'Concepcion', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08102', nombre: 'Coronel', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08103', nombre: 'Chiguayante', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08104', nombre: 'Florida', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08105', nombre: 'Hualqui', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08106', nombre: 'Lota', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08107', nombre: 'Penco', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08108', nombre: 'San Pedro de la Paz', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08109', nombre: 'Santa Juana', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08110', nombre: 'Talcahuano', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08111', nombre: 'Tome', provincium_id: 27, zona_id: 8)
    Comuna.create(codigo: '08112', nombre: 'Hualpen', provincium_id: 27, zona_id: 8)
  Provincium.create(id:28,codigo: '082', nombre: 'Arauco', region_id: 8)
    Comuna.create(codigo: '08201', nombre: 'Lebu', provincium_id: 28, zona_id: 8)
    Comuna.create(codigo: '08202', nombre: 'Arauco', provincium_id: 28, zona_id: 8)
    Comuna.create(codigo: '08203', nombre: 'Cañete', provincium_id: 28, zona_id: 8)
    Comuna.create(codigo: '08204', nombre: 'Contulmo', provincium_id: 28, zona_id: 8)
    Comuna.create(codigo: '08205', nombre: 'Caranilahue', provincium_id: 28, zona_id: 8)
    Comuna.create(codigo: '08206', nombre: 'Los Alamos', provincium_id: 28, zona_id: 8)
    Comuna.create(codigo: '08207', nombre: 'Tirua', provincium_id: 28, zona_id: 8)
  Provincium.create(id:29,codigo: '083', nombre: 'Bio Bio', region_id: 8)
    Comuna.create(codigo: '08301', nombre: 'Los Angeles', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08302', nombre: 'Antuco', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08303', nombre: 'Cabrero', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08304', nombre: 'Laja', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08305', nombre: 'Mulchen', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08306', nombre: 'Nacimiento', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08307', nombre: 'Negrete', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08308', nombre: 'Quilaco', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08309', nombre: 'Quilleco', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08310', nombre: 'San Rosendo', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08311', nombre: 'Santa Barbara', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08312', nombre: 'Tucapel', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08313', nombre: 'Yumbel', provincium_id: 29, zona_id: 8)
    Comuna.create(codigo: '08314', nombre: 'Alto Biobio', provincium_id: 29, zona_id: 8)
  Provincium.create(id:30, codigo: '084', nombre: 'Ñuble', region_id: 8)
    Comuna.create(codigo: '08401', nombre: 'Chillan', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08402', nombre: 'Bulnes', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08403', nombre: 'Cobquecura', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08404', nombre: 'Coelemu', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08405', nombre: 'Coihueco', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08406', nombre: 'Chillan Viejo', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08407', nombre: 'El Carmen', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08408', nombre: 'Ninhue', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08409', nombre: 'Ñiquen', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08410', nombre: 'Pemuco', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08411', nombre: 'Pinto', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08412', nombre: 'Portezuelo', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08413', nombre: 'Quillon', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08414', nombre: 'Quirinhue', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08415', nombre: 'Ranquil', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08416', nombre: 'San Carlos', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08417', nombre: 'San Fabian', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08418', nombre: 'San Ignacio', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08419', nombre: 'San Nicolas', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08420', nombre: 'Treguaco', provincium_id: 30, zona_id: 8)
    Comuna.create(codigo: '08421', nombre: 'Yungay', provincium_id: 30, zona_id: 8)

p "Creando Región y Provincias de Región de la Araucania"
Region.create(id:9, codigo: '09',nombre: 'Región de la Araucania')
  Provincium.create(id:31,codigo: '091', nombre: 'Cautín', region_id: 9)
  Comuna.create(codigo: '09101', nombre: 'Temuco', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09102', nombre: 'Carahue', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09103', nombre: 'Cunco', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09104', nombre: 'Curarrehue', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09105', nombre: 'Freire', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09106', nombre: 'Galvarino', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09107', nombre: 'Gorbea', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09108', nombre: 'Lautaro', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09109', nombre: 'Loncoche', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09110', nombre: 'Melipeuco', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09111', nombre: 'Nueva Imperial', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09112', nombre: 'Padre las Casas', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09113', nombre: 'Perquenco', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09114', nombre: 'Pitrufquen', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09115', nombre: 'Pucon', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09116', nombre: 'Saavedra', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09117', nombre: 'Teodoro Schmidt', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09118', nombre: 'Tolten', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09119', nombre: 'Vilcun', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09120', nombre: 'Villarica', provincium_id: 31, zona_id: 9)
  Comuna.create(codigo: '09121', nombre: 'Cholchol', provincium_id: 31, zona_id: 9)
Provincium.create(id:32,codigo: '092', nombre: 'Malleco', region_id: 9)
  Comuna.create(codigo: '09201', nombre: 'Angol', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09202', nombre: 'Collipulli', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09203', nombre: 'Curacautin', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09204', nombre: 'Ercilla', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09205', nombre: 'Lonquimay', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09206', nombre: 'Los Sauces', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09207', nombre: 'Lumaco', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09208', nombre: 'Puren', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09209', nombre: 'Renaico', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09210', nombre: 'Traiguen', provincium_id: 32, zona_id: 9)
  Comuna.create(codigo: '09211', nombre: 'Victoria', provincium_id: 32, zona_id: 9)

p "Creando Región y Provincias de Región de los Lagos"
Region.create(id:10, codigo: '10',nombre: 'Región de los Lagos')
  Provincium.create(id:33,codigo: '101', nombre: 'Llanquihue', region_id:10 )
    Comuna.create(codigo: '10101', nombre: 'Puerto Montt', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10102', nombre: 'Calbuco', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10103', nombre: 'Cochamo', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10104', nombre: 'Fresia', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10105', nombre: 'Frutillar', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10106', nombre: 'Los Muermos', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10107', nombre: 'Llanquihue', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10108', nombre: 'Maullin', provincium_id: 33, zona_id: 10)
    Comuna.create(codigo: '10109', nombre: 'Puerto', provincium_id: 33, zona_id: 10)
  Provincium.create(id:34, codigo: '102', nombre: 'Chiloé', region_id: 10)
    Comuna.create(codigo: '10201', nombre: 'Castro', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10202', nombre: 'Ancud', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10203', nombre: 'Chonchi', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10204', nombre: 'Curaco de Velez', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10205', nombre: 'Dalcahue', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10206', nombre: 'Puqueldon', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10207', nombre: 'Queilen', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10208', nombre: 'Quellon', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10209', nombre: 'Quemchi', provincium_id: 34, zona_id: 10)
    Comuna.create(codigo: '10210', nombre: 'Quinchao', provincium_id: 34, zona_id: 10)
  Provincium.create(id:35,codigo: '103', nombre: 'Osorno', region_id: 10)

  Provincium.create(id:36,codigo: '104', nombre: 'Palena', region_id: 10)

p "Creando Región y Provincias de Región Aisén del Gral. Carlos Ibáñez del Campo"
Region.create(id:11,codigo: '11',nombre: 'Región Aisén del Gral. Carlos Ibáñez del Campo')
  Provincium.create(id:37,codigo: '111', nombre: 'Coihaique', region_id: 11)
  Provincium.create(id:38,codigo: '112', nombre: 'Aisén', region_id: 11)
  Provincium.create(id:39,codigo: '113', nombre: 'Capitán Prat', region_id: 11)
  Provincium.create(id:40,codigo: '114', nombre: 'General Carrera', region_id: 11)



p "Creando Región y Provincias de Región de Magallanes y de la Antártica Chilena"
Region.create(id:12,codigo: '12',nombre: 'Región de Magallanes y de la Antártica Chilena')
  Provincium.create(id:41, codigo: '121', nombre: 'Magallanes', region_id: 12)
  Provincium.create(id:42, codigo: '122', nombre: 'Antártica Chilena', region_id: 12)
  Provincium.create(id:43, codigo: '123', nombre: 'Tierra del Fuego', region_id: 12)
  Provincium.create(id:44, codigo: '124', nombre: 'Última Esperanza', region_id: 12)




p "Creando Región y Provincias de Región Metropolitana de Santiago"
Region.create(id:13, codigo: '13',nombre: 'Región Metropolitana de Santiago')
  Provincium.create(id:45, codigo: '131', nombre: 'Santiago', region_id: 13)
  Provincium.create(id:46, codigo: '132', nombre: 'Cordillera', region_id: 13)
  Provincium.create(id:47, codigo: '133', nombre: 'Chacabuco', region_id: 13)
  Provincium.create(id:48, codigo: '134', nombre: 'Maipo', region_id:13)
  Provincium.create(id:49, codigo: '135', nombre: 'Melipilla', region_id:13)
  Provincium.create(id:50, codigo: '136', nombre: 'Talagante', region_id: 13)

Region.create(id:14,codigo: '14',nombre: 'Región de los Rios')
  Provincium.create(id:51, codigo: '141', nombre: 'Valdivia', region_id: 14)
  Provincium.create(id:52, codigo: '142', nombre: 'Ranco', region_id: 14)

Region.create(id:15, codigo: '15',nombre: 'Region de Arica y Parinacota')
  Provincium.create(id:53, codigo: '151', nombre: 'Arica', region_id: 15)
  Provincium.create(id:54, codigo: '152', nombre: 'Parinacota', region_id: 15)


puts "Creando tipos de lecturas"
TipoLectura.create(id: 1,nombre:'Lectura Normal')
TipoLectura.create(id: 2,nombre:'Verificación')

# > Empresas
puts "Creando empresa"
Empresa.create(rut:'11.111.111-1', razon_social: 'Metrogas', giro:'Servicios Gas', direccion:'Avenida 5 Abril N0260')

# > SubEmpresas
puts "Creando Subempresas"
Subempresa.create(rut:'11.111.111-1', razon_social: 'Metrogas', giro:'Servicios Gas', direccion:'Avenida 5 Abril N0260')

# > Vinculacion Empresa SubEmpresas
puts "Vinculando empresa con subempresas"
EmpresaSubempresa.create(subempresa_id:1, empresa_id:1)

# > Creando Estados de lecturas
puts "Creando estados de lectura"
EstadoLectura.create(nombre:'Sin Asignar')
EstadoLectura.create(nombre:'Asignado')
EstadoLectura.create(nombre:'En Capturador')
EstadoLectura.create(nombre:'Leido')
EstadoLectura.create(nombre:'Enviado a ERP')

# > Creando tipos de entrega
puts "Creando tipos de Entrega"
TipoEntrega.create(codigo: 'RMAN', nombre:'Reparto Normal Boleta',  facturacion_en_terreno: false)
TipoEntrega.create(codigo: 'RMAF', nombre:'Reparto Normal Factura',  facturacion_en_terreno: false)
TipoEntrega.create(codigo: 'PNOR', nombre:'Postal Normal',  facturacion_en_terreno: false)
TipoEntrega.create(codigo: 'OCCA', nombre:'OCCA',  facturacion_en_terreno: false)

p "Creando tipos de establecimiento"
TipoEstablecimiento.create(codigo: 'EST-NORMAL', nombre:'Establecimiento Normal',  facturacion_en_terreno: false, excento: false)

p "Creando marcas"
Marca.create(nombre: 'Motorola')
Marca.create(nombre: 'Hawei')
Marca.create(nombre: 'Intermec')
Marca.create(nombre: 'Samsung')

############################
#       Modelo     	       #
############################
puts "Creando modelos"
Modelo.create(nombre: 'Moto Maxx', marca_id: 1)
Modelo.create(nombre: 'Moto G 3', marca_id: 1)
Modelo.create(nombre: 'Moto G 4', marca_id: 1)
Modelo.create(nombre: 'Moto X', marca_id: 1)
Modelo.create(nombre: 'Hawei P9 Lite', marca_id: 2)
Modelo.create(nombre: 'Hawei P8 Lite', marca_id: 2)
Modelo.create(nombre: 'Hawei P8', marca_id: 2)
Modelo.create(nombre: 'Hawei P9', marca_id: 2)
Modelo.create(nombre: 'Hawei P10', marca_id: 2)
Modelo.create(nombre: 'Hawei MATE 9', marca_id: 2)
Modelo.create(nombre: 'Hawei Y6 II', marca_id: 2)
Modelo.create(nombre: 'Intermec CN51', marca_id: 3)
Modelo.create(nombre: 'Intermec CN50', marca_id: 3)
Modelo.create(nombre: 'Intermec CS40', marca_id: 3)
Modelo.create(nombre: 'Intermec CK70', marca_id: 3)
Modelo.create(nombre: 'Samsung J1', marca_id: 4)
Modelo.create(nombre: 'Samsung J2', marca_id: 4)
Modelo.create(nombre: 'Samsung J5', marca_id: 4)
Modelo.create(nombre: 'Samsung J7', marca_id: 4)
Modelo.create(nombre: 'Samsung J7 Prime', marca_id: 4)

p "Modelos Medidor"
Modelo.create(nombre: 'MED_GALLUS_2000GLP', medidor: 1)
Modelo.create(nombre: 'MED_ACTARISG1.6GLP', medidor: 1)
Modelo.create(nombre: 'OTROS_MED_GLP_5', medidor: 1)

p "Creando numeradores"
Numerador.create(codigo: '01', nombre: '')
Numerador.create(codigo: '02', nombre: '')


############################
#       Empresa      	   #
############################
puts "Creando empresa"

Empresa.create(rut:'11111111', razon_social: 'Metrogas', giro:'Servicios', direccion:'Avenida 5 Abril N0260', comuna_id: 44)

############################
#       SubEmpresa    	   #
############################
puts "Creando subempresas"

Subempresa.create(rut:'11.111.111-1', razon_social: 'Mandante', giro:'Servicios Gas', direccion:'Avenida 5 Abril N0260', comuna_id:44)

############################
#   Empresa_SubEmpresa     #
############################
puts "Vinculando empresa con subempresas"
EmpresaSubempresa.create(subempresa_id:1, empresa_id:1)

############################
#       EstadoLectura      #
############################
puts "Creando estados de lectura"

EstadoLectura.create(nombre:'Sin Asignar')
EstadoLectura.create(nombre:'Asignado')
EstadoLectura.create(nombre:'En Capturador')
EstadoLectura.create(nombre:'Leido')
EstadoLectura.create(nombre:'Enviado a ERP')

############################
#       TipoEntrega        #
############################

puts "Creando tipos de Entrega"

TipoEntrega.create(codigo: 'ENTREGA-NORMAL', nombre:'Entrega Normal',  facturacion_en_terreno: false)

############################
#   TipoEstablecimiento    #
############################

puts "Creando tipos de establecimiento"

TipoEstablecimiento.create(codigo: 'EST-NORMAL', nombre:'Establecimiento Normal',  facturacion_en_terreno: false, excento: false)


############################
#Creacion de Clave lecturas#
############################
puts "Creando claves de lectura"
ClaveLectura.create(id:1, nombre: 'Lectura normal', requerido: true, efectivo: true, num_fotografias: 0)
ClaveLectura.create(id:2, nombre: 'Lectura inferior', requerido: true, efectivo: true,num_fotografias: 0)
ClaveLectura.create(id:3, nombre: 'Sin consumo', requerido: true, efectivo: true,num_fotografias: 0)
ClaveLectura.create(id:4, nombre: 'Sin acceso', requerido: true, efectivo: true,num_fotografias: 0)
ClaveLectura.create(id:5, nombre: 'Sin dirección', requerido: false, efectivo: false,num_fotografias: 0)
ClaveLectura.create(id:6, nombre: 'No leído', requerido: false, efectivo: false,num_fotografias: 0)
ClaveLectura.create(id:7, nombre: 'Cerrado por sistema', requerido: false, efectivo: false,num_fotografias: 0)
############################
# 		Observaciones	   #
############################
puts "Creando observaciones de lectura"
Observacione.create(codigo_ptc: '100', codigo: 'CE',descripcion: 'Con espejo', clave_lectura_id:1)
Observacione.create(codigo_ptc: '101', codigo: 'LN',descripcion: 'Lectura normal', clave_lectura_id:1)
Observacione.create(codigo_ptc: '102', codigo: 'RI',descripcion: 'Recuperada inspector(empresa constratista)', clave_lectura_id:1)
Observacione.create(codigo_ptc: '103', codigo: 'XC',descripcion: 'Lectura entregada por cliente', clave_lectura_id:1)
Observacione.create(codigo_ptc: '104', codigo: 'XF',descripcion: 'Por fuera ', clave_lectura_id:1)
Observacione.create(codigo_ptc: '105', codigo: 'VR',descripcion: 'Vidrio roto', clave_lectura_id:1)
Observacione.create(codigo_ptc: '106', codigo: 'EG',descripcion: 'Escape de gas', clave_lectura_id:1)
Observacione.create(codigo_ptc: '123', codigo: 'EX',descripcion: 'Examen de medidor', clave_lectura_id:1)
Observacione.create(codigo_ptc: '121', codigo: 'BI',descripcion: 'Confirmada(ingresada en terreno)', clave_lectura_id:1)
Observacione.create(codigo_ptc: '122', codigo: 'CF',descripcion: 'Ractificada(ingresada inspección empresa)', clave_lectura_id:1)

Observacione.create(codigo_ptc: '130',codigo: 'CM',descripcion: 'Cambio de medidor', clave_lectura_id:2)
Observacione.create(codigo_ptc: '131',codigo: 'EI',descripcion: 'Estado inferior (confirmada)', clave_lectura_id:2)
Observacione.create(codigo_ptc: '132',codigo: 'RI',descripcion: 'Ractificada (ingresada inspeccion empresa)', clave_lectura_id:2)
Observacione.create(codigo_ptc: '133',codigo: 'VM',descripcion: 'Vuelta medidor', clave_lectura_id:2)
Observacione.create(codigo_ptc: '103',codigo: 'XC',descripcion: 'Lectura entregada por cliente', clave_lectura_id:2)
Observacione.create(codigo_ptc: '123',codigo: 'EX',descripcion: 'Examen medidor', clave_lectura_id:2)

Observacione.create(codigo_ptc: '140',codigo: 'DH',descripcion: 'Deshabitada', clave_lectura_id:3)
Observacione.create(codigo_ptc: '141',codigo: 'GC',descripcion: 'Cortado', clave_lectura_id:3)
Observacione.create(codigo_ptc: '142',codigo: 'CS',descripcion: 'Consumo competencia', clave_lectura_id:3)
Observacione.create(codigo_ptc: '123',codigo: 'EX',descripcion: 'Examen medidor', clave_lectura_id:3)
Observacione.create(codigo_ptc: '103',codigo: 'XC',descripcion: 'Lectura entregada por cliente', clave_lectura_id:3)
Observacione.create(codigo_ptc: '144',codigo: 'SC',descripcion: 'Sin consumo', clave_lectura_id:3)
Observacione.create(codigo_ptc: '145',codigo: 'DE',descripcion: 'Desconectado', clave_lectura_id:3)

Observacione.create(codigo_ptc: '200',codigo: 'NP',descripcion: 'No permite', clave_lectura_id:4)
Observacione.create(codigo_ptc: '201',codigo: 'CC',descripcion: 'Casa cerrada', clave_lectura_id:4)
Observacione.create(codigo_ptc: '202',codigo: 'DM',descripcion: 'Propiedad en demolición', clave_lectura_id:4)

Observacione.create(codigo_ptc: '203',codigo: 'NC',descripcion: 'No ubica calle', clave_lectura_id:5)
Observacione.create(codigo_ptc: '204',codigo: 'NN',descripcion: 'No ubica número', clave_lectura_id:5)


Observacione.create(codigo_ptc: '205',codigo: 'SM',descripcion: 'Sin medidor', clave_lectura_id:6)
Observacione.create(codigo_ptc: '206',codigo: 'SR',descripcion: 'Solo raiser', clave_lectura_id:6)
Observacione.create(codigo_ptc: '208',codigo: 'MU',descripcion: 'Medidor mal ubicado', clave_lectura_id:6)
Observacione.create(codigo_ptc: '209',codigo: 'ES',descripcion: 'Esfera sucia', clave_lectura_id:6)
Observacione.create(codigo_ptc: '210',codigo: 'EM',descripcion: 'Escombros, materiales, objetos', clave_lectura_id:6)
Observacione.create(codigo_ptc: '123',codigo: 'EX',descripcion: 'Examen medidor', clave_lectura_id:6)
Observacione.create(codigo_ptc: '212',codigo: 'NV',descripcion: 'No visitado', clave_lectura_id:6)

Observacione.create(codigo_ptc: '213',codigo: 'CP',descripcion: 'Cerrado por sistema', clave_lectura_id:7)

p "Creando contratistas"
Contratistum.create(id:1, nombre:'Provider')

p "Creando perfiles de usuario"
Perfil.create(id: 1, nombre: 'fbAdmin')
Perfil.create(id: 2, nombre: 'Administrador de Contratos')
Perfil.create(id: 3, nombre: 'Coordinador de Contratos')
Perfil.create(id: 4, nombre: 'Analista de Lecturas')
Perfil.create(id: 5, nombre: 'Atencion al Cliente')
Perfil.create(id: 6, nombre: 'Agente de Terreno')
Perfil.create(id: 7, nombre: 'Inspector Terreno')

p "Creando usuarios Admin del Sistema"
Usuario.create(id: 1, email: 'fbAdmin', password: 'fbAdmin000', perfil_id: 1)
Usuario.create(id: 2, email: 'administrador', password: 'administrador#000', perfil_id: 1)
p "Creando empleados Admin del Sistema"
Empleado.create(id: 1, nombre:'Fabián Andrés', apellido_paterno:'Hidalgo', apellido_materno: 'Neira', rut:'18.681.243-3', contratistum_id: 1,subempresa_id:1, usuario_id:1)
Empleado.create(id: 2, nombre:'José Fernando', apellido_paterno:'Corail', apellido_materno: 'Moreno', rut:'11.620.739-7', contratistum_id: 1,subempresa_id:1, usuario_id:2)

puts "Creo lector Plan Piloto"
Usuario.create(id: 3,  email: 'jpratricio', password:'123456', perfil_id: 6)
Empleado.create(id: 3, nombre:'Julio Patricio', apellido_paterno:'Segura', apellido_materno: 'Pradine', rut:'11.593.403-1', contratistum_id: 1,subempresa_id:1, usuario_id:3)
Equipo.create(nombre: "j5", mac:'70:28:8B:2C:9B:6E', modelo_id: 18, empleado_id:3)

puts "Vinculando empleados con zonas"
EmpleadosZonas.create(empleado_id:1, zona_id:1) #AdminDeploy
EmpleadosZonas.create(empleado_id:1, zona_id:2)
EmpleadosZonas.create(empleado_id:1, zona_id:3)
EmpleadosZonas.create(empleado_id:1, zona_id:4)
EmpleadosZonas.create(empleado_id:1, zona_id:5)
EmpleadosZonas.create(empleado_id:1, zona_id:6)
EmpleadosZonas.create(empleado_id:1, zona_id:7)
EmpleadosZonas.create(empleado_id:1, zona_id:8)
EmpleadosZonas.create(empleado_id:1, zona_id:9)
EmpleadosZonas.create(empleado_id:1, zona_id:10)
EmpleadosZonas.create(empleado_id:1, zona_id:11)
EmpleadosZonas.create(empleado_id:1, zona_id:12)
EmpleadosZonas.create(empleado_id:1, zona_id:13)
EmpleadosZonas.create(empleado_id:1, zona_id:14)
EmpleadosZonas.create(empleado_id:1, zona_id:15)

EmpleadosZonas.create(empleado_id:2, zona_id:1) #SysAdmin
EmpleadosZonas.create(empleado_id:2, zona_id:2)
EmpleadosZonas.create(empleado_id:2, zona_id:3)
EmpleadosZonas.create(empleado_id:2, zona_id:4)
EmpleadosZonas.create(empleado_id:2, zona_id:5)
EmpleadosZonas.create(empleado_id:2, zona_id:6)
EmpleadosZonas.create(empleado_id:2, zona_id:7)
EmpleadosZonas.create(empleado_id:2, zona_id:8)
EmpleadosZonas.create(empleado_id:2, zona_id:9)
EmpleadosZonas.create(empleado_id:2, zona_id:10)
EmpleadosZonas.create(empleado_id:2, zona_id:11)
EmpleadosZonas.create(empleado_id:2, zona_id:12)
EmpleadosZonas.create(empleado_id:2, zona_id:13)
EmpleadosZonas.create(empleado_id:2, zona_id:14)
EmpleadosZonas.create(empleado_id:2, zona_id:15)

p "Creando tipos de documentos"
TipoDocumento.create(id:1, codigo_sii:"33", nombre:"Factura Electronica")
TipoDocumento.create(id:2, codigo_sii:"34", nombre:"Factura No Afecta o Exenta Electronica")
TipoDocumento.create(id:3, codigo_sii:"39", nombre:"Boleta Electronica")
TipoDocumento.create(id:4, codigo_sii:"41", nombre:"Boleta Exenta Electronica")
TipoDocumento.create(id:5, codigo_sii:"56", nombre:"Nota de Débito Electrónica")
TipoDocumento.create(id:6, codigo_sii:"61", nombre:"Nota de Crédito Electrónica")


puts "Creando Contratista Subempresa"
ContratistaSubempresa.create(contratistum_id: 1, subempresa_id: 1)

p "Creando Contratista Zona"
ContratistaZona.create(contratista_id: 1, zona_id: 1)

p "Creando SubempresaZona"
SubempresasZonas.create(zona_id:1, subempresa_id: 1)
SubempresasZonas.create(zona_id:2, subempresa_id: 1)
SubempresasZonas.create(zona_id:3, subempresa_id: 1)
SubempresasZonas.create(zona_id:4, subempresa_id: 1)
SubempresasZonas.create(zona_id:5, subempresa_id: 1)
SubempresasZonas.create(zona_id:6, subempresa_id: 1)
SubempresasZonas.create(zona_id:7, subempresa_id: 1)
SubempresasZonas.create(zona_id:8, subempresa_id: 1)
SubempresasZonas.create(zona_id:9, subempresa_id: 1)
SubempresasZonas.create(zona_id:10, subempresa_id: 1)
SubempresasZonas.create(zona_id:11, subempresa_id: 1)
SubempresasZonas.create(zona_id:12, subempresa_id: 1)
SubempresasZonas.create(zona_id:13, subempresa_id: 1)
SubempresasZonas.create(zona_id:14, subempresa_id: 1)
SubempresasZonas.create(zona_id:15, subempresa_id: 1)

p "Creando FactorCobros"
FactorCobro.create(nombre: "RE-VALLEN", subempresa_id:1, cargo_fijo: 0, cargo_unico:0) #Tarifa de Santiago
FactorCobro.create(nombre: "RE-CALDER", subempresa_id:1, cargo_fijo: 0, cargo_unico:0) #Tarifa de Rancagua

p "Creando tipo tramos"
TipoTramo.create(nombre:"Consumo")
TipoTramo.create(nombre:"Exceso")

p "Creando tramos"
p "Creando tramos santiago"
Tramo.create(nombre:"Tramo 1", factor_cobro_id: 1, tipo_tramo_id: 1, desde: 0, hasta: 5, precio:1203)
Tramo.create(nombre:"Tramo 2", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 5, hasta: 10, precio:951)
Tramo.create(nombre:"Tramo 3", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 10, hasta: 25, precio:950)
Tramo.create(nombre:"Tramo 4", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 25, hasta: 40, precio:644)
Tramo.create(nombre:"Tramo 5", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 40, hasta: 60, precio:306)
Tramo.create(nombre:"Tramo 6", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 60, hasta: 130, precio:660)
Tramo.create(nombre:"Tramo 7", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 130, hasta: 170, precio:661)
Tramo.create(nombre:"Tramo 8", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 170, hasta: 700, precio:660)
Tramo.create(nombre:"Tramo 9", factor_cobro_id: 1, tipo_tramo_id: 2, desde: 700, hasta: 900, precio:550)
Tramo.create(nombre:"Tramo 10",factor_cobro_id: 1, tipo_tramo_id: 2, desde: 900, hasta: 0, precio:637)
p "Creando tramos rancagua"
Tramo.create(nombre:"Tramo 1", factor_cobro_id: 2, tipo_tramo_id: 1, desde: 0, hasta: 5, precio:1337)
Tramo.create(nombre:"Tramo 2", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 5, hasta: 10, precio:1056)
Tramo.create(nombre:"Tramo 3", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 10, hasta: 25, precio:1056)
Tramo.create(nombre:"Tramo 4", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 25, hasta: 40, precio:894)
Tramo.create(nombre:"Tramo 5", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 40, hasta: 60, precio:315)
Tramo.create(nombre:"Tramo 6", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 60, hasta: 130, precio:768)
Tramo.create(nombre:"Tramo 7", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 130, hasta: 170, precio:768)
Tramo.create(nombre:"Tramo 8", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 170, hasta: 700, precio:768)
Tramo.create(nombre:"Tramo 9", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 700, hasta: 900, precio:345)
Tramo.create(nombre:"Tramo 10", factor_cobro_id: 2, tipo_tramo_id: 2, desde: 900, hasta: 0, precio:676)

p "Creando Observaciones de Reparto"
ObservacionReparto.create(codigo:"00", observacion:"Repartido", efectivo: true)
ObservacionReparto.create(codigo:"45", observacion:"Reparto Manual", efectivo: true)
ObservacionReparto.create(codigo:"01", observacion:"Sitio Eriaso", efectivo: false)
ObservacionReparto.create(codigo:"10", observacion:"Servicio Duplicado", efectivo: false)
ObservacionReparto.create(codigo:"11", observacion:"Cliente No Recibe", efectivo: false)
ObservacionReparto.create(codigo:"02", observacion:"Servicio No Ubicado", efectivo: false)
ObservacionReparto.create(codigo:"27", observacion:"No Hay Numero", efectivo: false)
ObservacionReparto.create(codigo:"28", observacion:"Se Cambio", efectivo: false)
ObservacionReparto.create(codigo:"03", observacion:"Servicio Eliminado", efectivo: false)
ObservacionReparto.create(codigo:"31", observacion:"No Hay Quien Reciba", efectivo: false)
ObservacionReparto.create(codigo:"32", observacion:"Desconocido", efectivo: false)
ObservacionReparto.create(codigo:"04", observacion:"Casa Deshabitado", efectivo: false)
ObservacionReparto.create(codigo:"44", observacion:"No Llego Documento", efectivo: false)
ObservacionReparto.create(codigo:"05", observacion:"Dirección de Despacho no Existe", efectivo: false)
ObservacionReparto.create(codigo:"06", observacion:"Propiedad Demolida o Incendiada", efectivo: false)
ObservacionReparto.create(codigo:"07", observacion:"Servicio Fuera de Ruta", efectivo: false)
ObservacionReparto.create(codigo:"08", observacion:"Tipo de Documento no Corresponde", efectivo: false)
ObservacionReparto.create(codigo:"09", observacion:"Impedimento(Lugar Inseguro)", efectivo: false)

p "Tipo de reparto"
TipoReparto.create(descripcion: "Masivo")
TipoReparto.create(descripcion: "Rezago")
TipoReparto.create(descripcion: "Divergente")

p "Estado Reparto"
EstadoReparto.create(estado: "Sin Asignar")
EstadoReparto.create(estado: "Asignado")
EstadoReparto.create(estado: "En Capturador")
EstadoReparto.create(estado: "Entregado")
EstadoReparto.create(estado: "Devolución")

p "Tipo Clientes"
TipoCliente.create(nombre: "Normal")

p "Tipo Tarifa"
TipoTarifa.create(nombre: "Tarifa Normal", facturacion_en_terreno: false)

p "Tipo_aparatos"
TipoAparato.create(codigo: "0", nombre: "Medidor")
TipoAparato.create(codigo: "1", nombre: "Estanque")
