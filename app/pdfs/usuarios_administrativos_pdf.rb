class UsuariosAdministrativosPdf < Prawn::Document
  include Prawn::View

  def initialize(listaUsuariosadministrativo)
    @listaAdministrativos = listaUsuariosadministrativo
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
    p cant_usuarios
    table lista_usuarios_administrativos do
      row(0..1).background_color = '324D5C'
      row(0..1).text_color = 'ffffff'
      row(0..1).size = 11
      row(0..1).font_style = :bold
      columns(0..5).align = :center
      columns(2..4).font_style = :bold
      row(0).size = 9
      row(1..cant_usuarios).size = 8
      self.header = true
      self.cells.border_width = 0.3
      self.cells.borders = [:top, :bottom, :left, :right]
      self.column_widths = [130,100,100,100,100]
    end
    move_down 7
  end

  def lista_usuarios_administrativos
    [[{:content => "Usuarios Administrativos", :colspan => 5}]] +
    [['Nombre', 'Empresa', 'Perfil', 'Rut','Nombre Usuario']] +
    @listaAdministrativos.map do |usuario|
      [usuario[0],usuario[1],usuario[2],usuario[3],usuario[4]]
    end
  end

  def footer
    move_down 40
    styled_text '<p style="text-align:right">' + "Fecha descarga: " + Time.now.strftime("%d/%m/%Y %H:%M:%S").to_s + "</p>" 
  end
 

end