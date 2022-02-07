#!.bats-battery/bats-core/bin/bats
load './helpers.bash'

@test "Check Dockerfile" {
      run docker run --rm -i -v "${PWD}/../src":/work --workdir=/work  hadolint/hadolint hadolint -f json Dockerfile
      assert_success
}
