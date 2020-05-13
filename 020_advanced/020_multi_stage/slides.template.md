## Multi Stage Builds

Multiple `FROM` sections in `Dockerfile`

Last section represents final image

Intermediate images built using `--target`

Prerequisites: Docker 17.09

```Dockerfile
FROM openjdk:8-jdk AS builder
#...

FROM openjdk:8-jre
COPY --from=builder ...
#...
```
