#tests need to know the existence of certain fields in order to validate
#connections and tests each may add their own custom fields on top of this
view: order_items {
  dimension: id {}
  dimension: order_id {}
  dimension: user_id {}
  dimension_group: created {type:time}
}
