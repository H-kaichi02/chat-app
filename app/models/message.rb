class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.new(tweet_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
