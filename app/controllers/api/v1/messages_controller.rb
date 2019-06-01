class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    @messages = Message.where(channel: @channel).order(created_at: :asc)
    render json: @messages
  end

  def create
    message = Message.new(message_params)
    message.user = current_user
    message.channel = @channel
    message.save
    render json: message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
