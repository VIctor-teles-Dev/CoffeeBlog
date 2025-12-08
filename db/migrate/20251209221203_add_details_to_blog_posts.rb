class AddDetailsToBlogPosts < ActiveRecord::Migration[8.0]
  def change

    add_column :blog_posts, :category, :string
    add_column :blog_posts, :reading_time, :integer
    add_column :blog_posts, :date, :datetime
    add_column :blog_posts, :summary, :text
  end
end
