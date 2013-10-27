# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Craiglistnew::Application.config.secret_key_base = 'f4bc142dfc6eaabe00ac5e258c051e3e979121cc054d4fd4d27bdc8641634ce5abc8654dd0b980d869cbfbc7534de3f2ef60084a1dddb587c3f47ad7266d2c1b'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end



Craiglistnew::Application.config.secret_key_base = secure_token