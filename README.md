# JobFinder App

JobFinder is a full-stack application designed to help users find job listings efficiently. The project utilizes React Native for the front-end and Django for the back-end.

## Getting Started

### Front-end (React Native)

To set up the React Native front-end, navigate to the project directory and run the following command:

yarn install
# or
npm install
This command installs all the necessary dependencies for the front-end.

### Back-end (Django)
For the Django back-end, you need to install the required Python packages. Run the following commands:


pip install django
pip install django-rest-framework
pip install django-cors-headers
These commands install Django, Django REST framework, and CORS headers.

### Database Setup


If you encounter any issues or want to use a pre-populated database, you can import the provided SQL file jobfinder.sql. Ensure your database is set up and configured in your Django settings before importing. I have explained how to do this below :

Install Xampp
`python manage.py migrate
python manage.py dbshell < jobfinder.sql
Running the Application`


Start the React Native front-end with either of the following commands:


``expo react-native run-android
or
expo react-native run-ios``


To run the Django back-end, use:

python manage.py runserver
Visit the provided URL in your web browser to access the Django admin interface and API endpoints.

Troubleshooting
If you encounter any issues, please check the documentation or feel free to reach out to the project owner.

Additional Notes
The jobfinder.sql file is provided for database setup.
For more detailed instructions, refer to the documentation.
Thank you for using JobFinder! If you have any questions or feedback, don't hesitate to get in touch.
