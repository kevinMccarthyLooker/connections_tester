connection: "athena__test_db"

### NOTE: Nothing below should need to change between models

include: "order_items.view" #auto-generated view in this folder
include: "/_base_views_and_explores/order_items_base_view.view" #add global logic
view: +order_items {extends: [order_items_base_view]}
include: "order_items_cxn_rfn" #special includes, fixes, and overides within this connection folder


#include global files as necessary
### instantiate the explore in this model
include: "/_base_views_and_explores/order_items_base_explore"
explore: order_items {
  from: order_items
  extends: [order_items_base_explore]
}
