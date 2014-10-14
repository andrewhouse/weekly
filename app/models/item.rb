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
  has_many :projections, dependent: :destroy
  has_many :users, through: :projections
  has_many :images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :images

  after_update :send_email
  STATUS = %i[projection closed hidden]

  scope :old, -> {where("created_at < ?", 7.days.ago)}

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
    #Item.all.sort_by(&:updated_at).last(3).reverse
    updated = Item.order(:updated_at => :desc).limit 3
    hash = []
    updated.each do |up|
      hash << {title: up.title, image: up.images.first.picture.url(:medium), id: up.id}
    end 
    hash
  end

  def self.popular
    popular = Item.all.sort_by{|a|a.projections.count}.last(3).reverse
    hash = []
    popular.each do |up|
      hash << {title: up.title, image: up.images.first.picture.url(:medium), id: up.id}
    end 
    hash
  end

  def self.new_items
    # Item.all.sort_by(&:created_at).last(3).reverse
    new = Item.order(:created_at => :desc).limit 3
    hash = []
    new.each do |up|
      hash << {title: up.title, image: up.images.first.picture.url(:medium), id: up.id}
    end 
    hash
  end

  def average
    return "No Projected Prices" if projections.blank?
    avg = projections.where(price: min_price.to_f .. max_price.to_f )
    unless avg.blank?
      avg.map(&:price).inject(&:+)/(avg.count) 
    else
      "All Projected Prices Are Outside of Your Range"
    end
  end

  def entire_average
    return "No Projected Prices" if projections.blank?
    projections.map(&:price).inject(&:+)/projections.count
  end

  def days_remaining
    days = created_at + 7.days
  end

  def is_old
    Item.old.include?(self)
  end
end
