json.array!(@halls) do |hall|
  json.extract! hall, :id, :seat_id
  json.url hall_url(hall, format: :json)
end
