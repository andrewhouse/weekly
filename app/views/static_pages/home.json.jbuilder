json.updated_items @home[:updated] do |up|
  json.(up, :title, :image, :id)
end
json.popular_items @home[:popular] do |up|
  json.(up, :title, :image, :id)
end
json.new_items @home[:new] do |up|
  json.(up, :title, :image, :id)
end
