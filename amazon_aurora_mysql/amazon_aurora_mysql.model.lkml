connection: "aurora__test_db"
###Nothing below should need to change between models###

include: "order_items.view"
include: "/_base_views_and_explores/order_items_base_view.view"
view: +order_items {extends: [order_items_base_view]}

#include global files as necessary
include: "/_base_views_and_explores/order_items_base_explore"

#special includes by connection
include: "*"

### instantiate the explore in this model
explore: order_items {
  from: order_items
  extends: [order_items_base_explore]
}
