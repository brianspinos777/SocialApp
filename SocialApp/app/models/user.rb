class User < ApplicationRecord

  #======= DEVISE

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #======= ASSOCIATIONS
  has_many :photos
  has_many :videos
  has_many :reactions
  has_many :comments
  has_many :friendships


  #======= PAPERCLIP

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  #
  # How to check the mime type of a file:
  # $ file -b --mime-type  foo.docx
  #
  # => application/vnd.openxmlformats-officedocument.wordprocessingml.document
  #
  # validates_attachment_content_type :avatar, content_type: [
  #       "application/pdf",
  #       "application/zip",
  #       "application/x-zip",
  #       "application/x-zip-compressed",
  #       "application/octet-stream",
  #       "application/vnd.ms-office",
  #       "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  #       "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  #       "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  #       "application/pdf",
  #       "text/plain",
  #       "image/jpg",
  #       "image/png",
  #       "image/jpeg",
  #       /\Aimage\/.*\Z/
  # ]


  #=======

end
