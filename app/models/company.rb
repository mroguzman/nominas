class Company < ActiveRecord::Base
  attr_accessible :cif, :name, :sec_social_number, :street
end
