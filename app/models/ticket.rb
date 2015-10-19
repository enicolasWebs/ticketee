class Ticket < ActiveRecord::Base
    belongs_to :project
    belongs_to :author, class_name: "User"

    mount_uploader :asset, AssetUploader

    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
end
