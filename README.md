# linkyou_task

Below are the details of the implementation:

1- Splash Screen: The application starts with a splash screen to enhance user experience and provide a seamless introduction to the app.

2- Google Login Screen: After the splash screen, users are directed to a Google login screen where Firebase Auth is used for authentication. This ensures secure and efficient user login.

3- User Creation Dialog: Post-login, a dialog box prompts the user to create a profile if one does not already exist. This step ensures that all necessary user information is collected.

4- All Users Screen: Upon successful user creation, the app navigates to an "All Users" screen. This screen displays a paginated list of all users, allowing for efficient data handling and improved performance.

For the business logic of the application, I utilized Cubit, which facilitates state management and ensures a clean separation of concerns, making the application more maintainable and scalable.
