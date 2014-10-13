# == Schema Information
#
# Table name: projections
#
#  id         :integer          not null, primary key
#  price      :decimal(7, 2)
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  mail       :boolean
#

class Projection < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  validates_presence_of :user_id, :item_id, :price
  validates_uniqueness_of :user_id, scope: [:item_id]

end
