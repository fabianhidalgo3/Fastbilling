FROM ruby:2.4.2-alpine

# Se setea zona horaria
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/America/Santiago /etc/localtime && \
    echo "America/Santiago" > /etc/timezone

# Instalacion de paquetes necesarios
RUN apk add --update --virtual runtime-deps postgresql-client nodejs libffi-dev readline imagemagick git file
RUN apk add --update --virtual build-deps build-base openssl-dev postgresql-dev libc-dev \
  linux-headers libxml2-dev libxslt-dev readline-dev make ruby-json
RUN apk add --update mariadb-dev

# Hacer que bundler apunte a /gems. Esto hace que bundler reutilize gemas que se encuentran instaladas en gems
ENV BUNDLE_PATH /gems
ENV BUNDLE_HOME /gems

# Numero de hilos que utiliza bundler para instalar
ENV BUNDLE_JOBS 4

# Cantidad de veces que bundler re intenta descargar una gema
ENV BUNDLE_RETRY 3

# Ruta para rubygems
ENV GEM_HOME /gems
ENV GEM_PATH /gems

# Campo necesario, para development da igual lo que diga
ENV SECRET_KEY_BASE development123

# Se agrega /gems/bin al path asi que cualquier gema binaria es ejecutable desde bash.
ENV PATH /gems/bin:$PATH

# Directorio donde se montara el codigo base de la aplicacion
RUN mkdir -p /app
WORKDIR /app

# Se copia el Gemfile y Gemfile.lock y se instalan las gemas
# Este paso se ejecuta por separado asi que las dependencias
# seran cacheadas a menos que hayan cambios en uno de los
# dos archivos.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

# Se copia la aplicacion
COPY . ./

# Se expone el puerto 3000 al host de Docker, asi podemos acceder a la aplicacion desde fuera
EXPOSE 3000