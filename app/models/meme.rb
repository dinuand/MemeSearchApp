class Meme < ActiveRecord::Base
	has_many :mappings
	has_many :keywords, :through => :mappings
end
