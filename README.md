hugo-cleantype
==============

A theme for `Hugo` focusing on typography and a clean layout.

Put the content forward.


Development Requirements
========================

The following are required for compiling this theme into shippable parts.

1. `less` - compile the CSS
    * in ubuntu repos as `node-less`
2. `cleancss` - minify the compiled CSS
    * in ubuntu repos as `cleancss`
3. `make` - controls the build



Building
========

To build, a simple `make` command should suffice.



Configuration Options
=====================

The following are the available options this theme implements.


## Author

Any time an `author` name is needed, the following are checked:

1. `.Params.author` (page local author)
2. `.Site.Params.author` (site-wide author)
3. `.Site.Author.name` (other site-wide author location)



## Description

In addition to posts having a `description` string, the site can now have its own description.

This is used in the site heading and the `meta` html tag for spiders/robots.

```toml
// config.toml

description = "Description of your site"

```


## Additional JS and/or CSS

Additional JS and/or CSS can be included with the following options:

Local JS/CSS will be served from the `example.com/{css,js}` path as necessary.


#### site-wide

This will include this JS and/or CSS file on every page of the site:

```toml
// config.toml

[params]
    local_css = ["my.css"]
    external_css = ["http://some.external.com/public/my.css"]
    local_js = ["main.js"]
    external_js = ["http://some.external.com/public/some-lib.js"]
```


#### page-specific

This will include this JS and/or CSS file on _only_ this page.

```toml
+++
local_css = ["my.css"]
external_css = ["http://some.external.com/public/my.css"]
local_js = ["main.js"]
external_js = ["http://some.external.com/public/some-lib.js"]
+++
```



## Tags

Tags are considered a taxonomy by this theme.

Therefore, posts can have a `tags = []` array to group posts by tag.


### show tags in posts

In the site's configuration, if the `post_footer_tags` is set to `true`, all tags associated
with the post (if any) are displayed at the end of the post before the copyright footer.

```toml
// config.toml

[params]
    post_footer_tags = true
```




## Syntax Highlighting

This theme ships with CSS capable of highlighting source code using `pygments`.

To do this, add the following to the site config:

```
pygmentsuseclasses = true
PygmentsCodeFences = true
```



Contributing
============

All contributions should be done through pull requests.

Nothing should be committed directly to `master`. Instead, all source (and only source) files should be committed to
the `devel` branch, which `travis` will build and deploy to master so users can rely on only the pre-built files.
