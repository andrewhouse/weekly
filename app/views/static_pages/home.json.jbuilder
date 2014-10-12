# I have no idea why this isn't working.
#json.image @home[:up] do |i|
#  json.img i.picture.url(:medium)
#end

json.updated_items @home[:updated] do |up|
  json.(up, :title, :description)
  json.images up.images do |image|
    json.image image.picture.url(:medium)
  end
  json.(up.artist, :email)
  json.projections up.projections do |p|
    json.projections p, :price, :mail
  end
end
json.popular_items @home[:popular] do |up|
  json.(up, :title, :description)
  json.images up.images do |image|
    json.image image.picture.url(:medium)
  end
  json.(up.artist, :email)
  json.projections up.projections do |p|
    json.projections p, :price, :mail
  end
end
json.new_items @home[:new] do |up|
  json.(up, :title, :description)
  json.images up.images do |image|
    json.image image.picture.url(:medium)
  end
  json.(up.artist, :email)
  json.projections up.projections do |p|
    json.projections p, :price, :mail
  end
end
