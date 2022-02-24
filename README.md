# evanm.website

This repository contains the source code of my personal website.

## Development

- `make run` to build and serve the website on localhost:4000
- `make css` to watch Sass files within the `css` directory and
  regenerate CSS files on changes.

## Deployment

- `make push` uploads the website to an S3 bucket and configures a
  CloudFront distribution to serve it using
  [`s3_website`](https://github.com/laurilehmijoki/s3_website)
