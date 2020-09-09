# Contribute to PHP APP Docker

PHP APP Docker is an open-source project administered by [André Teles](https://github.com/apteles). We appreciate your interest and efforts to contribute to PHP App Docker.

## Open Development & Community Driven

PHP APP Docker is an open-source project. See the [LICENSE](https://github.com/apteles/php-app-docker/blob/master/LICENSE) file for licensing information. All the work done is available on GitHub.

The core team and the contributors send pull requests which go through the same validation process.

## Documentation

Pull requests relating to fixing documentation for the latest release should be directed towards the [documentation branch](https://github.com/apteles/php-app-docker).

## Bugs

We are using [GitHub Issues](https://github.com/apteles/php-app-docker/issues) to manage our public bugs. We keep a close eye on this so before filing a new issue, try to make sure the problem does not already exist.

---

## Before Submitting a Pull Request


**Before submitting your pull request** make sure the following requirements are fulfilled:

- Fork the repository and create your branch from `master`.

## Contribution Prerequisites

- You have [docker](https://docs.docker.com/engine/install/) at v19.03.12+
- You have [docker](https://docs.docker.com/compose/install) at 1.26.2+
- You are familiar with Git.

## Development Workflow


#### 1. Fork the [repository](https://github.com/apteles/php-app-docker)

[Go to the repository](https://github.com/apteles/php-app-docker) and fork it to your own GitHub account.

#### 2. Clone from your repository

```bash
git clone git@github.com:YOUR_USERNAME/php-app-docker.git
```

#### 3. Install the dependencies

Go to the root of the repository.

```bash
cd php-app-docker && ./develop build --no-cache
```

#### 4. Start the example application

Read the `getstarted` application README [here](./README.md).


