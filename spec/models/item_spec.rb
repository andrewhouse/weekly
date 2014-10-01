require 'rails_helper'

describe Item do
  %i(seller title description status).each do |field|
    it "requires a #{field}" do 
      item = build :item, field => nil
      expect( item.valid? ).to be false
    end
  end
end

