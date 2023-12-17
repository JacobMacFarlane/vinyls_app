class Vinyl < ApplicationRecord
    validates :album_name, presence: true
    validates :artist_name, presence: true
end
