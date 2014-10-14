json.extract! @item, :title, :description, :status, :link, :average, :entire_average, :is_old
json.(@item.artist, :email)
if current_user
  json.current_user current_user.email 
else
  json.current_user 'blank'
end
json.images @item.images do |image|
  json.image image.picture.url(:medium)
end
@item.projections.each do |p|
 json.has_projected true if  p.user == current_user
end
json.projections @item.projections do |p|
  json.projection p, :price, :mail
  json.user p.user.email
  if current_user
    json.current_user current_user.email 
  else
    json.current_user 'blank'
  end
end
