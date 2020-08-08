include: "/_base_views_and_explores/order_items.view"
view: +order_items {
  dimension: special_test {sql: 'special test not configured' ;;}
  dimension: special_test_description {
    sql:'{{special_test._sql | strip | replace:"'","`"}}' ;;
    html:sql: (*quotes replaced with `)<br>{{value |replace:":","<br>"}} ;;
  }
}

view: +order_items {
  parameter: test_selector {
    allowed_value: {value:"default__currently testing"}
    allowed_value: {value:"concat with bar"}
    allowed_value: {value:"concat function"}

    default_value: "default__currently testing"
  }

  dimension: concat_with_bar {sql: '1' || '2' ;;}
  dimension: concat_with_bar_comment {sql:'doesnt work in amazonaurora';;}

  dimension: concat_function {sql: concat('1','2','3') ;;}
  dimension: concat_function_comment {sql:'no failing dialects (yet), but i seem to recall...';;}


  #Paste new observations above and add an entry in test selector
  dimension: currently_testing {sql:'special test not configured or not selected';;}


  dimension: special_test {
    sql:
    {%if test_selector._parameter_value == "'concat with bar'"%}${concat_with_bar}
    {%elsif test_selector._parameter_value == "'concat function'"%}${concat_function}
    {%else%}${currently_testing}
    {%endif%}
    ;;
    }
  dimension: commentary {
    sql:
    {%if test_selector._parameter_value == "'concat with bar'"%}${concat_with_bar_comment}
    {%elsif test_selector._parameter_value == "'concat function'"%}${concat_function_comment}
    {%else%}'copy the currently testing and add an observation '
    {%endif%}
    ;;
}
}

# view: +order_items_base_view {
  # dimension: special_test {sql: concat('1','2','3') ;;}
  # dimension: commentary {sql:'no failing dialects (yet), but i seem to recall...';;}
# }
