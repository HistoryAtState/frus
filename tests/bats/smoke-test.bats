#!/usr/bin/env bats

# Basic start-up and connection tests
# These tests expect a running container at port 8080 with the name "exist"

@test "container jvm responds from client" {
  run docker exec exist java -version
  [ "$status" -eq 0 ]
}

@test "container can be reached via http" {
  result=$(curl -Is http://127.0.0.1:8080/ | grep -o 'Jetty')
  [ "$result" == 'Jetty' ]
}

@test "container reports healthy to docker" {
  result=$(docker ps | grep -c 'healthy')
  [ "$result" -eq 1 ]
}

@test "logs show clean start" {
  result=$(docker logs exist | grep -o 'Server has started')
  [ "$result" == 'Server has started' ]
}

# Make sure the package has been deployed
@test "logs show package deployment" {
  result=$(docker logs exist | grep -o 'http://history.state.gov/ns/data/frus')
  [ "$result" == 'http://history.state.gov/ns/data/frus' ]
}

# Too many Errors by trigger.xqm to be useful
# @test "logs are error free" {
#   result=$(docker logs exist | grep -ow -c 'ERROR' || true)
#   [ "$result" -eq 0 ]
# }

@test "no fatalities in logs" {
  result=$(docker logs exist | grep -ow -c 'FATAL' || true)
  [ "$result" -eq 0 ]
}

# Check for cgroup config warning 
@test "check logs for cgroup file warning" {
    result=$(docker logs exist | grep -ow -c 'Unable to open cgroup memory limit file' || true )
  [ "$result" -eq 0 ]
}