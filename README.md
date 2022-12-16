# Continuous Integration Images

The story begins as I moved to another company that stores their repository on Github.
Thus, the CI/CD platform will be Github Actions. Well, technically you can use other
CI/CD platforms such as Travis or Circle CI, but Github Actions has been the default
and the go-to of CI/CD runner in 2022, so why not. It's a good platform anyway.

You can easily run integration tests on your application to execute things directly
to anything (database, message broker, even Hashicorp stuff) if they provide their
Docker image version of the app. The configuration will be as simple as:

```yaml
  logger:
    name: Some Go Application
    runs-on: ubuntu-latest
    container: golang:1.18
    services:
      db:
        image: influxdb:2.3.0
        env:
          DOCKER_INFLUXDB_INIT_MODE: setup
          DOCKER_INFLUXDB_INIT_USERNAME: root
          DOCKER_INFLUXDB_INIT_PASSWORD: password
          DOCKER_INFLUXDB_INIT_ORG: organization
          DOCKER_INFLUXDB_INIT_BUCKET: public
          DOCKER_INFLUXDB_INIT_ADMIN_TOKEN: random_admin_token_that_is_secret
        options: >-
          --health-cmd "influx ping"
          --health-interval 30s
          --health-timeout 10s
          --health-retries 5
          --health-start-period 30s

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Build test
        run: go build .
      - name: Run test
        run: go test -v -race -coverprofile=coverage.out -covermode=atomic
        env:
          ACCESS_TOKEN: testing
          INFLUX_URL: http://db:8086/
          INFLUX_ORG: organization
          INFLUX_TOKEN: random_admin_token_that_is_secret
```

The problem with that configuration is that, when you have something like MinIO 
that requires some command to be executed. So your `docker run` became:
`docker run minio server /data`. The problem with this one is that you can't 
give additional command to run on Github Actions container configuration.

The simple alternative that won't mess with your head is to just create a new image
that is by default sets those additional commands.

This also comes with a cost: maintaining it.

This repository aims to fix just that. I can maintain the version and everyone will
be happy because everything is here, alongside with the version. I also don't need
to authenticate to Docker Hub, because Github Packages already did that for me.

## How to use the packages?

See the **Packages** section on the right of the repository, click it.

Then just use it, without any settings. If there are authentication,
there should be a note on the `README.md` of each directory.

## I want to add another package, yet I'm also lazy on maintaining it.

Sure, submit a PR that supply a `Dockerfile` and a Github Action workflow file 
(inside the `.github/workflows` directory). I'll take a look and merge it.

## License

```
MIT License

Copyright (c) 2022 Reinaldy Rafli <aldy505@proton.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

See [LICENSE](./LICENSE).
