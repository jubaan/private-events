json.extract! appointment, :id, :join, :leave, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
