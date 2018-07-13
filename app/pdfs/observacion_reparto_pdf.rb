class ObservacionRepartoPdf < Prawn::Document
  include Prawn::View

  def initialize(listaObservacionesReparto)
    super(top_margin: 30)
    @observacionesReparto = listaObservacionesReparto
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
      row(0..1).background_color = '324c5b'
      row(0..1).text_color = "FFFFFF"
      row(0..1).font_style = :bold
      columns(0..5).align = :center
      columns(2).font_style = :bold
      row(0).size = 9
      row(1..cant_claves).size = 8
      self.header = true
      self.header = 2
      self.cells.border_width = 0.3
      self.cells.borders = [:top, :bottom, :left, :right]
      self.column_widths = [400,60,60]
    end
  end
  

  def footer
    move_down 40
    styled_text '<p style="text-align:right">' + "Fecha descarga: " + Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s + "</p>" 
  end

  def lista_claves
    efectivo = ""
    requerido = ""
  	[[{:content => "Observaciones de Repartos", :colspan => 3}]] +
    [['Descripción', 'Código', 'Reparto Efectivo']] +
    @observacionesReparto.map do |obs|
      if obs.efectivo 
        efectivo= "Si"
      end
      if !obs.efectivo 
        efectivo= "No"
      end
      [obs.observacion,obs.codigo,efectivo]

    end
  end  
end  