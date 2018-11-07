class Obra < ApplicationRecord

belongs_to :user
 has_many_attached :imagenes # one-to-many relationship
end

private