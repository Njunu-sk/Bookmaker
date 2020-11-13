class Bookmark < ApplicationRecord
    validates :title, presence: true, alllow_blank: false
    validates :url, presence: true, alllow_blank: false
end
