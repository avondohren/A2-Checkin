#A2 Checkin

##Overview
The A2 Checkin program was created to help facilitate checkin during events at the Acts2 Church in Gretna, NE. It works by creating events and then looking up registered families by having them type in thier phone number. A list of children that belong to that family is presented to the user. They confirm which children are present on that day and add records in the database to keep an accurate history of past events.

##Usage
The A2 Checkin program relies on a privileged user to first login to the system. They can either create a new event, or select a previously created application. Once an Event has been activated, they select the *checkin* link from the top menu. This starts the checkin workflow.

Once in the checkin workflow. A new family would select the "*Create New Family*" link. They are prompted for information related to their family. This includes phone number, email, parent information, and child information. They get redirected to a confirmation screen which instructs the user to check the box next to any child that is present that day and click the "Check In" button.

If a family has already registered, they simply provide the families phone number and click "Check In". They are presented with the same confirmation page as before, selecting the children that are in attendance today and click "Check In".

##Admin Options
Admins of the system are given the following abilities:
 - Create and Activate Events
 - See attendance metrics from past Events
 - Create and Edit family information
 - Email families that attended an event to distribute summaries and activities to parents
 
##Future Enhancements
This is a list of enhancements I would like to add:
 - Print a name tag for each present child using a Dymo label printer
 - Assign Roles to Events, and assign a specific volunteer to fill the role
 - Add ability to communicate with volunteers and distribute teaching material
