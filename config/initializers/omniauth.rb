#opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

#http://localhost:3000/auth/github/callback