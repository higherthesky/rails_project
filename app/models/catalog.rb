class Catalog < ActiveRecord::Base
  validates :name,  presence: true
end
