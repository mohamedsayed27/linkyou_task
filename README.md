# linkyou_task

Below are the details of the implementation:

1- Splash Screen: The application starts with a splash screen to enhance user experience and provide a seamless introduction to the app.

![splash](https://github.com/user-attachments/assets/9a4e5df9-e755-4808-ab1a-9426b11847bd)

2- Google Login Screen: After the splash screen, users are directed to a Google login screen where Firebase Auth is used for authentication. This ensures secure and efficient user login.
![googleSign](https://github.com/user-attachments/assets/6e4958bb-cf45-4460-8226-f333fe953b69)

![googlesignaccount](https://github.com/user-attachments/assets/836d1207-51e8-4cfc-8ade-f26f86068c34)

3- User Creation Dialog: Post-login, a dialog box prompts the user to create a profile if one does not already exist. This step ensures that all necessary user information is collected.

![dialog](https://github.com/user-attachments/assets/4e52402e-0232-492f-aefa-c6408d8e27c6)

4- All Users Screen: Upon successful user creation, the app navigates to an "All Users" screen. This screen displays a paginated list of all users, allowing for efficient data handling and improved performance.

![allUsers](https://github.com/user-attachments/assets/9c891999-5391-4dfe-9fcd-6d14b317e3f7)

For the business logic of the application, I utilized Cubit, which facilitates state management and ensures a clean separation of concerns, making the application more maintainable and scalable.
