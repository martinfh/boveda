class Obra < ApplicationRecord

	belongs_to :user, required: false
	has_one_attached :imagen

def self.search(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("titulo ILIKE ? or tecnica ILIKE ? or disponibilidad LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
end
end

private