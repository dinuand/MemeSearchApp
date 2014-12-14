class Keyword < ActiveRecord::Base
	has_many :mappings
	has_many :memes, :through => :mappings
end
