run: ## Run a local web server
	JEKYLL_ENV=dev bundle exec jekyll serve

css: ## Watch for Sass changes
	bundle exec sass --watch css:css

push: ## Build and push website to S3
	JEKYLL_ENV=prod bundle exec jekyll build
	bundle exec sass css/screen.sass css/screen.css
	. ~/.aws/profiles/evanm_website_s3_website && s3_website push

clean: ## Remove all generated files
	rm css/screen.css
	rm -r _site

help: ## Show this help message
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: run css push
