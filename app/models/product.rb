class Product < ActiveRecord::Base
  belongs_to :catalog

  validates :name, :catalog_id,  presence: true
end
