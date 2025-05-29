class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :authored_comments, class_name: "Comment", foreign_key: "author_id"
has_many :received_comments, class_name: "Comment", foreign_key: "target_id"


         has_many :items, dependent: :destroy
        #  has_many :comments, dependent: :destroy
         has_many :reviews, dependent: :destroy
         has_many :reservations, dependent: :destroy
         has_many :ratings, dependent: :destroy

end
