# Flutter User Data List App  

A simple Flutter app that fetches and displays a list of users from an API.
Users can be searched and selected to view more details.

# Features  
- Fetch and display user data  
- Search users by name  
- View detailed user information  
- Pull-to-refresh functionality
  
# How the App Works
1. Launch the App
- Upon opening the app, a "Click Here" button is displayed.
- This button fetches user data from the API.
2. Fetching User Data
- Clicking the "Click Here" button retrieves a list of users.
- Each user is displayed as a card with their name and email.
3. Search Users
- A Search Bar is available at the top.
- Typing a name filters the list dynamically to show matching users.
4. View Full User Details
- Clicking on a user's name opens a detailed profile page.
- This page displays:
  Name, Email, Address , Phone Number, Website,Company Name
5. Refresh User List
- A "Refresh Users" button is available at the bottom.
- Clicking this button reloads the user list from the API.
  
# Assumptions & Decisions
- Used Provider for state management: Provider is used to manage state efficiently across the app.
- Fetching data from a mock API: The app simulates fetching user data from a mock API for demonstration purposes.
- Implemented search filtering based on user name: Users can search by name, and the list updates in real time.
- Using Gap for height and width spacing: The gap package is used for consistent and cleaner spacing between UI elements.
