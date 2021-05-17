Welcome to my project on the Rick and Morty API

The project uses combine for the API calls and displays the information with a SwiftUI front end.

The Networking.swift class provides generic functions to return the 3 main types of data provided by the API. Results are cached to prevent unnecessary duplicate API calls. Combine simplified the networking code and providing the data to the UI. Combine also makes it easy to switch the data source/type if this becomes necessary. Image loading was split out into several separate classes to facilitate possible replacement if a more streamlined option becomes available.

Reusable views were created for the data types which can be combined in whatever way necessary.

Several images were downloaded and included with the project. This was to ensure that there was an image available for the splash screen and intro even if the connection was slow or non-existent.

Future improvements:

Navigation needs to be improved. The typical iOS navigation  lets you go back through all previous screens is not appropriate for this project. It should retain a small number of screens for backward navigation, but most of the time if the user is going back more than a few steps they will be trying to return to the main/starting/root screen. This needs to be implemented to improve the user experience. 