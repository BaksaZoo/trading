# Trading

This is a demo for a dockerized multi-module web-shop application.

## Install

### 1/0. Explanation (you can skip reading this)

In the JWT token the `iss` (issuer) field is going to be http://keycloak:8080/something, which is just http://localhost:8080/something. 

This is because the modules in the container refer to keycloak services with the `keycloak` domain and swagger also redirects you to this domain.

You could set keycloak url to localhost in application-docker.yaml and swagger would redirect you to keycloak, but your token would be invalid, because spring security can not refer to keycloak with localhost, therefore the `iss` expected value and actual value would differ.

A possible solution would be to set up a DNS server or something, but I really didn't want to overcomplicate things in this small demo.

### 1/A. Windows

Open **CMD** as administrator, and type the following:

```
.\script\add-keycloak-to-hosts.bat
```

Or double-click on the shortcut in `script\runadmin-add-keycloak-to-hosts.lnk`.

### 1/B. Linux

_Coming soon :) maybe_

### 2. Run everything with docker

```
cd docker
docker-compose up -d
```

## Modules

### core

Contains core dependencies, classes, config etc.

### store

Manages products.

You can test the API on [Swagger](http://localhost:8081/swagger-ui/index.html).

### basket

Manages user basket.

You can test the API on [Swagger](http://localhost:8082/swagger-ui/index.html).

### keycloak

Central IAM server.

You can register an account on [Local Keycloak Server](http://localhost:8080/auth/realms/TradingApp/account) to use some of the APIs. (Click **Sign in -> Register**)

To add/update/delete a **product**, you will also need to add `ROLE_ADMIN` to your account manually.

- To do this, log in to [Keycloak Administration Console](http://localhost:8080) with management user (username: `admin`, password: `admin`)
- Navigate  to **Users** and click on **View all users** button, and select the user you want to add admin privileges.
- Click on **Role mappings** tab and then the **Select a client...** and choose **trading-login**
- In **Available Roles** select `ROLE_ADMIN` and click on the **Add selected>>** button

## Using the API with Swagger

If you are on one of the module's swagger page, click on the **Authorize** button.

If you are using only one user, I highly recommend to use `implicit` auth type.
Fill the **client_id** field with `trading-login`, and click on the **Authorize** button again.

If you made different user accounts, you might want to use `password` auth. Here you have to fill the **username**, **password** fields, and also the **client_id** with `trading-login`.

After authenticating, you can use almost all the endpoints, if you only have the default roles.