require 'rubygems'
require 'active_record'
require 'test/unit'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'trimmable'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :posts do |t|
    t.string :title
    t.text :comments
  end
end
