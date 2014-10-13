json.extract! @item, :title, :description, :status, :link
json.(@item.artist, :email)
json.current_user current_user.email
json.images @item.images do |image|
  json.image image.picture.url(:medium)
end
@item.projections.each do |p|
 json.has_projected true if  p.user == current_user
end
json.projections @item.projections do |p|
  json.projection p, :price, :mail
  json.user p.user.email
  json.current_user current_user.email
end
