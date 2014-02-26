# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mapmyfitness, ENV['MMF_API_KEY'], ENV['MMF_API_SECRET']
  provider :strava, ENV['STRAVA_KEY'], ENV['STRAVA_SECRET']
end
