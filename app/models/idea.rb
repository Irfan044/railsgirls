class Idea < ApplicationRecord
    #delete_all added later
    has_many :comments, dependent: :delete_all
    mount_uploader :picture, PictureUploader
end
