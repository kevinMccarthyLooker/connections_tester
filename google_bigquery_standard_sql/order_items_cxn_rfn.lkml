include: "order_items.view"
view: +order_items {
  suggestions: yes
  dimension: added_field {sql:'added in bigquery refinement';;}
  dimension_group: created {
    datatype: timestamp
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S+00', ${created_at}) ;;
  }
#    final: yes
}
