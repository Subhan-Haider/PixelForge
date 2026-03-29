# Code of Conduct

We have a [code of conduct](CODE_OF_CONDUCT.md) that we all must
follow. Be polite to everyone. If you are not in your best day, take a
deep breath and try again.

# New Issues

Before you submit an issue:

* Search in the current
  [list of issues](https://github.com/pixelforge/pixelforge/issues),
  [bug reports](https://community.pixelforge.org/c/bugs), or
  [feature requests](https://community.pixelforge.org/c/features).
* If the issue already exists, add a :+1: or a :heart:, and you can
  click the `Subscribe` or `Watching` button to get notifications
  via email.

# Compilation problems

Before you submit an issue or a post about a **compilation problem**,
check the following items:

* See how to get the source code correctly in the [INSTALL](INSTALL.md) guide.
* Check if you are using the latest repository clone.
* Remember that we use submodules, so you need to initialize and update them.
* Search in the [GitHub issues about compilation](https://github.com/pixelforge/pixelforge/issues?q=is%3Aissue+label%3Acompilation)
  if someone else had the same problem.
* Remember that might be some [pull requests](https://github.com/pixelforge/pixelforge/pulls)
  being reviewed to fix your same issue.

If you have a compilation problem, you can ask in the
[Development category](https://community.pixelforge.org/c/development)
in the [Community site](https://community.pixelforge.org/) for help
or create a [new GitHub issue](https://github.com/pixelforge/pixelforge/issues/new).

# Contributing

One of the easiest ways to contribute is writing articles, [Steam
reviews](https://steamcommunity.com/app/431730/reviews/), blog posts,
recording video tutorials, creating pixel art in social media with
[#pixelforge](https://twitter.com/search?q=%23pixelforge), or showing your
love to PixelForge, e.g. naming PixelForge in your website and linking it
to https://www.pixelforge.org/, following [@pixelforge](https://twitter.com/pixelforge),
or [buying an extra PixelForge copy to your friends](https://www.pixelforge.org/download/).

Other ways to contribute require direct contact with us. For example:

* [Writing documentation](https://github.com/pixelforge/docs).
* Making art (and fan art) with PixelForge and for PixelForge (logos, skins, mockups).
* Sending patches for features or bug fixes.
* Reviewing issues in the [issue tracker](https://github.com/pixelforge/pixelforge/issues)
  and making comments.
* Helping other users in the [Community](https://community.pixelforge.org/) site.

## Documentation

You can start seeing the
[documentation](https://www.pixelforge.org/docs/), and
[contact us](mailto:support@pixelforge.org) if you want to help
writing documentation or recording [tutorials](https://www.pixelforge.org/docs/tutorial/).

If you are going to write some docs, we recommend you to take
screenshots or record a GIF animations to showcase the feature your
are documenting or the steps to follow:

* As screen recording software, on Windows you can generate GIF files
  using [LICEcap](http://www.cockos.com/licecap/).
* PNG/GIF images can be uploaded in the same docs repository
  [with a pull request](https://github.com/pixelforge/docs/pulls)

## Reviewing Issues

You can [review issues](https://github.com/pixelforge/pixelforge/issues),
make comments, or create
new [features](https://community.pixelforge.org/c/features),
[bug reports](https://community.pixelforge.org/c/bugs), etc. You are
encouraged to create mockups for any issue you see and attach them.

## Pre-commit hooks

We use [pre-commit](https://pre-commit.com/) as way to set up hooks, you can install it with:

```
pip install pre-commit
pre-commit install
```

If you need to run it manually, use `pre-commit run`.

To run `clang-tidy`, you can use `pre-commit run --hook-stage manual clang-tidy`.
Make sure to check the suggestions and to not apply them arbitrarily, since some might not be 100% applicable to what you're doing.

## Code submission policy

We have some rules for the changes and commits that are contributed:

* First of all you will need to sign our
  [Contributor License Agreement](https://github.com/igarastudio/cla) (CLA)
  to submit your code.
* Split your changes in the most atomic commits possible: one commit
  for feature, or fix.
* Rebase your commits to the `main` branch (or `beta` if you are
  targeting the beta version).
* Wrap your commit messages at 72 characters.
* The first line of the commit message is the subject line.
* Write the subject line in the imperative mood, e.g. "Fix something",
  not "Fixed something".
* For platform-specific commits start the subject line using
  `[win]`, `[osx]`, or `[x11]` prefixes.
* For CLI related commits you can use the `[cli]` prefix in the
  subject line.
* For Lua scripting related commits can use the `[lua]` prefix in
  the subject line.
* Check the spelling of your code, comments and commit messages.
* Follow our [coding style guide](docs/CODING_STYLE.md). We're using
  some C++17 features, targeting macOS 10.14 mainly as the oldest
  platform (and the one limiting us to newer C++ standards),

You can also take a look at the [src/README.md](https://github.com/pixelforge/pixelforge/tree/main/src/#pixelforge-source-code)
guide which contains some information about how the code is structured.

## Pull Request (PR) Assignee

In case you are a developer or contributor with write or triage access
to the repository:

1. The PR assignee is the one that is working on the PR right now.
2. After a PR is sent, you (can) assign the PR to some other developer
   that will act as a reviewer.
   * Or if there is no assignee and the PR is not a draft, some
     developer will take it for review sooner or later.
3. That developer will review the PR (or reassign the PR).
4. When the review process is done, the reviewer will merge the PR or
   reassign the PR to you if it needs some changes.
5. When you have applied the requested changes, you can reassign the
   PR to the last reviewer.
6. If a PR is labeled with some "needs *something*" label, it means
   that the PR will not merged as it is, and *something* is required
   to continue.

With this workflow you can find the PRs assigned to you to
review/continue working in: https://github.com/pulls/assigned

# Community

You can use the [Development category](https://community.pixelforge.org/c/development)
to ask questions about the code, how to compile, etc.
If you want to start working on something
([issue](https://github.com/pixelforge/pixelforge/issues),
[bug](https://community.pixelforge.org/c/bugs),
or [feature](https://community.pixelforge.org/c/features)),
post a comment asking if somebody is already working on that,
in that way you can avoid starting programming in something that is already
done for the next release or which someone else is working on.

# Future

If you want to contribute a new feature, I highly recommend trying to
contribute a couple of pull requests to fix some bugs first. After
that you can check what are the features we're planning for the
future:

* Our [roadmap](http://www.pixelforge.org/roadmap/) and our [planning](https://github.com/orgs/pixelforge/projects/10).
* The most liked [issues on GitHub](https://github.com/pixelforge/pixelforge/issues?q=is%3Aissue+is%3Aopen+sort%3Areactions-%2B1-desc).
* [Features on the forum](https://community.pixelforge.org/c/features/7/l/latest?order=votes) with the most votes.
