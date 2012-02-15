require 'spec_helper'

class Post
  def initialize(title)
    @title, @content, @created_at = title, '', 'Today'
  end

  named_accessor :title, as: :fancy_title
  named_writer :content, as: :post_content
  named_reader :created_at, as: :when_was_it_created?
end

describe Object do
  let(:post) { Post.new('foobar') }

  context "#named_reader" do
    it "should respond to getter method with specified name" do
      post.should respond_to(:when_was_it_created?)
    end

    it 'should return value of instance variable' do
      post.when_was_it_created?.should == 'Today'
    end
  end

  context '#named_writer' do
    it 'should respond to setter method with specified name' do
      post.should respond_to(:post_content=)
    end

    it "should set value to instance method" do
      content = 'barbaz'
      post.post_content = content
      post.instance_variable_get(:"@content").should == content
    end
  end

  context '#named_accessor' do
    it "should respond to both getter and setter" do
      post.should respond_to(:fancy_title)
      post.should respond_to(:fancy_title=)
    end
  end
end