# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  status      :string(255)      default("projection")
#  link        :string(255)
#  user_id     :integer
#  max_price   :decimal(7, 2)
#  min_price   :decimal(7, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

describe Item do
  %i(artist title description status).each do |field|
    it "requires a #{field}" do 
      item = build :item, field => nil
      expect( item.valid? ).to be false
    end
  end
end

