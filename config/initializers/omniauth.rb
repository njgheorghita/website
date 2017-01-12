require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "3b51b800c6d24d2caed9ed714f8d8332", "13c67efc384b454fb6224f7cabebd40b", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end