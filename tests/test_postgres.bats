#!/usr/bin/env bats

@test "PostgreSQL service should be active" {
  run systemctl is-active postgresql
  [ "$status" -eq 0 ]
  [ "$output" = "active" ]
}

@test "PostgreSQL should accept connections" {
  run sudo -u postgres psql -c "\l"
  [ "$status" -eq 0 ]
}
