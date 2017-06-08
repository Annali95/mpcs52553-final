Brief Introduction:
This is a website for people to share articles and find group of people have same interest.
You can post your articles in a group.
1.function
For user:
e-mail:1001
password:1001
. You can signup an account.
. You can login/out
. You can view your profile.
. You can edit you profile.
. You can view all groups.
. You can join a group.
. You can drop a group.
. You can view the groups you joined.
. You can post public articles.
. You can delete your own article.
. You can view your articles.
. You can view articles in your group.
. You can post private articles.(Other users need to answer your secret questions to see your post.)
. You can like an articles.
. You can use chart to see google chart.

For admin:
e-mail:admin
password:password
. You can login/out
. You can create a group.
. You can delete a group.
. You can delete any articles.
. You can see the member in a group.
. You can view private articles only with password.



Assumptions:
1. When you delete a group, you will delete every information about this group. The articles in this group will be move out and in no group.
Validations:
For admin:
	validates :name, presence: true
	validates :mail, presence: true
	validates :password, presence: true

For articles
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, class_name: 'Comment'

  validates :content, presence: true  
  validates :title, presence: true
  validates :user_id, presence: true



# MPCS 52553 - Final Project Starting Point

* Download the ZIP of this repository to start your project.  
* Rename your folder to `mpcs52553-final`

<hr>

Or, you can create a new Rails app yourself and follow these steps:

1. Generate a new Rais app: `rails new mpcs52553-final --skip-bundle`
2. Add `gem 'ez'` inside the `Gemfile`
3. `bundle install`
4. Then customize the `config/development.rb` as follows:

    ```
      config.assets.debug = false
      config.assets.digest = false
    ```

Now you can start developing.  Happy coding!


