class Listing < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  mount_uploader :photo,  PhotoUploader


  validates      :user_id, presence: true

  validates      :content,
                  presence: { message: 'has to be filled' },
                  length:   { maximum: 500 }

  validate      :photo_size

  private

    # Validates the size of an uploaded picture.
    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
    end

end
