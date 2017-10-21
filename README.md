# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|column|type|options|
|------|----|------|
|name|string|null: false, add_index :users, :name|
|user_idenitfier|string|null: false, unique: true|
|email|string|null: false, unique: true|

### Association
- has_many :followers
- has_many :tweets
- has_many :favorites


## followesテーブル

|column|type|options|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|follower_id|integer|null: false|

### Association
- belongs_to :user


## tweetsテーブル

|column|type|options|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|content|string|----------|

### Association
- belongs_to :user
- has_many :tags, through: tweet_tag
- has_many :favorites
- has_many :images
- has_many :replies
- has_many :retweets


## tagsテーブル

|column|type|options|
|------|----|------|
|content|string|null: false, unique: true|


### Association
- has_many :tweets, through: tweet_tag


## tweet_tagテーブル

|column|type|options|
|------|----|------|
|tweet_id|string|null: false, foreign_key: true|
|tag_id|string|null: false, foreign_key: true|

### Association
- belongs_to :tweet
- belongs_to :tag


## favoritesテーブル

|column|type|options|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet


## imagesテーブル

|column|type|options|
|------|----|------|
|tweet_id|integer|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :tweet


## repliesテーブル

|column|type|options|
|------|----|------|
|tweet_id|integer|null: false, foreign_key: true|
|replyed_tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :tweet


## retweetsテーブル

|column|type|options|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :tweet
