json.array!(@horaries) do |horary|
  json.extract! horary, :id, :begin
  json.url horary_url(horary, format: :json)
end
