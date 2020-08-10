class Lugare < ApplicationRecord
    validates :nombre, presence:true
    validates :latitud, presence:true
    validates :longitud, presence:true
    validates :urlmapa, presence:true

end
