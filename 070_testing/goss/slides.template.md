## Testing images

XXX https://github.com/aelsabbahy/goss

XXX https://hub.docker.com/r/aelsabbahy/goss

XXX https://github.com/aelsabbahy/goss/tree/master/extras/dgoss

---

## Demo: Testing images

<!-- include: docker-0.command -->

<!-- include: docker-1.command -->

<!-- include: docker-2.command -->

Do not change behaviour specially entrypoint, commands and parameters

---

## Demo: Using `dgoss`

`dgoss` is a wrapper for `docker`

It runs a container, mounts goss and executes tests

<!-- include: dgoss-0.command -->

---

## Demo: Creating tests

Easily create tests using `dgoss`

<!-- include: goss-0.command -->

<!-- include: goss-1.command -->

Check [the manual](https://github.com/aelsabbahy/goss/blob/master/docs/manual.md#dns) for syntax and available tests

---

## Demo: Health endpoint

`goss` can provide test results and health endpoint

<!-- include: healthz-0.command -->

<!-- include: healthz-1.command -->

<!-- include: healthz-2.command -->
