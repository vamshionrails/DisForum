# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
Rails.application.config.session_store :cookie_store, {
  :key    => '_iforum_session',
  :secret => '1b6b741b92433d5fbf2aedd18d80bbec494314186f8bba6bf4990468ddb7fbb8830814c0c5c44be06a6b3919fbc5c090b24fee152a228e8f379c5dc7bb6ba939'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
