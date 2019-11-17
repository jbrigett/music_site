require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "74a547498606d6d3b72c4d9b3449931fa2d6dd123b773266cc36024f937b9f1e"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
