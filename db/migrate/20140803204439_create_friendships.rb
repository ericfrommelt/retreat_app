class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user_id
      t.references :friend_id
    end
  end
end
