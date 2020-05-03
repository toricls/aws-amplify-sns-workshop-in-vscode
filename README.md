# Run "Amplify SNS Workshop" in Visual Studio Code's Remote Container

With using the VSCode's remote container extension and the files in this repo, you can walk through the [Amplify SNS Workshop](https://amplify-sns.workshop.aws/) without installing (unwanted) stuff into your local machine's environment.

We created and tested this repo on/for macOS, but it also could work on Windows machines 田ミ

## Prerequisities

- Visual Studio Code with the [`Remote - Containers`](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- [Docker for Desktop](https://www.docker.com/products/docker-desktop)

## Usage

- Clone this repo to your local machine
- Open the cloned directory in Visual Studio Code
- Open remote container environment by following the vscode's popup window(, then it'll build a new container for you)
- If you already have existing AWS profile(s) in your local machine and use one of them for the workshop, you can skip the first section of the workshop and start from the [section 2](https://amplify-sns.workshop.aws/10_getting_started/00_what_you_build.html).

## Structure

```
.
├── .devcontainer <- Configs for the 'Remote - Containers' extension
├── .gitignore
├── LICENSE
├── README.md     <- This file :)
└── boyaki        <- An empty directory for the app created in the workshop
```

## Details of the container

### 1. Installed Packages

#### via `.devcontainer/Dockerfile`.

- Node.js v12.x
- AWS CLI v2.x
- Amazon Corretto 8 (OpenJDK 1.8.x) _for the "Amplify Mocking" feature_

#### via `.devcontainer/devcontainer.json`.

- AWS Amplify CLI 4.16.1

### 2. Configurations

#### Mounted directories

- Your workspace folder (= the cloned folder itself)
- Your AWS credentials folder ({$HOME|$USERPROFILE}/.aws). So that you can use your existing AWS profiles for the `amplify init` command, and you don't need to run the `amplify configure` command if you use your pre-configured AWS profile.

#### Forwarded Ports

The following ports are exposed from the remote container and you can access them via your web browser with http://localhost:{PORT_NUMBER}.

- 3000 (for the local development server, launched by `npm start` command)
- 20002 (for [Amplify Mocking](https://docs.amplify.aws/cli/usage/mock), launched by `amplify mock api` command) **Make sure to use `http://localhost:20002` as the endpoint of the mocked API when you access it via a web browser**.

## Author

[Tori](https://github.com/toricls)
