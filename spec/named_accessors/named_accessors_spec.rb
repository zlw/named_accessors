require 'spec_helper'

describe Object do
  let(:post) { Post.new('foobar') }
  let(:klass) { Object }

  context '#named_reader' do
    it 'should respond to getter method with specified name' do
      klass.named_reader(:created_at, as: :when_was_it_created?)
      klass.should respond_to :when_was_it_created?
    end

    it 'should return value of instance variable' do
      klass.instance_variable_set(:'@created_at', 'Today')
      klass.when_was_it_created?.should == 'Today'
    end
  end

  context '#named_writed' do
    it 'should respond to setter method with specified name' do
      klass.named_writer(:content, as: :post_content)
      klass.should respond_to :post_content=
    end

    it 'should set value to instance method' do
      klass.post_content = 'Lorem ipsum'
      klass.instance_variable_get(:'@content').should == 'Lorem ipsum'
    end
  end

  context '#named_accessor' do
    it 'should respond to both reader and writer' do
      klass.named_accessor :title, as: :fancy_title
      klass.should respond_to :fancy_title, :fancy_title=
    end

    it 'should respond to changed writer name' do
      klass.named_accessor :foo, as: :foobar, writer: :bar
      klass.should respond_to :foobar
      klass.should respond_to :bar=
    end

    it 'should respond to changed reader name' do
      klass.named_accessor :foo, as: :foobaz, reader: :baz
      klass.should respond_to :foobaz=
      klass.should respond_to :baz
    end

    it 'should respond to changed both reader and writer' do
      klass.named_accessor :foo, as: :dummy, reader: :one, writer: :two
      klass.should respond_to :one
      klass.should respond_to :two=
    end

    it 'shoud respond to changed both reader and writer when `as` option is not given' do
      klass.named_accessor :foo, reader: :reader, writer: :writer
      klass.should respond_to :reader
      klass.should respond_to :writer=
    end
  end
end