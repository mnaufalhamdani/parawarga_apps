# parawarga_apps

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Step for editing this project
- Clone project from git
- Open Android Studio -> Open Settings
- Choose 'Language and Frameworks' -> Dart -> Enable Dart Support
- Choose 'Language and Frameworks' -> Flutter -> Flutter SDK Path
- Save
- Open terminal in Android Studio
- 'flutter clean' -> 'flutter pub get' -> 'flutter pub upgrade'

### File Structure
A High-level overview of the project structure:
```

lib/                     # Root Package
|
├─ data/                 # For data handling
│  ├─ mock/              # sample used for testing
│  ├─ models/            # Objects representing data
│  ├─ repositories/      # Source of data
|
├─ redux/                # manages app state
│  ├─ component/         # app building block
│     ├─ actions         # methods to update app state
|     ├─ middleware      # run in response to actions, execute before reducer
|     ├─ reducer         # intercepts actions, responsible for updating the state
|     ├─ selectors       # read data from the state, queries against your 'state database'
|     ├─ state           # immutable object that lives at the top of the widget hierarchy
|
├─ ui/                   # app views
│  ├─ component/         # views for different components
│    ├─ view/            # generel view for component
│    ├─ edit/            # change values on the views fields
|
├─ utils/                # Utility classes

```
