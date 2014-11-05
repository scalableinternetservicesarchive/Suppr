json.array!(@dinners) do |dinner|
  json.extract! dinner, :id, :date, :location, :title, :description, :category, :price, :seats, :seats_available, :stamp
  json.url dinner_url(dinner, format: :json)
end
