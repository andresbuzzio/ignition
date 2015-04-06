class Project < ActiveRecord::Base
  has_many :pledges
  has_many :events
  has_many :users, :through => :pledges
  belongs_to :user
  before_create :assign_random_image
  
  def html_description
    BlueCloth.new(Sanitize.clean(description)).to_html
  end
  
  def assign_random_image
    write_attribute(:image_url, "http://lorempixel.com/260/180/abstract/" + (rand(9) + 1).to_s)
  end
end
