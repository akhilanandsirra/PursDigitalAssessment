# PursDigitalAssessment
This repository contains the source code for a recipe application built using SwiftUI for iOS devices. The application fetches recipe data from a network request using the recipes.json file as a data source. It allows users to view a list of recipes on the main screen along with their respective photos. Tapping on a recipe opens a detailed view (Screen 2) displaying the steps to complete the recipe. Users can also favorite/like different recipes and access a section within the app to view their favorite recipes. The project includes unit tests for the application logic and UI tests using XCUITest framework, including network stubbing for simulating different scenarios like happy path cases and error cases.

Figma Designs: https://www.figma.com/file/jiKIOFYSvYMqXbkxeLA0tK/PursAssessment?type=design&node-id=0%3A1&t=9aDWPVXvtNO8r7o3-1

API: https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json

## Instructions

1. Clone the Github repository onto your local machine. You can use the command line or a Git client like GitKraken to do this. For example, if you have Git installed on your machine, you can run the following command in your terminal:
```[terminal]
git clone https://github.com/akhilanandsirra/PursDigitalAssessment/
```
2. Open Xcode and select "Open a project or file" from the startup screen.
3. Navigate to the folder where you cloned the repository and select the .xcodeproj file.

4. Once the project is open in Xcode, select a device or simulator to run the app on from the top left-hand corner of the Xcode window.

5. Build and run the app by pressing the "Run" button in the top left-hand corner of the Xcode window.

6. If there are any errors or missing dependencies, Xcode will prompt you to install them.

That's it! the iOS app should now be running on the selected device or simulator.

## Highlights

- Developed a recipe browsing application using `SwiftUI`.
- Implemented a networking layer to fetch recipe data from a RESTful API using `URLSession` and asynchronous programming with `async/await`.
- Leveraged `Codable` and `JSONDecoder` to parse and decode recipe data from JSON responses.
- Utilized `UserDefaults` for persistent storage to save and retrieve user's favorite recipes.
- Implemented a Favorites feature allowing users to add and remove recipes from their favorites list.
- Implemented a dynamic and responsive UI using SwiftUI views and layouts.
- Utilized SwiftUI's built-in navigation and list views for easy navigation and display of recipe data.
- Integrated async image loading using `AsyncImage` to display recipe images fetched from URLs.
- Implemented error handling and display of error messages using SwiftUI alerts.
- Created unit tests using `XCTest` for decoding recipe data, networking layer, and favorites functionality.
- Used SwiftUI's `environment object` to share the Favorites object across multiple views.
- Collaborated with a team and followed best practices for code organization, readability, and maintainability.

## Purs.Recipe App

<img src="https://github.com/akhilanandsirra/PursDigitalAssessment/assets/52598978/1874e330-4a68-4426-9e6c-e16cff6f9aed" height="600"/>

## Light/Dark Mode
<img src="https://github.com/akhilanandsirra/PursDigitalAssessment/assets/52598978/aef872e1-0290-42c9-89a2-1b9826f5e555" height="600"/> <img src="https://github.com/akhilanandsirra/PursDigitalAssessment/assets/52598978/4469b91f-d6a3-40d2-b014-6e26c5cf4325" height="600"/>

## Recipes with favorite filter
<img src="https://github.com/akhilanandsirra/PursDigitalAssessment/assets/52598978/9c6bc6b7-0c3f-4c2c-acef-6540e403ca7a" height="600"/>

## Detailed View
<img src="https://github.com/akhilanandsirra/PursDigitalAssessment/assets/52598978/c1809731-cd9e-47e9-a3d7-75ce5f9965f9" height="600"/>
