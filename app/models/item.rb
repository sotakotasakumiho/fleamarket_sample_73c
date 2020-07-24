class Item < ApplicationRecord
  # validates :image, presence: {message: "は1枚以上は登録してください"}
  validates :name, presence: {message: "が空欄です"}, length: {maximum: 40, message: "は40文字以内で入力してください"}
  validates :explanation, presence: {message: "が空欄です"}, length: {maximum: 1000, message: "は1000文字以内で入力してください"}
  validates :category_id, presence: {message: "は少なくともメイングループから1つ選択してください"}
  validates :condition, presence: {message: "が空欄です：システムエラーのため管理者に連絡してください"}, exclusion: {in: %w(yyy), message: "が選択されていません"}
  validates :shipping_area, presence: {message: "が空欄です：システムエラーのため管理者に連絡してください"}, exclusion: {in: %w(xxx), message: "が選択されていません"}
  validates :shipping_pay, :shipping_period, presence: {message: "が空欄です：システムエラーのため管理者に連絡してください"}
  validates :price, presence: {message: "を入力してください"}, inclusion: {in: 300..9999999, message: "価格は¥300~9,999,999の範囲で設定してください"}

  enum condition: [:yyy, :brand_new, :mint, :bit_damaged, :slight_damaged, :damaged, :junk]
  enum shipping_pay: [:exhibitor, :customer]
  enum shipping_area: [
    :xxx,
    :hokkaido,
    :aomori,
    :iwate,
    :miyagi,
    :akita,
    :yamagata,
    :fukushima,
    :ibaraki,
    :tochigi,
    :gunma,
    :saitama,
    :chiba,
    :tokyo,
    :kanagawa,
    :niigata,
    :toyama,
    :ishikawa,
    :fukui,
    :yamanashi,
    :nagano,
    :gifu,
    :shizuoka,
    :aichi,
    :mie,
    :shiga,
    :kyoto,
    :osaka,
    :hyogo,
    :nara,
    :wakayama,
    :tottori,
    :shimane,
    :okayama,
    :hiroshima,
    :yamaguchi,
    :tokushima,
    :kagawa,
    :ehime,
    :kochi,
    :fukuoka,
    :saga,
    :nagasaki,
    :kumamoto,
    :oita,
    :miyazaki,
    :kagoshima,
    :okinawa]
  enum shipping_period: [:days1_2, :days2_3, :days4_7]
  enum status: [:sell, :draft, :sold]

  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc{|attributes| attributes["image"].blank?}
  has_one :purchase
  has_many :images
  #enum status: { sell: 0, buy: 1 , trading:2}, _prefix:

  #scope :on_sell, -> { where(status: 0) }

end
