# TheCloudLock

Supports: iOS 10.x and above
Xcode: 11.2.1

## Branches:

* master - stable app releases
* develop - development branch, merge your feature branches here

## Dependencies:

The project is using cocoapods for managing external libraries and a Gemfile for managing the cocoapods version. Before downloading the gems, it is recommended that you install rbenv.

Get Rbenv

```
brew install rbenv
```

Setup Rbenv

```
rbenv init
```

Add line below to your ~/.bash_profile

```
eval "$(rbenv init -)"
```

Get Bundler

```
sudo gem install bundler
```

To install gem dependencies run

```
bundle install
```

Then install the pods

```
bundle exec pod install
```

### Core Dependencies

* Swiftlint - A tool to enforce Swift style and conventions.
* R.swift - Get strong typed, autocompleted resources like images, fonts and segues in Swift projects

## Project structure:

* Resources - fonts, strings, images, generated files etc.
* SupportingFiles - configuration plist files
* Models - model objects
* Modules - contains app modules (UI + Code)
* Helpers - protocols, extension and utility classes
