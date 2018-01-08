# evanm.website

This repository contains the source code of my personal website.

## Development

- `make run` to run a Jekyll server on localhost:4000
- `make sass` to watch Sass files within the `css` directory and
  regenerate CSS files on changes.

## Deployment

I use a tool called
[`s3_website`](https://github.com/laurilehmijoki/s3_website) to deploy
the site to a CloudFront'd S3 bucket.
