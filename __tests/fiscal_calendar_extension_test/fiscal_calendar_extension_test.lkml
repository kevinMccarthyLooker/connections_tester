include: "/_base_views_and_explores/order_items.view"

include: "//financial_calendar_extension/financial_calendar_extension.view.lkml"

view: +order_items {
#   dimension_group: created {
#     type: time
#     sql: ${TABLE}.created_at ;;
#   }

  extends: [financial_calendar_extension]

#here what you configure the block on
  dimension_group: base_date {
    label: "_base date test label change"
    sql:${created_date::date};;} # also considering having them fill constant: my_base_field_for_financial_calendar {value: "${created_raw}"} , but that would be difficult to apply multiple times in an instance

  dimension: default_fiscal_calendar_type {
    sql:4-4-5;;
  }
  parameter: fiscal_calendar_selector {hidden: no}


#And perhaps we should we give them access to configure the output fields like this
  dimension: financial_week_of_year {group_label:"Special Group Label"}
  dimension: financial_year {group_label:"Created Date"}
  dimension: financial_quarter_of_year {group_label:"Created Date"}
  dimension: financial_month_of_year {group_label:"Created Date"}

  dimension: test_validator_length {sql:'test';;}

  ##
  ## no real change validator test: fast
  dimension: add_new_field_validator_test {sql:'test3';;} #faster with fewer connections

  # dimension: one_year_prior_first_monday {
  #   # required_fields: [one_year_prior_jan_1_day_to_first_monday_number_days]
  #   label: "one_year_prior_first_monday in test override"
  #   type: date  convert_tz: no #base field would've already been converted
  #   expression:add_days(${one_year_prior_jan_1_day_to_first_monday_number_days},${one_year_prior_jan_1_day});;#   expression:if(${one_year_prior_jan_1_day_of_week_index}=0,${one_year_prior_jan_1_day},add_days((7-${one_year_prior_jan_1_day_of_week_index}),${one_year_prior_jan_1_day}));;
  # }
}

test: fiscal_calendar_one_fiscal_calendar_field_financial_years_ago {
  explore_source: order_items {
    column: financial_year {field:order_items.financial_years_ago}
  }
  assert: field_has_value {
    expression: NOT is_null(${order_items.financial_years_ago});;
  }
}

# test: fiscal_calendar_days_since_first_monday {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     column: days_since_first_monday {field:order_items.days_since_first_monday}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }

# test: fiscal_calendar_one_year_prior_first_monday {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     column: one_year_prior_first_monday {field:order_items.one_year_prior_first_monday}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }
# test: fiscal_calendar_financial_quarter_of_year {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     column: financial_quarter_of_year {field:order_items.financial_quarter_of_year}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }

# test: fiscal_calendar_first_monday {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     column: first_monday {field:order_items.first_monday}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }

# test: fiscal_calendar_type_sql_number {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     column: fiscal_calendar_type_sql_number {field:order_items.fiscal_calendar_type_sql_number}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }
# #
test: fiscal_calendar_several_fields_including_some_that_had_some_athena_errors {
  explore_source: order_items {
    column: base_date_date {field:order_items.base_date_date}
    column: days_since_first_monday {field:order_items.days_since_first_monday}
    column: one_year_prior_first_monday {field:order_items.one_year_prior_first_monday}
    column: financial_quarter_of_year {field:order_items.financial_quarter_of_year}
    column: fiscal_calendar_type_sql_number {field:order_items.fiscal_calendar_type_sql_number}
    column: first_monday {field:order_items.first_monday}
    column: first_day_of_financial_quarter {field:order_items.first_day_of_financial_quarter}
  }
  assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
}

#days_since_first_monday
#one_year_prior_first_monday
#financial_quarter_of_year
#fiscal_calendar_type_sql_number
#first_monday

# test: fiscal_calendar_fail_1 {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     # column: financial_year {field:order_items.financial_year}
#     # column: financial_years_ago {field:order_items.financial_years_ago}
#     # column: first_day_of_financial_year {field:order_items.first_day_of_financial_year}
#     # column: financial_quarter_of_year {field:order_items.financial_quarter_of_year}
#     # column: financial_month_of_year {field:order_items.financial_month_of_year}
#     # column: financial_week_of_year {field:order_items.financial_week_of_year}
#     # column: financial_day_of_year {field:order_items.financial_day_of_year}
#     # column: financial_year_quarter_label {field:order_items.financial_year_quarter_label}
#     # column: financial_quarters_ago {field:order_items.financial_quarters_ago}
#     column: first_day_of_financial_quarter {field:order_items.first_day_of_financial_quarter}
#     # column: financial_month_of_quarter {field:order_items.financial_month_of_quarter}
#     # column: financial_week_of_quarter {field:order_items.financial_week_of_quarter}
#     # column: financial_day_of_quarter {field:order_items.financial_day_of_quarter}
#     # column: financial_year_quarter_month_label {field:order_items.financial_year_quarter_month_label}
#     # column: financial_months_ago {field:order_items.financial_months_ago}
#     # column: first_day_of_financial_month {field:order_items.first_day_of_financial_month}
#     # column: financial_week_of_month {field:order_items.financial_week_of_month}
#     # column: financial_day_of_month {field:order_items.financial_day_of_month}
#     # column: financial_year_quarter_month_week_label {field:order_items.financial_year_quarter_month_week_label}
#     # column: financial_weeks_ago {field:order_items.financial_weeks_ago}
#     # column: first_day_of_financial_week {field:order_items.first_day_of_financial_week}
#     # column: day_of_week {field:order_items.day_of_week}
#     # column: first_monday {field:order_items.first_monday}
#     # column: range_days {field:order_items.range_days}
#     # column: count {field:order_items.count}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }
#

