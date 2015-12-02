json.array!(@seats) do |seat|
  json.extract! seat, :id, :addres, :name
  json.url seat_url(seat, format: :json)
end
