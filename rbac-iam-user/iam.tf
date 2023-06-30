locals {
  team-a-member = [
    "team-a-member1",
    "team-a-member2",
  ]
  team-b-member = [
    "team-b-member1",
    "team-b-member2",
  ]
}

resource "google_service_account" "team-a" {
  for_each     = toset(local.team-a-member)
  account_id   = each.value
  display_name = each.value
}

resource "google_service_account" "team-b" {
  for_each     = toset(local.team-b-member)
  account_id   = each.value
  display_name = each.value
}

