fatal() { echo "fatal [$(basename $BATS_TEST_FILENAME)]: $@" 1>&2; exit 1; }

[ "$IMAGE" ] || fatal "IMAGE envvar not set"
[ "$(docker images -q $IMAGE | wc -l)" = "1" ] || fatal "$IMAGE not in cache"

_echo() {
    docker run --rm -i "$IMAGE" "$@"
}

@test "hello" {
    run _echo "hello"
    [ $status -eq 0 ]
    [ "${lines[0]}" = "hello" ]
}

@test "hello world" {
    [ "$(_echo 'hello world')" = "hello world" ]
}

