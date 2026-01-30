# Godot Game Template

Template repo for quickly spinning up a new Godot game.

## Template Usage

Once a new repo has been created, follow these steps:

- Find & Replace the string 'Godot Game Template' to set the project title
- Change renderer settings based on target platform - by default, this project will be set to the _Compatibility_ renderer in order to support web-based game jam projects.
- Update the deployment information (e.g. itchio project id) in `.github/workflows/deploy.yaml`
- Update the README (set title, add project description, remove template instructions)

## Getting Started

### Git & Git LFS

First, make sure git is set up. If you're new to git, you can just download [GitHub Desktop](https://desktop.github.com/download/).

Next, set up [Git LFS (Large File Storage)](https://git-lfs.com/) to properly handle binary files:

- If you're using GitHub Desktop, this should be set up automatically.
- Otherwise, download [Git LFS (Large File Storage)](https://git-lfs.com/), then run `git lfs install` in this directory.

### Managing Godot installs with GodotEnv

We strongly recommend using [GodotEnv](https://github.com/chickensoft-games/GodotEnv). GodotEnv allows you to manage multiple versions of Godot easily, as well as manage project addons in a declarative way.

Install the tool using the dotnet CLI. Execute the following command in your terminal (e.g. Powershell for Windows)

```sh
dotnet tool install --global Chickensoft.GodotEnv`
```

**Useful commands**:

The following commands should be run from _within_ the project directory.

- Install the right version of Godot for this project with `godotenv godot install`. You can also install a specific version with `godotenv godot install <version>`, e.g. `godotenv godot install 4.6-stable`
- 'Activate' the right version of Godot for this project with `godotenv godot use`. Now if you launch Godot (e.g. from the start menu= or with the `godot -e` command), it will be the correct version for this project.
- Install this project's addons (if it has any) with `godotenv addons install`
