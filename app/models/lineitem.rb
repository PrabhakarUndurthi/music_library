class Lineitem < ActiveRecord::Base

	belongs_to :album
	belongs_to :order
end
