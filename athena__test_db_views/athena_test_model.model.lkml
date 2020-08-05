connection: "athena__test_db"
###Nothing below should need to change between models###

#include global files as necessary
include: "/base_explore"
include: "/order_items_global_refinements"

#generic/common includes (uses relative references to pick up this folder's version)
# include: "order_items.view"
# include: "order_items_connection_specific_refinements"
include: "*"

### connection specific special includes may go here

### instantiate the explore in this model
explore: order_items {
  from: order_items
  extends: [order_items_base_explore]
}
