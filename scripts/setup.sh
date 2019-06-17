#!/bin/bash

cd `dirname $0`
bundle install --path vendor/bundle
bundle exec pod install

# bundle exec fastlane ios certificate

