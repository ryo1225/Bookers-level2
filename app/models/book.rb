class Book < ApplicationRecord
	belongs_to :user
	attachment :image

	validates :title, :body, presence: true
	validates :body, length: { maximum: 200 }

end
