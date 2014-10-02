# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  status      :string(255)
#  link        :string(255)
#  user_id     :integer
#  max_price   :decimal(7, 2)
#  min_price   :decimal(7, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  belongs_to :artist, class_name: "User", foreign_key: "user_id"
  validates_presence_of :artist, :title, :description, :status
end
