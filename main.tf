resource "google_discovery_engine_search_engine_iam_binding" "discovery_engine_search_engine_iam_bindings" {
  for_each = var.discovery_engine_search_engine_iam_bindings

  collection_id = each.value.collection_id
  engine_id     = each.value.engine_id
  members       = each.value.members
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

