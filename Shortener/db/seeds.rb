# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


TagTopic.create!(name: 'news')
TagTopic.create!(name: 'science')
TagTopic.create!(name: 'art')
TagTopic.create!(name: 'sports')
user = User.create!(email: 'ned5@neeeeeeed.com')

50.times do |i|
  long_url = "http://www.google.com/search?q=#{i}"
  short = ShortenedUrl.create_for_user_and_long_url!(user, long_url)
  v = (1..25).to_a.sample
  v.times do
    Visit.record_visit!(user, short)
  end
  var = [1,2,3,4].sample
  Tagging.create!(tag_topic_id: var, shortened_url_id: i+1)
end
