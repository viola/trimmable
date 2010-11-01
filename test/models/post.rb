class Post < ActiveRecord::Base
  validates_presence_of :title
  trimmable_attributes :title, :comments
end
