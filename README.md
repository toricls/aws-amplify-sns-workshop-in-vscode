# Run "Amplify SNS Workshop" in Visual Studio Code's Remote Container

With using the VSCode's remote container extension and the files in this repo, you can walk through the [Amplify SNS Workshop](https://amplify-sns.workshop.aws/) without installing (unwanted) stuff into your local machine's environment.

We've created and tested this repo on/for macOS, but it also could work on Windows machines 田ミ

## Prerequisities

- Visual Studio Code with the [`Remote - Containers`](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- [Docker for Desktop](https://www.docker.com/products/docker-desktop)

## Usage

- Clone this repo to your local machine
- Open the cloned directory in Visual Studio Code
- Open remote container environment by following the vscode's popup window(, then it'll build a new container for you)
- If you already have existing AWS profile(s) in your local machine and use one of them for the workshop, you can skip the first section of the workshop and start from the [section 2](https://amplify-sns.workshop.aws/10_getting_started/00_what_you_build.html).

## Structure

### Repository

```shell
.
├── .devcontainer          <- Configs for the 'Remote - Containers' extension
├── .gitignore
├── copy-boyaki-to-host.sh <- See the "Note" below
├── LICENSE
└── README.md              <- You're reading this file right now :)
```

### In the remote container

```shell
/              <- Container's root
...
├── hostdir    <- Mounted host directory (= containers all files and folders of this repository)
...
└── workspaces <- Your working directory :)
```

#### Preserving your work

**_NOTE: You will find the `boyaki` directory in your remote container during the workshop (so as in the VSCode's explorer) but NOT in your host machine. This is a side-effect of the fix PR [#3](https://github.com/toricls/aws-amplify-sns-workshop-in-vscode/pull/3) (for the issue [#2](https://github.com/toricls/aws-amplify-sns-workshop-in-vscode/issues/2)) to speed up the `npx create-react-app` command, thus you may lose your `boyaki` files once you stop the remote container. If you need to preserve and/or edit the files inside the `boyaki` folder outside of your remote container, you can use the bash script `copy-boyaki-to-host.sh` to copy those in-container files as a zip file `boyaki.zip` to your host machine's `boyaki` directory. Simply execute `/hostdir/copy-boyaki-to-host.sh` inside your remote container and follow the guidance to run it._**

## Details of the container

### 1. Installed Packages

#### via `.devcontainer/Dockerfile`

- Node.js v12.x
- AWS CLI v2.x
- Amazon Corretto 8 (OpenJDK 1.8.x) _for the "Amplify Mocking" feature_

#### via `.devcontainer/devcontainer.json`

- AWS Amplify CLI 4.16.1

### 2. Default configurations

_We'd recommend you to use this repository with the default configurations below, but still you can change the configs in the `devcontainer.json` file and/or the `Dockerfile` in the `.devcontainer` directory if you need._

#### Working directory (inside your remote container)

- `/workspaces`

#### Mounted directories (to your remote container)

- Your git cloned folder (as `/hostdir` in the container)
- Your AWS credentials folder ({$HOME|$USERPROFILE}/.aws). So that you can use your existing AWS profiles for the `amplify init` command, and you don't need to run the `amplify configure` command if you use your pre-configured AWS profile.

#### Forwarded Ports (from host to your remote container)

The following ports are exposed from the remote container and you can access them via your web browser with http://localhost:{PORT_NUMBER}.

- 3000 (for the local development server, launched by `npm start` command)
- 20002 (for [Amplify Mocking](https://docs.amplify.aws/cli/usage/mock), launched by `amplify mock api` command) **Make sure to use `http://localhost:20002` as the endpoint of the mocked API when you access it via a web browser**.

## Author

[Tori](https://github.com/toricls)
