# Email Tracker

Email tracker completely replace your need for SendGrid, completely! 
<i>This is sarcasm</i>

## How it works

EmailTracker allows a user to generate a uniq image path that can be dropped in to an email and sent to an unexpected recipient. 
When the recipient's email client loads the message and by extension the image a "open" event will be registered by EmailTracker. 
The image that is included is only visible on the site that EmailTracker is hosted, this is to make it easy to drag and drop into
the body of your email, it will not be visible to the recipient.

## Limitations

> "Not all email clients load images by default. Microsoft’s Outlook, Apple’s Mail.app, Mozilla’s Thunderbird, and Google’s Gmail do not load images. As such, there may be many occasions where recipients will have received a message, opened it, and it will never be counted as opened because there is no way to track the event."
>
>  Source: [SendGrid docs](https://sendgrid.com/docs/Glossary/opens.html)