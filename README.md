# hello world

## initial setup

### (optional) asdf version manager tool:
https://asdf-vm.com/guide/getting-started.html

### install Taskfile

Here are the steps based on your operating how to install taskfile runner: https://taskfile.dev/installation

### Python version

You will need to use Python 3.11, generally this is managed by package manager, [pyenv](https://github.com/pyenv/pyenv) or `asdf`

### Poetry

Once you have Python installed, next would be to install Poetry which manages virtual environment patterns easier for Python projects. https://python-poetry.org/docs/ - Version 2.1.2 is recommended here.

### Docker

You will need to install Docker and have it running for using this application. https://docs.docker.com/engine/install

### GCP - gcloud CLI
installation instructions here: https://cloud.google.com/sdk/docs/install
or use `asdf` alternatively.

## basic usage
install poetry dependencies:
```
task init
```

run locally:
```
task run
```

build image:
```
task build
```

run as container:
```
task runc
```

Note: When you want to relaunch your application in the container, you will need to rebuild your image each time.

### Publish to GCP:

To build, tag, and push your image to be readily available in GCP, you can run one task command:
```
task publish
```

### Deploy Terraform
```
cd terraform
tf init
tf apply -auto-approve
```

if you are setting up your GCP resources for the first time you might need to run:
```
gcloud services enable artifactregistry.googleapis.com --project=hello-world-ct

gcloud services enable run.googleapis.com --project=hello-world-ct
```
and set a GCP billing account.