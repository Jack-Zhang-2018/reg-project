json.extract! user, :id, :full_name, :street_address, :city, :state, :postal_code, :country, :email_address, :username, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
