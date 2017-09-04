class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  belongs_to :gender

  has_attached_file :avatar, styles: { medium: "300x300>", small: "100x100>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 has_attached_file :cover, styles: { cover1: "820x462", cover2: "462x820>", small: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
