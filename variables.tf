variable "discovery_engine_search_engine_iam_bindings" {
  description = <<EOT
Map of discovery_engine_search_engine_iam_bindings, attributes below
Required:
    - collection_id
    - engine_id
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    collection_id = string
    engine_id     = string
    members       = set(string)
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

