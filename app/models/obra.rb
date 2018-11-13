class Obra < ApplicationRecord

belongs_to :user
 has_one_attached :imagen
end

private