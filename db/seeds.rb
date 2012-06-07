# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([
  {
    :name => "Carousel",
    :image_url => "http://www.trms.com/carousel.png"
  },
  {
    :name => "Cablecast",
    :image_url => "http://www.trms.com/cablecast.png"
  },
  {
    :name => "Zeplay",
    :image_url => "http://www.trms.com/zeplay.png"
  }
])

Document.create :name => "First Doc",
                :url => "http://www.trms.com/file1.pdf",
                :category => Category.first

Document.create :name => "Second Doc",
                :url => "http://www.trms.com/file2.pdf",
                :category => Category.first

Document.create :name => "Third Doc",
                :url => "http://www.trms.com/file3.pdf",
                :category => Category.last