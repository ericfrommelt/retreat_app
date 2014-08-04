class FriendRequest < ActiveRecord::Base

  def self.request(user, friend)
    unless user == friend or Friendship.exists?(user, friend)
      transaction do
        create(user: :user, friendship: :friend, status: 'pending')
        create(user: :user, friendship: :friend, status: 'requested')
      end
    end
  end


  def self.accept(user, friend)
    transaction do
      eccepted_at = Time.now
      accept_one_side(user, friend, accepted_at)
      accept_one_side(friend, user, accepted_at)
    end
  end

  def self.accept_one_side(user, friend, accepted_at)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end

end
