# Define the database connection to be used for this model.
connection: "bq_rmg_demo"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.


explore: orders {
  join: users {
    type: inner
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.id} ;;
  }
}
datagroup: looker_rmg_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_rmg_demo_default_datagroup
