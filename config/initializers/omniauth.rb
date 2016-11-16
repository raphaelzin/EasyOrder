OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1255945677813946", "4a04705450e9e5f215260b25c46936de"
  
end