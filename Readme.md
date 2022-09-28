# PersonalCollection

Supports: iOS 13.x and above

## Branches:

* master - stable app releases

## Dependencies:

The project is using cocoapods for managing external libraries and a Gemfile for managing the cocoapods version.

Get Bundler

```
sudo gem install bundler
```

To install the specific cocoapods version run

```
bundle install
```

Then install the pods

```
bundle exec pod install
```

### Core Dependencies

* R.swift - Get strong typed, autocompleted resources like images, fonts and segues in Swift projects
* SnapKit - Programitacally Constraints Helper
* IQKeyboardManagerSwift - For Managing Keyboard
* ObjectMapper - For Mapping Objects/Models

## Project structure:

* Resources - fonts, strings, images, generated files etc.
* SupportingFiles - configuration plist files
* Models - model objects
* Modules - contains app modules (UI + Code)
* Helpers - protocols, extension and utility classes
