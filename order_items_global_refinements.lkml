include:"order_items_base_view.view"
# view: +order_items {
view: +order_items_base_view {
  label: "Order Items ({{_dialect._name}})"
  dimension: dialect {
    label: "_dialect"
    sql: '{{_dialect._name}}' ;;
  }
}
