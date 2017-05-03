class Post < ApplicationRecord
	belongs_to :usuario

	def self.anterior(id)
		where("id < ?", id).last
	end

	def self.siguiente(id)
		where("id > ?", id).first
	end
end
