json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :user_id, :priceDinner, :pricePoints, :totalPoints
  json.url ticket_url(ticket, format: :json)
end
