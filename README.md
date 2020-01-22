# DIY Container Talk

The `html` files in the root directory define a presentation. It consists of one or more topics stored in the subdirectories.

## Building slide decks

Generate all files to view existing slide decks:

```bash
make
```

Prepare a demo by installing tools and creating VMs:

```bash
bash demo_prepare.sh my.html
```

The demo environment should be prepared on the machine which will later be used to execute the automated demos.

## Running demos

Execute an automated demo:

```bash
bash demo_run.sh <myslides.html>
```

You will receive a new shell for every included topic in the slide deck. The code contained in `prepare.sh` and `cleanup.sh` will be execute before entering and after leaving the shell, respectively. The shell will have a few functions to manage demos:

```bash
# List demos for the current topics
demos

# Execute a demo
demo blah
```

The demo for a topic ends when closing the shell using `exit` or `^D`.

After the automated demos have finished, run the following command to cleanup including VM removal:

```bash
bash demo_cleanup.sh <myslides.html>
```

Note that slide decks have only been tested if they are referenced in a release of this repository.

## Topics

Each of those topics is made up of the following files:

1. Slides
    1. (either) `*.template.md`
    2. (or) `*.md`
1. Demos: `*.demo`
1. Demo environment
    1. `prep.sh` defines commands executed when preparing the demo environment using `demo_prepare.sh`
    1. `user-data.txt` causes `demo_prepare.sh` to create a VM based on the contained commands
1. Automated demos
    1. `prepare.sh` is executed before the shell for the topic if launched
    1. `cleanup.sh` is executed after the shell for the topic has ended

There are many examples in the subdirectories.

### Demos

Demos are defined in `*.demo` files. The automated demos expect these files to have the following format:

```text
# Title of the demo displayed by the demo function

# Comment of demo step 1 displayed when executing the demo
echo first command
echo demo step includes all commands ...
echo ...up to the next comment

# Comment of demo step 2 displayed when executing the demo
echo more commands
echo even more commands
```

The steps of a demo can be included into the slides. If the slides of a topic are defined in a `*.template.md` file, `make` will substitute a demo step when using the following syntax where `demo_name` is the name of the `*.demo` file:

```html
<!-- include: demo_name-0.command -->
```

The `*.command` files are generated by `make`.

### Virtual machines

Some demos should be run on fresh VMs. The current implementation uses Hetzner Cloud and expects a configured workspace for `hcloud`.

## Sharing slides

The slides can be copied to a location of your choice. It will include all files required for viewing the slides.

```bash
bash copy_clides.sh <myslides.html> /target/location/
```