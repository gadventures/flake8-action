# flake8-action
A Github action to run flake8

## Description
Add this action to run flake8 on python files that are being changed.

## Required arguments.
This action requires a single positional argument of the branch being compared against (eg. `origin/develop`)

## Example
in a `.github/main.workflow`
```
workflow "on push" {
  on = "push"
  resolves = ["Running Flake8 on pushed code"]
}

 action "Running Flake8 on pushed code" {
  uses = "wmak/flake8-action@master"
  args = "origin/develop"
}
```
