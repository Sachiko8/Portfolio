require 'rails_helper'

RSpec.describe Message, type: :model do

	context "データが正しく保存される" do
        before do
            @message = Message.new
            @message.name = "山田花子"
            @message.mail = "a@a"
            @message.text = "アーティスト追加希望"
            @message.save
        end
        it "全て入力してあるので保存される" do
            expect(@message).to be_valid
        end
    end

    context "データが正しく保存されない" do
        before do
            @message = Message.new
            @message.name = ""
            @message.mail = "a@a"
            @message.text = "アーティスト追加希望"
            @message.save
        end
        it "nameが入力されていないので保存されない" do
            expect(@message).to be_invalid
            expect(@message.errors[:name]).to include("can't be blank")
        end
    end

    context "データが正しく保存されない" do
        before do
            @message = Message.new
            @message.name = "山田花子"
            @message.mail = "a@a"
            @message.text = ""
            @message.save
        end
        it "textが入力されていないので保存されない" do
            expect(@message).to be_invalid
            expect(@message.errors[:text]).to include("can't be blank")
        end
    end

    context "データが正しく保存されない" do
        before do
            @message = Message.new
            @message.name = "山田花子"
            @message.mail = ""
            @message.text = "アーティスト追加希望"
            @message.save
        end
        it "mailが入力されていないので保存されない" do
            expect(@message).to be_invalid
            expect(@message.errors[:mail]).to include("can't be blank")
        end
    end

end
