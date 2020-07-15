class User < ApplicationRecord
  validates :nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, :email, :password, presence: {message: "が空欄です"}
  validates :email, uniqueness: {message: "は既に登録されています"}
  validates :firstname, :lastname, :firstname_read, :lastname_read, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :password, length: { minimum:7, message: "は7文字以上で入力してください"}, confirmation: {message: "の値が一致しません"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable



  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :creditcards, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy



end
