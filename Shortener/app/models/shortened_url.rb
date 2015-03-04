class ShortenedUrl < ActiveRecord::Base
  belongs_to :submitter,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: 'User'

  validates :submitter_id, :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

  def self.random_code
    code = SecureRandom::urlsafe_base64(12)

    while ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom::urlsafe_base64(12)
    end

    code
  end


end
