###
# Compass
###

# Susy grids in Compass
# First: gem install susy
require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :livereload

# Compass configuration
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # different image path
  # set :http_path, "/Content/images/"
end


# AHTUNG !!!
# 
password = ENV["PASSWORD"]
sftp_login = ENV["LOGIN_SFTP"]
# PASSWORD=sdfas LOGIN_SFTP=hsdf middleman deploy

hostUri = "leino.ru"
# $ rake deploy:staging
# $ rake deploy:production

case ENV['TARGET'].to_s.downcase
when 'production'
  activate :deploy do |deploy|
    deploy.method   = :sftp
    deploy.user     = sftp_login
    deploy.password = password
    deploy.host     = hostUri
    deploy.path     = '/home/home/data/www/layoutmaking'
    deploy.build_before = true # default: false
  end
else
  activate :deploy do |deploy|
    deploy.method   = :sftp
    deploy.user     = sftp_login
    deploy.password = password
    deploy.host     = hostUri
    deploy.path     = '/home/home/data/www/layoutmaking'
    deploy.build_before = true # default: false
  end
end