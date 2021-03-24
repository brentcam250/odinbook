class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  #accepted friends
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  #not accepted yet
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: :requester_id, dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: :requestee_id, dependent: :destroy


  #posts
  has_many :posts, dependent: :destroy
  
  #active storage
  has_one_attached :profile_photo

  #carrierwave requirement
  mount_uploader :profile_photo, ProfilePicUploader

  def self.from_omniauth(auth)
    where(auth.slice(provider: auth.provider , uid: auth.uid)).first_or_create do |user| 
      user.provider = auth.provider 
      user.uid = auth.uid 
      user.name = auth.info.name 
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.profile_photo = auth.info.image 

      # user.oauth_token = auth.credentials.token 
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      # user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # def self.generate_upload_url(file_name)
  #   Aws::S3::Presigner.new.presigner.presigned_url(
  #     :put_object,
  #     bucket: ENV['S3_BUCKET_NAME'],
  #     key: file_name,
  #     use_accelerate_endpoint: true,
  #     expires_in: 300 # Number of seconds the URL is valid for
  #   )
  # end

end
