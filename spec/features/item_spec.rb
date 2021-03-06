require 'rails_helper'

feature Item do
  it 'allows artists to post items for sale' do
    artist = create :user, :artist
    login artist
    visit new_item_path

    fill_in "Title", with: "Bananas"
    fill_in "Description", with: "Delicious"
    fill_in "Above", with: "14"
    fill_in "Below", with: "1.15"
    fill_in "Link", with: "iamandrewhouse.com"
    click_button 'Create Item'

    expect(page).to have_content "Item was Successfully Created"
    expect(page).to have_content "Bananas"
    expect(page).to have_content "Delicious"
    expect(Item.count).to eq 1
  end
  it 'allows artists to edit an item' do
    artist = create :user, :artist
    login artist
    item = create :item, artist: artist

    visit edit_item_path item
    fill_in "Title", with: "new title"
    
    click_button 'Update Item'

    expect(page).to have_content "Item was Successfully Updated"
    expect(page).to have_content "new title"
  end
  
  it 'allows projected prices' do
    artist = create :user, :artist
    login artist
    item = create :item

    visit item_path item
    fill_in "Price", with: "2.99"

    click_button "Create Projection"

    expect(page).to have_content "2.99"
    expect(Projection.count).to eq 1
  end

  it "does not allow a user to project twice on the same item" do
    artist = create :user, :artist
    login artist
    item = create :item

    visit item_path item
    fill_in "Price", with: "2"
    click_button "Create Projection"

    expect(page).not_to have_content "Create Projection"
  end
end
