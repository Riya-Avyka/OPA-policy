package pipeline

# Main rule to deny if conditions are met
deny[reason] {
  not is_snake_case(input.pipeline.identifier)
  reason = "Pipeline name is not in snake_case"
}

deny[reason] {
  some i
  input.pipeline.stages[i]  # Ensure that i is bound by iterating over stages
  not is_stage_snake_case(input.pipeline.stages[i].stage.identifier)
  reason = "Stage name is not in snake_case"
}

# Function to check if a string is in snake_case
is_snake_case(str) {
  # Match the pattern of lowercase letters and underscores
  re_match("^[a-z0-9]+(_[a-z0-9]+)*$", str)
}

is_stage_snake_case(stage_id) {
  # Ensure the stage name is in snake_case
  re_match("^[a-z0-9]+(_[a-z0-9]+)*$", stage_id)
}
