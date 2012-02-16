require 'spec_helper'

describe Object do
  let(:klass) { Object }

  context '#extract_as_option' do
    it 'should return as option' do
      klass.send(:extract_as_option, {as: :foobar}).should == :foobar
    end

    it 'should raise exception when `as` option is not given' do
      not_specified_as_option = lambda { klass.send(:extract_as_option, {}) }
      not_specified_as_option.should raise_exception "You must specify `as` option"
    end
  end

  context '#getter_name' do
    it 'should return getter name' do
      klass.send(:getter_name, {as: :dummy_getter}).should == :dummy_getter
    end
  end

  context '#setter_name' do
    it 'should return setter name' do
      klass.send(:setter_name, {as: :dummy_setter}).should == :dummy_setter=
    end
  end

  context '#instance_variable_name' do
    it 'should return proper instance variable name' do
      klass.send(:instance_variable_name, :foobar).should == :'@foobar'
    end
  end

  context '#extract_option' do
    it 'should return changed `as` option to reader' do
      klass.send(:extract_option, {as: :foo, reader: :foobar}, :reader)[:as].should == :foobar
    end

    it 'should return not changed `as` options if reader is not given' do
      klass.send(:extract_option, {as: :foo}, :reader)[:as].should == :foo
    end

    it 'should return changed `as` option to writer' do
      klass.send(:extract_option, {as: :foo, writer: :foobar}, :writer)[:as].should == :foobar
    end

    it 'should return not changed `as` option if writer is not given' do
      klass.send(:extract_option, {as: :foo}, :writer)[:as].should == :foo
    end
  end

  context '#extract_accessor_options' do
    it 'should return array of option hashes' do
      klass.send(:extract_accessor_options, {as: :foo}).should == [{as: :foo}, {as: :foo}]
    end

    it 'should return array of option hashes with changed reader' do
      options = klass.send(:extract_accessor_options, {as: :foo, reader: :foobar})

      reader, writer = options

      reader[:as].should == :foobar
      writer[:as].should == :foo
    end

    it 'should return array of option hashes with changed writer' do
      options = klass.send(:extract_accessor_options, {as: :foo, writer: :foobar})

      reader, writer = options

      reader[:as].should == :foo
      writer[:as].should == :foobar
    end
  end
end