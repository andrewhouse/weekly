json.array! @items do |item|
  json.(item, :id, :title, :description, :status, :link)
  json.(item.artist, :email)
  json.images item.images do |image|
    json.(image.picture, :url)
  end
  json.projections item.projections do |p|
    json.projection p, :price, :mail, :user
  end
end
