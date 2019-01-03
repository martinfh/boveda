class Obra < ApplicationRecord

	belongs_to :user
	has_one_attached :imagen

def self.search(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("artista LIKE ? or titulo LIKE ? or tecnica LIKE ? or año LIKE ? or disponibilidad LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
end
end

private