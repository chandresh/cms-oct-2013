# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = '5a71f6fc874acf494d393b752023bae9a7bdbaa2dc2bd0b7c334b4cf5ef4a8dc459c2154829d46d42110ee318e869ca1d85a430ad59f703a0bd3da8b775b46d8'
