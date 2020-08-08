include: "order_items.view"
view: +order_items {
  label: "Order Items ({{_dialect._name}})"

### Custom fields we want to add in every model
  dimension: dialect {
    view_label: "INFO"
    label: "_dialect"
    sql: '{{_dialect._name}}' ;;
  }
}
