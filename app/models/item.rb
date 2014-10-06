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

class Item < ActiveRecord::Base
  belongs_to :artist, class_name: "User", foreign_key: "user_id"
  validates_presence_of :artist, :title, :description, :status
  has_many :projections
  has_many :users, through: :projections

  after_update :send_email
  STATUS = %i[projection closed hidden]

  def send_email
    if status_changed?
      self.projections.each do |p|
        ItemMailer.item_email_update(p).deliver
      end
    end
  end

  def status_update
    if created_at < 7.days.ago
      self.status = 'closed'
      save!
    end
  end

  def self.recently_updated
    Item.all.sort_by(&:updated_at).last(3).reverse
  end

  def self.popular
    Item.all.sort_by{|a|a.projections.count}.last(3).reverse
  end

  def self.new_items
    Item.all.sort_by(&:created_at).last(3).reverse
  end

  def average
    return "No Projected Prices" if projections.blank?
    min = self.projections.where("price > ?", min_price) 
    max = min.where("price < ?", max_price)
    unless max.blank?
      max.map(&:price).inject(&:+)/(max.count) 
    else
      "All Projected Prices Are Outside of Your Range"
    end
  end

  def entire_average
    return "No Projected Prices" if projections.blank?
    projections.map(&:price).inject(&:+)/projections.count
  end

end
