@v1 @queries_in_enketo_forms
Feature: Ability to add a query to an item in an Enketo form

AC1: A flag icon appears next to each item during initial data entry.
AC2: A flag icon appears next to each item during editing.
AC3: A flag icon appears next to each item in view mode.
AC4: There is only one flag icon per item.
AC5: Clicking on the icon (in data entry, edit, or view) opens a widget containing query information.
AC6: Must be able to add multiple queries to a single item.

  Scenario: Entering a query
    Given I am entering, editing, or viewing data
     When I click on the flag next to an item
     Then An widget opens where I can enter a query.
  
https://github.com/kobotoolbox/enketo-express/issues/478
  
@v1 @queries_in_enketo_forms
Feature: Query status must be indicated in the Enketo form.
  
AC1: The flag icon must indicate the status of the query.
AC2: The statuses are as follows: None, Updated, Closed
AC3: By default, meaning an item doesn't have any queries, status = 'None'
  
  Scenario: Status indicated in data entry mode
    Given I am a CRC entering data
     When I am entering a value for an item
     Then I want to be able to easily see if there are queries for that item.
  
  Scenario: Status indicated in view mode
    Given I am a monitor reviewing a form
     When I review each item
     Then I want to be able to easily see the status of queries for that item.

@v1 @ocqw
Feature: Submitting the first query automatically sets query status to 'New'

AC1: 'Submit' button is available only if there are existing queries for an item.
AC2: Clicking 'Submit' automatically changes status of query to 'New'

See mockup "OCQueries_Submit_New"
  
  Scenario: Query Status = New
    Given I am a CRC entering data
     When I enter a query on an item
     And that item does not have any existing queries
     And I click 'Submit'
     Then the query status = 'New'

@v1 @ocqw
Feature: Updating a query automatically sets query status to 'Updated'

AC1: 'Update' button is available only if there are existing queries for an item.
AC2: Clicking 'Update' automatically changes status of query to 'Updated'

See mockup "OCQueries_Update_Close"
  
  Scenario: Query Status = Updated
    Given I am a CRC entering data
     When I enter a query on an item
     And that item has at least one exisiting query
     And I click 'Update'
     Then the query status = 'Update'
     
@v1 @ocqw 
Feature: Closing a query automatically sets query status to 'Closed'

AC1: 'Close' button is available only if there are existing queries for an item.
AC2: Clicking 'Close' automatically changes status of query to 'Closed'

See mockup "OCQueries_Update_Close"
  
  Scenario: Query Status = Closed
    Given I am a CRC entering data
     When I enter a query on an item
     And that item has at least one exisiting query
     And I click 'Close'
     Then the query status = 'Closed'

@v1 @ocqw
Feature: Confirmation message displayed after query is entered

AC1: Submitting a query should display a confirmation message before automatically closing.
AC2: Updating a query should display a confirmation message before automatically closing.
AC3: Closing a query should display a confirmation message before automatically closing.

  Scenario: Query widget close
    Given I am a CRC entering data
     When I enter a query on an item
     And that item has at least one exisiting query
     And I click 'Close'
     Then the query status = 'Closed'

@v1 @ocqw
Feature: Query widget should automatically close after query is entered

AC1: Submitting a query should automatically exit the query widget.
AC2: Updating a query should automatically exit the query widget.
AC3: Closing a query should automatically exit the query widget.

  Scenario: Query widget close
    Given I am a CRC entering data
     When I enter a query on an item
     And that item has at least one exisiting query
     And I click 'Close'
     Then the query status = 'Closed'

@v1 @ocqw 
Feature: Item text must be visible while query widget is open.
  
  Scenario: View item and value/response in widget
    Given I want to enter a query
     When I open the query widget
     Then I must be able to see the current item text.
	 
@v1 @ocqw
Feature: Item value or response must be visible while query widget is open.
  
  Scenario: View item and value/response in widget
    Given I want to enter a query
     When I open the query widget
     Then I must see the current value or response(s).
  
@v1 @ocqw
Feature: Query status must be indicated in the query widget.
  
AC1: The flag must be displayed in the widget.
AC2: The flag must indicate the status of the query.
AC3: The statuses are as follows: None, New, Updated, Closed 
  
  Scenario: View query status in widget
    Given I want to enter a query
     When I open the query widget
     Then I must see the current query status.
  
@v1 @ocqw
Feature: Assign query to another user.
  
AC1: Dropdown list must appear under the query text area.
AC2: Dropdown list must contain a list of full names of users assigned to the current Site.
AC3: Query is assigned to the selected user once the query is submitted.
AC4: Query remains assigned to that user until it is either re-assigned to another user or closed.
  
  Scenario: Assign query to another user
    Given I am entering a query
     When I select a user from a provided list
      And I submit the query
     Then the query should be assigned to that user until the query is re-assigned to another user or closed.
  
@v1 @ocqw
Feature: Option to email another user.
  
