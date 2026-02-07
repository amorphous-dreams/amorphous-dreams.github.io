.PHONY: deps submodules-update vendor-gruv-poole vendor-all build serve

deps:
	bundle config set path vendor/bundle
	bundle install

submodules-update:
	git submodule update --init --recursive --remote --rebase

vendor-gruv-poole:
	./scripts/vendor_gruv_poole.sh

vendor-all: vendor-gruv-poole

build: vendor-gruv-poole
	bundle exec jekyll build

serve: vendor-gruv-poole
	bundle exec jekyll serve
