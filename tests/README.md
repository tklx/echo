## Install dependencies

```console
git clone https://github.com/sstephenson/bats.git
bats/install.sh /usr/local
```

## Run the tests

```console
IMAGE=tklx/echo bats --tap tests/basics.bats
1..2
ok 1 hello
ok 2 hello world
```

