require 'rails_helper'

RSpec.describe Artist, type: :model do

	context "データが正しく保存される" do
        before do
            @artist = Artist.new
            @artist.artist_name = "AAA"
            @artist.artist_details = "aaa"
            @artist.artist_kana = "エーエーエー"
            @artist.save
        end
        it "全て入力してあるので保存される" do
            expect(@artist).to be_valid
        end
    end

    context "データが正しく保存されない" do
        before do
            @artist = Artist.new
            @artist.artist_name = "AAA"
            @artist.artist_details = "aaa"
            @artist.artist_kana = "エーエーエー"
            Artist.find = (artist_name: AAA)
            @artist.save
        end
        it "artist_nameが重複しているため保存されない" do
            expect(@artist).to be_invalid
            expect(@artist.errors[:artist_name]).to include("はすでに存在します")
        end
    end

    context "データが正しく保存されない" do
        before do
            @artist = Artist.new
            @artist.artist_name = "AAA"
            @artist.artist_details = ""
            @artist.artist_kana = "エーエーエー"
            @artist.save
        end
        it "artist_detailsが入力されていないので保存されない" do
            expect(@artist).to be_invalid
            expect(@artist.errors[:artist_details]).to include("can't be blank")
        end
    end

    context "データが正しく保存されない" do
        before do
            @artist = Artist.new
            @artist.artist_name = "AAA"
            @artist.artist_details = "aaa"
            @artist.artist_kana = ""
            @artist.save
        end
        it "artist_kanaが入力されていないので保存されない" do
            expect(@artist).to be_invalid
            expect(@artist.errors[:artist_kana]).to include("can't be blank")
        end
    end

end
