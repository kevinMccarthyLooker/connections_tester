include: "order_items.view"
view: +order_items {
  dimension_group: created_at {hidden: yes}

  dimension_group: created {
    type: time
    sql: ${created_at_raw} ;;
  }
#    final: yes
}
