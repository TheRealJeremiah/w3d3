class User < ActiveRecord::Base
  has_many :submitted_urls,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: 'ShortenedUrl'

  validates :email, :presence => true, :uniqueness => true
end
