# Censu

[![Build Status](https://travis-ci.org/ninoseki/censu.svg?branch=master)](https://travis-ci.org/ninoseki/censu)
[![Maintainability](https://api.codeclimate.com/v1/badges/39e77d63ce6a7d89b4dc/maintainability)](https://codeclimate.com/github/ninoseki/censu/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/censu/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/censu?branch=master)

* [Homepage](https://github.com/ninoseki/censu)
* [Issues](https://github.com/ninoseki/censu/issues)

## Description

Ruby API client to the [Censys] internet search engine.

## Examples

Initialize the API:

```ruby
require 'censys'
api = Censys::API.new(uid, secret)
```

Initialize the API by using `$CENSYS_ID` and `$CENSYS_SECRET` environment variables:

```ruby
api = Censys::API.new
```

Search:

```ruby
# Search for IPv4 addresses:
response = api.ipv4.search(query: 'dropbox.com')

# Search for Websites:
response = api.websites.search(query: 'dropbox.com')

# Search for Certificates:
response = api.certificates.search(query: 'dropbox.com')
```

Enumerate through search results:

```ruby
response.each_page do |page|
    puts ">>> Page ##{page.metadata.page} / #{page.metadata.pages} ..."
    page.each do |result|
        puts result
    end
end
```

View:

```ruby
# View for IPv4 addresses:
view = api.ipv4["8.8.8.8"]

# View for Websites:
view = api.websites["google.com"]

# View for Certificates:
view = api.certificates["821a712a29d8e25915f66a9771519746c5aa73a45321fd4ca7ef644e1cadda59"]
```

Report:

```ruby
# Generate aggregate reports:
response = api.websites.report(
    query: '80.http.get.headers.server: Apache',
    field: 'location.country_code',
    buckets: 100
)

response.each do |country,count|
    puts "#{country}: #{count}"
end
```

Combine Search and View API.

```ruby
api = Censys::API.new
response = api.websites.search(query: "hoge")
response.each_page do |page|
  page.each do |result|
    view = api.websites[result.domain]
    p view.domain                 # => e.g. "nrc.nl"
    p view.autonomous_system.name # => e.g. "NL-INTERMAX"
    p view.location.country       # => e.g. "Netherlands"
    p view.protocols              # => e.g. ["80/http", "0/lookup", "25/smtp", "443/https_www", "443/https", "80/http_www"]
  end
end
```

## Requirements

- Ruby 2.4 / 2.5

## Install

```bash
% gem install censu
```

## License

MIT License.

**Note:** This gem is forked from [trailofbits/censys-ruby](https://github.com/trailofbits/censys-ruby).

[ruby]: http://www.ruby-lang.org/
[Censys]: https://censys.io/
