## usersテーブル

|Column                |Type          |Options                          |
|----------------------|--------------|---------------------------------|
|nickname              |string        |null: false                      |
|email                 |string        |null: false, unique: true        |
|encrypted_password    |string        |null: false                      |
|last_name             |string        |null: false                      |
|first_name            |string        |null: false                      |
|last_name_kana        |string        |null: false                      |
|first_name_kana       |string        |null: false                      |
|birthday              |date          |null: false                      |

### Association
has_many :items
has_many :orders

## itemsテーブル

|Column                |Type          |Options                          |
|----------------------|--------------|---------------------------------|
|item_name             |string        |null: false                      |
|describe              |text          |null: false                      |
|category_id           |integer       |null: false                      | <!-- Activehash -->
|state_id              |integer       |null: false                      | <!-- Activehash -->
|shipping_charge_id    |integer       |null: false                      | <!-- Activehash -->
|from_id               |integer       |null: false                      | <!-- Activehash -->
|transport_day_id      |integer       |null: false                      | <!-- Activehash --> 
|sale_price            |integer       |null: false                      |
|user                  |references    |null: false,foreign_key: true    |

### Association
belongs_to :user
has_one :order


## ordersテーブル

|Column                |Type          |Options                          |
|----------------------|--------------|---------------------------------|
|user                  |references    |null: false,foreign_key: true    |
|item                  |references    |null: false,foreign_key: true    |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

|Column                |Type          |Options                          |
|----------------------|--------------|---------------------------------|
|post_code             |string        |null: false                      |
|from_id               |integer       |null: false                      | <!-- Activehash -->
|adderss_city          |string        |null: false                      |
|adderss_number        |string        |null: false                      |
|adderss_bilding_name  |string        |                                 |
|tel_number            |string        |null: false                      |
|order                 |references    |null: false,foreign_key: true    |

### Association
belongs_to :order
