json.array!(@boletus) do |boletu|
  json.extract! boletu, :id, :movie_id, :ticket_id, :pricePoints, :priceDinner, :pointsNumber, :boletusType
  json.url boletu_url(boletu, format: :json)
end