# test: fiscal_calendar_another_failure {
#   explore_source: order_items {
#     column: base_date_date {field:order_items.base_date_date}
#     # column: financial_year {field:order_items.financial_year}
#     # column: financial_years_ago {field:order_items.financial_years_ago}
#     column: first_day_of_financial_year {field:order_items.first_day_of_financial_year}
#     # column: financial_quarter_of_year {field:order_items.financial_quarter_of_year}
#     # column: financial_month_of_year {field:order_items.financial_month_of_year}
#     # column: financial_week_of_year {field:order_items.financial_week_of_year}
#     # column: financial_day_of_year {field:order_items.financial_day_of_year}
#     # column: financial_year_quarter_label {field:order_items.financial_year_quarter_label}
#     # column: financial_quarters_ago {field:order_items.financial_quarters_ago}
#     # column: first_day_of_financial_quarter {field:order_items.first_day_of_financial_quarter}
#     # column: financial_month_of_quarter {field:order_items.financial_month_of_quarter}
#     # column: financial_week_of_quarter {field:order_items.financial_week_of_quarter}
#     # column: financial_day_of_quarter {field:order_items.financial_day_of_quarter}
#     # column: financial_year_quarter_month_label {field:order_items.financial_year_quarter_month_label}
#     # column: financial_months_ago {field:order_items.financial_months_ago}
#     # column: first_day_of_financial_month {field:order_items.first_day_of_financial_month}
#     # column: financial_week_of_month {field:order_items.financial_week_of_month}
#     # column: financial_day_of_month {field:order_items.financial_day_of_month}
#     # column: financial_year_quarter_month_week_label {field:order_items.financial_year_quarter_month_week_label}
#     # column: financial_weeks_ago {field:order_items.financial_weeks_ago}
#     # column: first_day_of_financial_week {field:order_items.first_day_of_financial_week}
#     # column: day_of_week {field:order_items.day_of_week}
#     # column: first_monday {field:order_items.first_monday}
#     # column: range_days {field:order_items.range_days}
#     # column: count {field:order_items.count}
#   }
#   assert: field_has_value {expression: NOT is_null(${order_items.base_date_date});;}
# }


test: fiscal_calendar_test_all_user_fields_included {
  explore_source: order_items {
    column: base_date_date {field:order_items.base_date_date}
    column: financial_year {field:order_items.financial_year}
    column: financial_years_ago {field:order_items.financial_years_ago}
    column: first_day_of_financial_year {field:order_items.first_day_of_financial_year}
    column: financial_quarter_of_year {field:order_items.financial_quarter_of_year}
    column: financial_month_of_year {field:order_items.financial_month_of_year}
    column: financial_week_of_year {field:order_items.financial_week_of_year}
    column: financial_day_of_year {field:order_items.financial_day_of_year}
    column: financial_year_quarter_label {field:order_items.financial_year_quarter_label}
    column: financial_quarters_ago {field:order_items.financial_quarters_ago}
    column: first_day_of_financial_quarter {field:order_items.first_day_of_financial_quarter}
    column: financial_month_of_quarter {field:order_items.financial_month_of_quarter}
    column: financial_week_of_quarter {field:order_items.financial_week_of_quarter}
    column: financial_day_of_quarter {field:order_items.financial_day_of_quarter}
    column: financial_year_quarter_month_label {field:order_items.financial_year_quarter_month_label}
    column: financial_months_ago {field:order_items.financial_months_ago}
    column: first_day_of_financial_month {field:order_items.first_day_of_financial_month}
    column: financial_week_of_month {field:order_items.financial_week_of_month}
    column: financial_day_of_month {field:order_items.financial_day_of_month}
    column: financial_year_quarter_month_week_label {field:order_items.financial_year_quarter_month_week_label}
    column: financial_weeks_ago {field:order_items.financial_weeks_ago}
    column: first_day_of_financial_week {field:order_items.first_day_of_financial_week}
    column: day_of_week {field:order_items.day_of_week}
    column: first_monday {field:order_items.first_monday}
    column: range_days {field:order_items.range_days}
    column: count {field:order_items.count}
  }
  assert: field_has_value {
    expression: NOT is_null(${order_items.financial_years_ago});;
  }
}
