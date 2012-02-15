require 'spec_helper'

class DummyObject
end


describe DummyObject do
  let(:klass) { DummyObject }

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
end