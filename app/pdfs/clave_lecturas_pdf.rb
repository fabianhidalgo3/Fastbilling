class ClaveLecturasPdf < Prawn::Document
  include Prawn::View

  def initialize(listaClaves)
    super(top_margin: 30)
    @claveLecturas = listaClaves
    header
    body
    footer 
  end

  def header
    image "#{Rails.root}/public/images/logo_metrogas.png",:position => :right,  :width => 60, :heigth => 30
  end
  

  def body
    move_down 20
    cant_claves = lista_claves.count
    table lista_claves do
      row(0..2).background_color = '324c5b'
      row(0..2).text_color = "FFFFFF"
      row(0..2).font_style = :bold
      columns(0..5).align = :center
      columns(3).font_style = :bold
      row(0).size = 11
      row(1..cant_claves).size = 8
      self.header = true
      self.header = 3
      self.cells.border_width = 0.3
      self.cells.borders = [:top, :bottom, :left, :right]
      self.column_widths = [100,100,100,100]
    end
  end
  

  def footer
    move_down 40
    styled_text '<p style="text-align:right">' + "Fecha descarga: " + Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s + "</p>" 
  end

  def lista_claves
    efectivo = ""
    requerido = ""
    [[{:content => "Claves y Observaciones de Lectura", :colspan => 6}]] +
  	[[{:content => "Clave lectura", :rowspan => 2}, {:content => "Observaciones de Lectura", :colspan => 3},{:content =>"Lectura Requerida", :rowspan => 2},{:content =>"Lectura Efectiva", :rowspan => 2}]] +
    [['Código PTC', 'Código', 'Descripción']] +
    @claveLecturas.map do |clave|
      if clave.clave_lectura.requerido 
        requerido= "Si"
      end
      if !clave.clave_lectura.requerido 
        requerido= "No"
      end
      if clave.clave_lectura.efectivo
        efectivo = "Si"
      end
      if !clave.clave_lectura.efectivo 
        efectivo = "No"
      end
      [clave.clave_lectura.nombre,clave.codigo_ptc, clave.codigo, clave.descripcion, efectivo, requerido]
    end
  end  
end  