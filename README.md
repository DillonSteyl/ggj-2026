# Mask

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
dotnet tool install --global Chickensoft.GodotEnv
```

**Useful commands**:

The following commands should be run from _within_ the project directory.

- Install the right version of Godot for this project with `godotenv godot install`. You can also install a specific version with `godotenv godot install <version>`, e.g. `godotenv godot install 4.6-stable`
- 'Activate' the right version of Godot for this project with `godotenv godot use`. Now if you launch Godot (e.g. from the start menu= or with the `godot -e` command), it will be the correct version for this project.
- Install this project's addons (if it has any) with `godotenv addons install`
