# Dangdang
=========
[Dangdang Open Platform(当当开放平台)](http://open.dangdang.com) API in Ruby


[![Gem Version](https://badge.fury.io/rb/weidian_open.svg)](http://badge.fury.io/rb/weidian_open)

# Installation
Add this line to your application's Gemfile:
```ruby
gem 'dangdang'
```

And then execute:
```shell
$ bundle
```

Or install it yourself as:
```shell
$ gem install dangdang
```



# Usage
## Initialize
```ruby
a = Dangdang::Order.new(
  app_key: "1111111111",
  app_secret: "AAAAAAAA11111111BBBBBBBB22222222",
  session_key: "AAAAAAAA11111111AAAAAAAABBBBBBBBCCCCCCCCDDDDDDDDYYYYYYYYZZZZZZZZ"
)
```

## Orders List:
["dangdang_orders_list_get" method params reference](http://open.dangdang.com/index.php?c=documentCenterG4&f=show&page_id=132)


Example:
```ruby
# You can only fetch orders paid from Dangdang Open Platform in current time when using 'osd oed' submitted params.
a.dangdang_orders_list_get(
  osd: "2014-11-25 00:00:00",
  oed: "2014-11-26 16:30:00"
)

a.dangdang_orders_list_get(os: "100")

a.dangdang_order_list_get(o: "11111111111")
```


## Order Details:
["dangdang_order_details_get" method params reference](http://open.dangdang.com/index.php?c=documentCenterG4&f=show&page_id=133)

Example:
```ruby
a.dangdang_order_details_get(o: "11111111111")
```



