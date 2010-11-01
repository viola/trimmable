require File.join( File.dirname(__FILE__), 'test_helper' )
require File.join( File.dirname(__FILE__), 'models/post')

class TrimmableTest < Test::Unit::TestCase
  def test_should_not_create_a_post_without_a_title
    assert Post.create.errors[:title].any?
  end

  def test_should_not_create_a_post_with_a_empty_title
    assert Post.create(:title => "     ").errors[:title].any?
  end

  def test_trimmable_should_strip_white_spaces_from_the_title_and_comments
    title = "  Hello world.  "
    comments = "First comment. "
    assert_equal title.strip, Post.create(:title => title).title
    assert_equal comments.strip, Post.create(:title => title, :comments => comments).comments
  end
end
