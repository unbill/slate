## Getting Started

To authenticate bills with your users, you may use the following flow.

### User Creation

1. User signs up in your app.
2. Make a request to the `/user/create` endpoint to retrieve a Unbill `userId` to store in your database for future requests.

### Bill Authentication

1. Search for the company you'd like to add from the `/company/search` endpoint.
2. Provide your user with a "bill authentication" view populated with the login fields retrieved from the desired company.
3. Have your user fill out their credentials, and then send those credentials to the `/auth` endpoint.
4. Unbill will begin the authentication process and if successful, will return available bill data.

### Bill Overview

1. Requests can be made to the `/bill/overview` endpoint to retrieve the list of authenticated bills and balance information.
2. Requests can be made to the `/bill/detail` endpoint to retrieve details on a specific bill.

### Payments

1. Provide your user with a "link payment" view to choose a payment method.
2. Link this payment method to Unbill using the `/payment/add` endpoint.
3. By default, bills will be paid automatically by using the payment method on file.
4. To change this, you must make a request to the `/payment/autopay` endpoint to disable autopay.
5. When autopay is disabled, in order to make a payment, one must be scheduled via the `/payment/make` endpoint.