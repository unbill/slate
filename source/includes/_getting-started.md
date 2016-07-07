# Getting Started

To authenticate billers with your users, you may use the following flow.

## User Creation

1. User signs up in your app.
2. Make a request to the `/user/create` endpoint to retrieve a Unbill `userId` to store in your database for future requests.

## Biller Authentication

1. Search for the biller you'd like to add from the `/biller/search` endpoint.
2. Provide your user with a "biller authentication" view populated with the login fields retrieved from the desired biller.
3. Have your user fill out their credentials, and then send those credentials to the `/biller/auth` endpoint.
4. Unbill will begin the authentication process and if successful, will return available bill data.

## Biller Overview

1. Requests can be made to the `/biller/list` endpoint to retrieve billers and balance information.
2. Requests can be made to the `/biller/overview` endpoint to retrieve details on a specific biller.

## Payments

1. Provide your user with a "link payment" view to choose a payment method.
2. Link this payment method to Unbill using the `/payment/add` endpoint.
3. By default, bills will be paid automatically by using the payment method on file.
4. To change this, you must make a request to the `/biller/settings/auto-pay` endpoint to disable autopay.
5. When autopay is disabled, in order to make a payment, one must be scheduled via the `/biller/make-payment` endpoint.