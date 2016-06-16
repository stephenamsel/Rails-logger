# Rails-logger
This is a Rails website designed to demonstrate a component for logging transactions and aggregating information. It gives a framework where different users can log in an register loans in a database with the amount borrowed and the due-date of the loan. Once logged in, They can also see which users have made changes to their loans, searching by date-ranges, by number of changes, and by exactly what value they want to track. Users may also set one of two conditions for listing: The user must have made more than a certain number of changes to the field within the time-range overall, or must have done so for a single loan. The output is the email address of the user and number of edits made to the field, with one row per user in the first case and one row per flagged record in the second. For the moment, the old and new values of the changed fields have no impact on reporting, but that flexibility is kept in the code. Additional information, like information regarding the individual record changed when the logs are checked by record rather than just user, may also be easily added to the report.

A secure login-setup is in the Sessions Helper. For modules that are only accessible to logged in users, please see how this works with the Loans contorller and Application controller. Essentially, once the user authenticates at log-in, a " current_user " is defined and identifying information is stored in a cookie. If that information is absent while trying to access a page which requires a logged in user, then the user is redirected to the homepage.

Navigation is handled through a header partial under views/layout.

The interesting code for logging is in the model TransactionLogger and in the code snippet under lib/logging which must be included in any model where changes must be logged. This requirement for a explicit inclusion is deliberate: When reading a model's code, it is always better to be able to see immediately from where it draws any non-standard methods and where they come into the code. The logger tracks the ID of the user who made the change, the model where the data is changed, the name of the field, and the old and new values of the changed field, and is timestamped by its Rails-standard created_at field. The conditions for logging are handled within the model for the data where changes are to be logged. In this example for demonstrative purposes, only edits to loans are logged and not the creation of new ones. Switching the callback from before_update to before_save would track everything.


