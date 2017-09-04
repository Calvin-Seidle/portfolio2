class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  belongs_to :gender

  has_attached_file :avatar, styles: { medium: "300x300>", small: "100x100>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 has_attached_file :cover, styles: { cover1: "820x462", cover2: "462x820>", small: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/


 has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

 has_many :following, through: :active_relationships, source: :followed
 has_many :followers, through: :passive_relationships, source: :follower
 #helper methods

 #follow another user
 def follow(other)
 	active_relationships.create(followed_id: other.id)
 end
 
 #unfollow a user
 def unfollow(other)
 	active_relationships.find_by(followed_id: other.id).destroy
 end

 #is following a user?
 def following?(other)
 	following.include?(other)
 end
end
