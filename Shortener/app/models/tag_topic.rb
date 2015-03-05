class TagTopic < ActiveRecord::Base
  has_many :taggings,
    foreign_key: :tag_topic_id,
    primary_key: :id,
    class_name: 'Tagging'

  has_many :urls,
    through: :taggings,
    source: :url



  def most_popular_links(n)
    urls
      .select("shortened_urls.*, COUNT(visits.id) AS count")
      .joins(:visits)
      .group("shortened_urls.id")
      .order("COUNT(visits.id) DESC")
      .limit(n)

    # SELECT DISTINCT
    #   su.long_url
    # FROM
    #   shortened_urls AS su
    # JOIN
    #   visits AS v
    #   ON su.id = v.shortened_url_id
    # JOIN
    #   taggings AS tag
    #   ON tag.shortened_url_id = su.id
    # JOIN
    #   tag_topics AS tt
    #   ON tt.id = tag.tag_topic_id
    #   WHERE tt.id = self.id
    # GROUP BY
    #   su.long_url
    # ORDER BY
    #   COUNT(v.id) DESC
    # LIMIT 10

  end

end
