xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do

   xml.title       "iForum's post list"
   xml.description "iforum's posts"
   xml.link        forums_url

   @posts.each do |post|
     xml.item do
       xml.title       post.title
       xml.link        forum_post_url(post.forum, post)
       xml.description post.content
       xml.guid        forum_post_url(post.forum, post)
     end
   end
 end
end

