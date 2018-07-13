class UsuariosAgenteTerrenoPdf < Prawn::Document
  include Prawn::View

  def initialize(listaUsuariosAgenteTerreno)
    @listaAgentesTerreno = listaUsuariosAgenteTerreno
    super(top_margin: 30)
    header
    body
    footer
  end

  def header
    image "#{Rails.root}/public/images/logo_metrogas.png",:position => :right,  :width => 60, :heigth => 30
  end

  def body
    move_down 20
    cant_usuarios = lista_usuarios_administrativos.count
    table lista_usuarios_administrativos do
      row(0..1).background_color = '324D5C'
      row(0..1).text_color = 'ffffff'
      row(0..1).size = 11
      columns(0..5).align = :center
      columns(0..1).font_style = :bold
      row(1..cant_usuarios).size = 8
      self.header = true
      self.cells.border_width = 0.3
      self.cells.borders = [:top, :bottom, :left, :right]
      self.column_widths = [130,80,80,80,80,80]
    end
    move_down 7
  end

  def lista_usuarios_administrativos
    [[{:content => "Usuarios Agentes de Terreno", :colspan => 6}]] +
    [['Nombre', 'Empresa', 'Perfil', 'Rut','Nombre Usuario', 'Equipo']] +
    @listaAgentesTerreno.map do |usuario|
      [usuario[0],usuario[1],usuario[2],usuario[3],usuario[4],usuario[5].upcase]
    end
  end

  def footer
    move_down 40
    styled_text '<p style="text-align:right">' + "Fecha descarga: " + Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s + "</p>" 
  end
  

end