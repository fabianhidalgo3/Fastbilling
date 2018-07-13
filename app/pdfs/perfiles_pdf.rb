class PerfilesPdf < Prawn::Document
  include Prawn::View

  def initialize(listaPerfiles)
    super(top_margin: 30)
    @perfiles = listaPerfiles
    header
    body
    footer 
  end

  def header
    image "#{Rails.root}/public/images/logo_metrogas.png",:position => :right,  :width => 60, :heigth => 30
  end
  

  def body
    move_down 20
    cant_perfiles = lista_perfiles.count
    table lista_perfiles do
      row(0).size = 11
      row(0..1).background_color = '324c5b'
      row(0..1).text_color = 'ffffff'
      row(0..1).font_style = :bold
      columns(0..2).align = :center
      columns(0..2).font_style = :bold
      row(1..cant_perfiles).size = 8
      self.header = true
      self.cells.border_width = 0.3
      self.cells.borders = [:top, :bottom, :left, :right]
      self.column_widths = [50,390,100]
    end
    move_down 7
    table total_usuarios do
      row(0).background_color = '324c5b'
      row(0..1).text_color = 'ffffff'
      row(0..1).font_style = :bold
      columns(0..1).align = :center
      columns(2).align = :center
      columns(1).align = :right
      row(0).size = 9
      self.header = true
      self.cells.border_width = 0.3
      self.cells.borders = [:top, :bottom, :left, :right]
      self.column_widths = [50,390,100]
    end
  end
  

  def footer
    move_down 40
    styled_text '<p style="text-align:right">' + "Fecha descarga: " + Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s + "</p>" 
  end

  def lista_perfiles

    [[{:content => "Perfiles de Usuarios", :colspan => 3}]]+
    [['ID', 'Nombre', 'Cantidad de Usuarios']] +
    @perfiles.map do |perfil|
      [perfil[0], perfil[1], perfil[2]]
    end
  end

  def total_usuarios
    totalUsuarios = 0
    @perfiles.map do |perfil|
      totalUsuarios += perfil[2]
    end
    [[" - ","Total de usuarios:",totalUsuarios]]
  end

  # def fuentes
  #   font_families.update("Roboto" => {
  #     :normal => "#{Rails.root}/public/assets/fonts/Roboto-Regular.ttf",
  #     :italic => "#{Rails.root}/public/assets/fonts/Roboto-Italic.ttf",
  #     :bold => "#{Rails.root}/public/assets/fonts/Roboto-Bold.ttf",
  #   })
  #   font "Roboto"
  # end
  
end  