AC1: Checkbox should appear next to the dropdown of user's names.
AC2: By default, the checkbox is not selected.
AC3: Selecting the checkbox will send a notification, via email, to the selected user.
AC4: Notification is sent once the query is submitted.
  
  Scenario: Notify user
    Given I am entering a query
     When I select a user from a provided list
      And I select the checkbox 'Notify?'
      And I submit the query
     Then the selected user should receive an email message that a query has been assigned to them.
  
@v1 @ocqw
Feature: Query text area is pre-populated with any CRF validation(s).
  
AC1: Query text area is a free text field.
AC2: Query text area is prepopulated with any constraint error messages that the user triggered during data entry.
AC3: Query text area is editable.
  
  Scenario: Prepopulated text field
    Given I am entering a query
     When I open the query widget
      And I have triggered an error message
     Then the query text area should be prepopulated with that error message.
  
@v1 @queries_in_enketo_forms @ocqw
Feature: Ability to submit a query without saving the form.
  
AC1: The flag appears next to each item in view.
AC2: Clicking on the icon in view mode opens an widget containing query information.
AC3: A query can be submitted in view mode (even if the form is not saved).
  
  Scenario: Monitor submits query
    Given I am a monitor viewing a form
     When I submit a query
     Then the query should be saved, even though I did not save the form.
  
@v1 @ocqw
Feature: Query History is displayed in widget
  
AC1: Header 'History' appears under the query text area.
AC2: History displays the following: Event, User, Last Updated
AC3: An 'Event' can be either a query or an audit event.
AC4: Events are displayed in reverse chronological order.
AC5: By default, 'History' is expanded and shows the most recent 3 events.
AC6: Option to 'View More' is displayed after the most recent 3 events. 
AC7: Clicking 'View More' shows all events for the item.
  
@v1 @ocqw
Feature: Audit History is displayed under 'History' Header
  
AC1: An icon appears next to each audit event.
AC2: The audit event description is displayed next to the icon.
AC3: The audit event description must use the following format: "Value updated form X to Y."
  where 'X' represents the previous value and 'Y' represents the new value.
AC4: The audit event description should wrap.
AC5: The audit event description should use elipses (...) if it is long.
AC6: Clicking on the elipses expands the audit description.
AC7: 'User' must display the full name of the user that updated the value (caused the audit event).
  
As a data entry person or monitor entering a query,
I want to be able to see the audit history for the item
So I know what values/responses have been entered for the item.
  
@v1 @ocqw
Feature: Query History is displayed under 'History' Header
  
AC1: An icon appears next to each query.
AC2: The query description is displayed next to the icon.
AC3: The query description should wrap after X characters.
AC4: The query description should use elipses (...) if it is long.
AC5: Clicking on the elipses expands the query description.
AC6: 'User' must display the full name of the user that submitted the query.
  
As a data entry person or monitor entering a query,
I want to be able to see any other queries that have been entered for that item
So I know what has already been entered for the item by other users.
  
@v1 @ocqw
Feature: Query widget can be closed

AC1: An 'X' or close icon is displayed in the widget.
AC2: User can click the close icon to close the widget.

  Scenario: Close query widget
    Given I have opened the query widget
     When I click the close icon
     Then the widget is closed. 

@v1 @ocqw
Feature: The OC query widget should support mobile phone view

AC1: The query widget should be responsive.
AC2: User can enter query on a mobile phone.
AC3: User can view history on a mobile phone.
AC4: User can assign query to another user on a mobile phone.
AC5: Uwer can select checkbox to notify another user on a mobile phone.

  Scenario: Use Query widget on mobile phone
    Given I am a data entry person
     When I am entering data on my mobile phone
     Then I should be able to enter a query for an item.

@v1 @ocqw
Feature: Query widget should be supported in all major web browsers.

AC1: User can view query widget on IE 11.
AC2: User can view query widget on Mozilla Firefox.
AC3: User can view query widget on Google Chrome.

@v1 @enketo_forms_as_oc_forms
Feature: Send batch information with submission 

AC1: User should be able to upload a file to an Enketo form that is greater than the configured file size.
AC2: User should be able to submit an Enketo form with an attached file that is greater than the configured file size.
 
 Scenario: Use Query widget on mobile phone
    Given I am a person uploading files to a form
     When I upload a file greater than the configured file size
     Then I want to be able to save these files regardless of file size and setting.
	
https://github.com/kobotoolbox/enketo-express/issues/501

@v1
Feature: Support for dynamic external data
In order to support consuming dynamic data from external sources
As a person entering data into a form
I want to consume options with a context I provide when I load the form

@v1 @enketo_forms_as_oc_forms
Feature: Enketo form will auto save

As a data entry person
I want the values I enter to be automatically saved
So that I don't loose any data.

  Scenario: 
    Given I am a data entry person
     When I am entering values into an Enketo form
     Then the form should autosave
