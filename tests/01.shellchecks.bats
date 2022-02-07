#!.bats-battery/bats-core/bin/bats
load './helpers.bash'

setup() {
    targets=()
    while IFS=  read -r -d $'\0'; do
        targets+=("$REPLY")
    done < <(
        find \
            ../src/hook \
            ../src/builds \
            -type f ! -iname ".gitignore" \
            -print0
    )
}

@test "Check shell files" {
      run export LC_ALL=C.UTF-8; shellcheck "${targets[@]}"
      assert_success
}

@test "Check VERSIONS file" {
      run export LC_ALL=C.UTF-8; shellcheck --shell=sh --exclude=SC2034 ../src/VERSIONS
      assert_success
}
