require "test_helper"

class Admin::BlogControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_post = BlogPost.create!(
      title: "Test Post",
      body: "This is a test post body.",
      category: "Test",
      date: Date.today,
      summary: "Test summary"
    )
    @username = "admin"
    @password = "secret"
    ENV["ADMIN_USERNAME"] = @username
    ENV["ADMIN_PASSWORD"] = @password
  end

  teardown do
    ENV.delete("ADMIN_USERNAME")
    ENV.delete("ADMIN_PASSWORD")
  end

  test "should not get index without auth" do
    get admin_blog_index_url
    assert_response :unauthorized
  end

  test "should get index with auth" do
    get admin_blog_index_url, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@username, @password) }
    assert_response :success
  end

  test "should not get new without auth" do
    get new_admin_blog_url
    assert_response :unauthorized
  end

  test "should get new with auth" do
    get new_admin_blog_url, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@username, @password) }
    assert_response :success
  end

  test "should create blog_post with auth" do
    assert_difference("BlogPost.count") do
      post admin_blog_index_url, 
        params: { blog_post: { body: @blog_post.body, category: @blog_post.category, date: @blog_post.date, summary: @blog_post.summary, title: "New Post" } },
        headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@username, @password) }
    end

    assert_redirected_to admin_blog_index_url
  end

  test "should update blog_post with auth" do
    patch admin_blog_url(@blog_post), 
      params: { blog_post: { title: "Updated Title" } },
      headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@username, @password) }
    
    assert_redirected_to admin_blog_index_url
    @blog_post.reload
    assert_equal "Updated Title", @blog_post.title
  end

  test "should destroy blog_post with auth" do
    assert_difference("BlogPost.count", -1) do
      delete admin_blog_url(@blog_post),
        headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(@username, @password) }
    end

    assert_redirected_to admin_blog_index_url
  end
end
