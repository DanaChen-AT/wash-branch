[alias]
    rst = "!f() { \
      local devBranch=\"${1:-}\"; \
      shift; \
      local target_branches=($@); \
      if [ -z \"$devBranch\" ]; then \
        echo \"Usage: git rst <devBranch> [<your-target-branch> ...]\"; \
        return 1; \
      fi; \
      git checkout main; \
      git pull; \
      if [[ $(git branch --list $devBranch) ]]; then\
        git branch -D $devBranch; \
      fi; \
      git checkout -b $devBranch; \
      git push origin :$devBranch -f; \
      if [ ${#target_branches[@]} -gt 0 ]; then \
        for target_branch in ${target_branches[@]}; do \
          if git show-ref --verify --quiet refs/heads/$target_branch; then \
            git merge $target_branch; \
          else \
            echo \"Warning: The branch '$target_branch' does not exist. Skipping merge.\"; \
          fi; \
        done; \
      else \
        echo \"No target branches provided. Skipping merge.\"; \
      fi; \
    }; f"
