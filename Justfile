#!/usr/bin/env just --justfile

init:
    kcl mod update

docs:
    kcl doc generate --escape-html --target docs/library
    mv docs/library/docs/enkinex-odps.md docs/library/odps.md
    rmdir docs/library/docs/
test:
    set -e; for f in test/*.yaml; do kcl vet "$f" odps.k --format yaml -s DataProduct; done
