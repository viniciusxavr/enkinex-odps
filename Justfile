#!/usr/bin/env just --justfile

init:
    kcl mod update

docs:
    kcl doc generate --escape-html --target docs/library
    mv docs/library/docs/enkinex-odps.md docs/library/odps.md
    rmdir docs/library/docs/
