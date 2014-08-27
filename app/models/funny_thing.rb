class FunnyThing < ActiveRecord::Base
  belongs_to :friend

  after_destroy :delete_friend_if_no_funnies

  def delete_friend_if_no_funnies
    if friend.funny_things.empty?
      friend.destroy
    end
  end


end
