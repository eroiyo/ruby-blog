class ResetAllPostCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Post.all.each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
  def down
    Post.all.each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
end
