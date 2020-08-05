include:"/order_items_global_refinements"
include: "order_items.view"
view: +order_items {
suggestions: yes

dimension: added_field {sql:'added in aurora refinement';;}
#   final: yes
}
