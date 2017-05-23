class Post < ApplicationRecord
	belongs_to :usuario

	validates :titulo, :cuerpo, presence: true

	scope :anteriores, -> (post) { where("id < ?", post.id) }
	scope :siguientes, -> (post) { where("id > ?", post.id) }

	def anterior
		Post.anteriores(self).last
	end

	def siguiente
		Post.siguientes(self).first
	end
end
