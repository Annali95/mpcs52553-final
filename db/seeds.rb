# User
#   name: string
#   mail: text
#   password: text
#   profile: text
User.delete_all
data = [["MIA", "1000","1"],
         ["DFW", "1000","1"],
         ["DET", "1001","1"],
         ["STL", "1002","1"],
         ["PDX", "1003","1"],
         ["JFK", "1004","1"],
         ["BOS", "1005","1"],
         ["ABQ", "1006","1"],
         ["Anna", "1007","1"]]
data.each do |entry|
	user = User.new
	user.name = entry[0]
	user.mail = entry[1]
	user.password = entry[2]
  user.admin = 0
	user.save
end

user = User.new
user.name = "admin"
user.mail = "admin"
user.password = "password"
user.admin = 1
user.save

# Group
#   name: string
#   create_time: text
#   detail: text
Group.delete_all
Group.create name: "Friend", create_time: "2017-06-12", detail: "we are friend"
Group.create name: "Family", create_time: "2017-06-13", detail: "we are family"


# Article
#   category: text
#   title: text
#   content: text  
#   post_time: text
#   user_id: integer


Article.delete_all

data = [["1","Monday","I ate an apple!","MIA","https://www.w3schools.com/w3images/sandwich.jpg"],
        ["2","Tuesday","I ate a banana","MIA","https://www.w3schools.com/w3images/cherries.jpg"],
        ["1","Wednesday","I ate a celery","JFK","https://www.w3schools.com/w3images/wine.jpg"],
        ["2","Thursday","I ate a date","JFK","https://www.w3schools.com/w3images/salmon.jpg"],
        ["1","Friday","I ate a fish","BOS","https://www.w3schools.com/w3images/salmon.jpg"],
        ["2","Saturday","I ate a garlic","BOS","https://www.w3schools.com/w3images/steak.jpg"],
        ["1","Sunday","I ate a hamberger","ABQ","https://www.w3schools.com/w3images/popsicle.jpg"]]

# n = 0
data.each do |entry|
    # n = n+1
    article = Article.new
    article.category = entry[0]
    article.post_time = "2017-06-11"
    user = User.find_by(name: entry[3])
    article.user_id = user.id
    article.title = entry[1]
    article.content = entry[2]
    article.url = entry[4]
    article.like = 0


    article.save
end




# Comment
#   user_id: integer
#   article_id: integer
#   content: text
Comment.delete_all
data = [["Anna","Monday","Great"],
        ['MIA',"Tuesday","Good"],               
        ['ABQ',"Wednesday","Bad"]]

data.each do|entry|
  c = Comment.new 
  user = User.find_by(name: entry[0])
  article = Article.find_by(title: entry[1])
  c.user_id = user.id
  c.article_id = article.id
  c.content = entry[2]
  c.save
end


# Connection
#   group_id: integer
#   user_id: integer
#   detail: text
Connection.delete_all
data = [["Anna","Friend","Amy"],
        ["MIA","Friend","Tom"],               
        ["ABQ","Family","Mom"]]

data.each do|entry|
  c = Connection.new 
  user = User.find_by(name: entry[0])
  group = Group.find_by(name: entry[1])
  c.user_id = user.id
  c.group_id = group.id
  c.detail = entry[2]
  c.save
end


# # Friend
# #   friend1_id: id
# #   friend2_id: id
# Friend.delete_all
# data = [["Anna","MIA"],
#         ["MIA","ABQ"],               
#         ["ABQ","Anna"]]

# data.each do|entry|
#   f = Friend.new 
#   user1 = User.find_by(name: entry[0])
#   user2 = User.find_by(name: entry[1])
#   if user1.id>user2.id
#   	f.friend1_id = user2.id
#   	f.friend2_id = user1.id
#   	f.save
#   elsif  user1.id<user2.id
#   	f.friend1_id = user1.id
#   	f.friend2_id = user2.id
#   	f.save
#   end

# end

# Admin
#   name: string
#   mail: text
#   password: text
Admin.delete_all
data = [["admin", "1000","1"]]
data.each do |entry|
	admin = Admin.new
	admin.name = entry[0]
	admin.mail = entry[1]
	admin.password = entry[2]
	admin.save
end

# Grouparticle
#   group_id: integer
#   article_id: integer

GroupArticle.delete_all
data = [["Monday",'Friend'],
        ["Thursday",'Friend'],               
        ["Sunday",'Family']]

data.each do|entry|
  c = GroupArticle.new 
  article = Article.find_by(title: entry[0])
  group = Group.find_by(name: entry[1])
  c.article_id = article.id
  c.group_id = group.id
  c.save
end


puts "There are now:"
puts "  #{Article.count} Article"
puts "  #{User.count} User"
puts "  #{Group.count} Group"
puts "  #{User.count} user accounts"
puts "  #{Admin.count} admin accounts"
puts "  #{Comment.count} Comment"
puts "  #{Connection.count} Connection"
puts "  #{GroupArticle.count} GroupArticle"
# puts "  #{Friend.count} Friend"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
