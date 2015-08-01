class Product < ActiveRecord::Base
  belongs_to :catalog

  scope :by_catalog, ->(c) { where catalog: c }

  validates :name, :catalog_id,  presence: true
end
