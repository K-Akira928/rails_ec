# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 画像入りの製品10件を登録
10.times do |n|
  image_path = Rails.root.join("app/assets/images/#{n + 1}.jpg")
  Product.create!(
    name: "テスト商品#{n + 1}",
    price: 5000,
    description: "テスト商品#{n + 1}の説明です",
    image: ActiveStorage::Blob.create_and_upload!(io: File.open(image_path), filename: File.basename(image_path))
  )
end

# 画像なし製品1件を登録
Product.create!(
  name: '画像なしテスト商品1',
  price: 6000,
  description: '画像なしテスト商品1の説明です'
)

# adminユーザーを作成
User.create!(
  name: 'admin',
  password: 'pw',
  password_confirmation: 'pw'
)
