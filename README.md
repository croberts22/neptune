![neptune](https://i.imgur.com/8OH7lrb.png)

# neptune
An extension to [github-linguist](https://github.com/github/linguist) that generates data through a given span of commits.

## How to use
Run this gem inside a repository and it will generate a language breakdown per commit, in CSV format. `commit_history.csv` will live in the root directory of the project.

**Note**: Since this still in its early stages, this gem is *highly* unoptimized and may take an egregiously long time to finish if your codebase is large and your commits aplenty.

Example CSV format: 

```
bac697485bdf8afb7a5fb3ee0e8b45ab9cd48bd7,1463334895,0.96,Objective-C,0.04,Swift,0.00,C,0.00,Ruby,0.00,Shell
05b1c63ac5dd5c6d085c116c574e3914960a0adf,1463338769,0.96,Objective-C,0.04,Swift,0.00,C,0.00,Ruby,0.00,Shell
ebb3087f19903b7af5e432db44bc283689a87919,1463531685,0.88,Objective-C,0.12,Swift,0.00,C,0.00,Ruby,0.00,Shell
```

## Things to do

- Options to limit commit count
- Selective diffs between commits against an existing CSV file