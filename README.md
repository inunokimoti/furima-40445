## usersテーブル

|Column                |Type            |Options                          |
|----------------------|----------------|---------------------------------|
|nickname              |string型        |null: false                      |
|email                 |string型        |null: false, unique: true        |
|encrypted_password    |string型        |null: false                      |
|last_name             |string型        |null: false                      |
|first_name            |string型        |null: false                      |
|last_name_kana        |string型        |null: false                      |
|first_name_kana       |string型        |null: false                      |
|birthday_year         |date型          |null: false                      |
|birthday_month        |date型          |null: false                      |
|birthday_day          |date型          |null: false                      |

### Association
has_many :items
has_many :user_items

## itemsテーブル

|Column                |Type            |Options                          |
|----------------------|----------------|---------------------------------|
|item_name             |string型        |null: false                      |
|describe              |text型          |null: false                      |
|category              |string型        |null: false                      |
|state                 |string型        |null: false                      |
|shipping_charges      |string型        |null: false                      |
|ship_from             |string型        |null: false                      |
|transport_days        |string型        |null: false                      |
|sale_price            |integer型       |null: false                      |
|user                  |references型    |null: false,foreign_key: true    |

### Association
belongs_to :user
has_one :user_item


## user_itemsテーブル

|Column                |Type            |Options                          |
|----------------------|----------------|---------------------------------|
|user                  |references型    |null: false,foreign_key: true    |
|item                  |references型    |null: false,foreign_key: true    |


### Association
belongs_to :user
has_one :item
has_one :order

## ordersテーブル

|Column                |Type            |Options                          |
|----------------------|----------------|---------------------------------|
|post_code             |string型        |null: false                      |
|adderss_prefecture    |text型          |null: false                      |
|adderss_city          |string型        |null: false                      |
|adderss_number        |string型        |null: false                      |
|adderss_bilding_name  |string型        |null: false                      |
|tel_number            |string型        |null: false                      |

### Association
has_one :user_item
