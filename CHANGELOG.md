# Changelog
## oacs-5-10 - 2023-05-06

### Added
- `hook/build.sh` image tag `latest` for docker image

### Changed
- `hook/push.sh` push docker image with tag `latest`
- github pipeline will use ``runs-on: ubuntu-22.04`
- writing a new openacs service script (`run, finish, type`)
- updated docker compose dependecies for postgres (`condition: service_healthy`)
