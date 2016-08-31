# Auth API

Authenticate a user's bill credentials via Unbill. This process may take anywhere from 15-90 seconds depending on the responsiveness of the company's website. If a `200` status code is returned, no additional MFA is required. If a `201` status code is returned, additional MFA is required to authenticate with the company and must be submitted via the `/auth/step` endpoint.

![Credentials View](<%= config.s3 %>/credentials-view.png)