view: faa {
  #demo of toggling to another explore inclomplete
}
explore: faa {
  hidden: yes
  group_label: "connection_test"
}

#most basic data test. at least see the connection is working and records are coming through
# test: faa_has_records {
#   explore_source: faa {column: count {}}
#   assert: test {expression: ${order_items.count}>0;;}
# }
