class Authentication
  def self.client
    OAuth2::Client.new(ENV['CLIENT_ID'],
                       ENV['CLIENT_SECRET'],
                       site:          'https://auth.sch.bme.hu',
                       authorize_url: '/site/login?scope=displayName+sn+mail+givenName',
                       token_url:     'oauth2/token')
  end
end
