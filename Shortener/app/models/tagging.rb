class Tagging < ActiveRecord::Base

  belongs_to :url,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: 'ShortenedUrl'

  belongs_to :topic,
    foreign_key: :tag_topic_id,
    primary_key: :id,
    class_name: 'TagTopic'

end
