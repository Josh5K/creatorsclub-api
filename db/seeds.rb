
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
    require 'net/http'
    require 'uri'

    user = User.create(username: "AquaFPS",password: "password", email: "aquafps@creatorsclub.net", profile_picture: "https://www.famousbirthdays.com/faces/aquafps-image.jpg", youtube: "https://www.youtube.com/channel/UCYBj-GYx_ihae1MfSJQS7nA", twitter: "https://twitter.com/aquafpsgaming", twitch: "https://www.twitch.tv/aquafpsgaming")
    seller = Seller.create(category: 110011, active: true, seller_title: "Content Creator", seller_name: "Cool Clothes");
    user.sellers << seller

    user = User.create(username: "TryHardHeroes",password: "password", email: "tryhard@creatorsclub.net", profile_picture: "https://yt3.ggpht.com/a-/AAuE7mAUPcrDU72MwjTokIndj-IepNug5OoIDQ57QA=s900-mo-c-c0xffffffff-rj-k-no", youtube: "https://www.youtube.com/tryhardheroes", twitter: "https://twitter.com/tryhardheroes", twitch: "https://www.twitch.tv/tryhardheroes")
    seller = Seller.create(category: 666666, active: true, seller_title: "Content Creator", seller_name: "TryHards Store");
    user.sellers << seller

    user = User.create(username: "Blooprint",password: "password", email: "blooprint@creatorsclub.net", profile_picture: "https://yt3.ggpht.com/a-/AAuE7mAdH4W2DoedvtHCX1zndHEcTOAVujBjLOiy9g=s900-mo-c-c0xffffffff-rj-k-no", youtube: "https://www.youtube.com/channel/UCj-wTLj0p0YvTkS-9-ACm0A", twitter: "https://twitter.com/blooprintgames", twitch: "https://www.twitch.tv/blooprint_")
    seller = Seller.create(category: 123123, active: true, seller_title: "Content Creator", seller_name: "Blooprints Prints");
    user.sellers << seller

    user = User.create(username: "Welyn",password: "password", email: "welyn@creatorsclub.net", profile_picture: "https://pbs.twimg.com/profile_images/1038909085502959616/_IwiBQYz_400x400.jpg", youtube: "https://www.youtube.com/channel/UCg4XK-l40KZD7fLi12pJ1YA", twitter: "https://twitter.com/imwelyn", twitch: "https://www.twitch.tv/welyn")
    seller = Seller.create(category: 111222, active: true, seller_title: "Content Creator", seller_name: "Welyns Store");
    user.sellers << seller

    uri = URI.parse("http://localhost:3000/api/v1/sync/products")
    response = Net::HTTP.get_response(uri)

    uri = URI.parse("http://localhost:3000/api/v1/sync/variants")
    response = Net::HTTP.get_response(uri)

    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

end
