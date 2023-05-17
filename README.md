# README for .gitconfig

## Alias Configuration

In the `.gitconfig` file, there's an alias named `rst`. This is a custom command that simplifies several steps in your Git workflow into a single command.

#### How to Use git rst

First, copy the code to `.gitconfig`

The `git rst` command is designed to automate several git operations into one step. It's usage is as follows:

```
git rst <devBranch> [<your-target-branch> ...]
```

Here is what each part of the command does:

- `<devBranch>` is the name of the branch you want to reset. This argument is mandatory. If not provided, the command will print a usage message and return.
- `<your-target-branch> ...` is a list of one or more branches that you want to merge into your newly reset branch. This argument is optional. If not provided, the command will skip the merge step.

## Command Steps

Here's a detailed explanation of what happens when you use `git rst`:

1. Checkout to the main branch.

2. Pull the latest changes from the main branch.

3. If the development branch (`<devBranch>`) exists, it's deleted.

4. A new branch with the name of the development branch (`<devBranch>`) is created and checked out.

5. The new development branch is pushed to the remote repository, replacing the old one if it existed.

6. If target branches are provided, the command will try to merge each of them into the newly created branch. If a branch doesn't exist, a warning message is printed and the merge is skipped.

Note: This command will force push to the remote repository, which may overwrite changes. Be careful to only use this command when you are sure that it's safe to do so.
