class MessagesController < ApplicationController
	before_action :correct_user, only:[:index, :destroy]

  def correct_user
  	unless admin_signed_in?
  		redirect_to root_path
  	end
  end

  def index
  	@messages = Message.all
  end

  def new
  	@message = Message.new
  end

  def create
  	message = Message.new(message_params)
  	message.save
  	redirect_to new_message_path, flash: {notice:'お問い合わせを送信しました'}
  end

  def destroy
  	message = Message.find(params[:id])
  	message.destroy
  	redirect_to messages_path, flash: {notice:'削除しました'}
  end


  private
    def message_params
        params.require(:message).permit(:name, :mail, :text)
    end
end
