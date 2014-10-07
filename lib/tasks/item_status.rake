namespace :items do
  desc "Item Status Update for Heroku Scheduler"
  task status: :environment do 
    items = Item.old.where("status != ?", "closed")
    items.find_each do |item|
      item.status_update
    end
  end
end
