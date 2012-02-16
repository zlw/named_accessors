## Description

You ever wanted to create attr_accessor with specified name? Now You can!

## Installation

```ruby
gem 'named_accessors'
```

or 

```ruby
gem 'named_accessors', git: 'git@github.com:zlw/named_accessors.git'
```

Gem was tested under 1.9.3

## Usage

Just use named_accessor (or named_reader/named_writer) class method in Your class

```ruby
class Post
  def initialize(title)
    @title, @content, @created_at = title, 'Lorem ipsum', Time.now
  end

  named_accessor :title, as: :fancy_title
  named_writer :content, as: :post_content
  named_reader :created_at, as: :when_was_it_created?

  named_accessor :foo, reader: :foobar, writer: :foobaz
  named_accessor :foo, as: :bar, reader: :foobar
  named_accessor :foo, as: :bar, writer: :foobar
end

post = Post.new('Lorem ispum')
post.fancy_title #=> Lorem ipsum
post.fancy_title = 'Bored with lorem ipsum'

post.post_content = 'Maybe some true content here'

post.when_was_it_created? #=> 2012-02-15 15:56:08 +0100
```

## License

Copyright (C) 2012 Krzysztof Zalewski

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.