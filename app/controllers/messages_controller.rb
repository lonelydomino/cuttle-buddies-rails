class MessagesController < ApplicationController

  def index
    @messages = Message.where("recipient_id = ?", current_user.id)
  end

  def new
    @message = Message.new(author_id: params[:user_id])
  end

  def create
    if params[:message][:recipient_id] && !User.exists?(params[:message][:recipient_id])
      redirect_to new_user_message_path, error: "Recipient not found!"
    else
      Message.create(message_params)  
      redirect_to user_messages_path, success: "Message sent!"
    end
  end

  def destroy
    if Message.find_by_id(params[:id]).destroy
      redirect_to user_messages_path, success: "Message deleted!"
    else
      redirect_to user_messages_path, error: "Message deletion failed!"
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:recipient_id, :author_id, :content, :subject)
  end

  def deny_access
    render :"errors/record_not_found"
  end


end
