# Practices for the development of secure software

## Description

"Practices for the development of secure software" is a project focused on implementing secure software development practices.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

## Requirements
- Node version: [`v18.x.0`](https://nodejs.org/)
- Package manager: [`npm`](https://npmjs.com/)

## Installation

### API (ExpressJS)
1. Navigate to the api project directory:

   ```bash
   cd Osnove-informacione-bezbednosti/app
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

## Usage

To start the development server, run:

```bash
npm run startdev
```

This command will start the server locally and make it accessible at `http://localhost:port`. Replace `port` with the appropriate port number specified in your environment variables.

-------------------

## API Endpoints

Following API endpoints are available:

### Users

- `POST /api/user/create`: Creates a new user. Requires `uid`, `email`, `firstName`, `lastName`, `date`, and `u_role` in the request body. Returns status codes and payload based on user creation.
- `POST /api/user/newAccount`: Creates a new user account in the Firebase Authentication database and Firestore. Requires `uid`, `userProperties`, and `userData` in the request body. Responds with status codes and payload based on the account creation process.
- `POST /api/user/getById`: Retrieves user details by UID. Requires `uid` in the request body. Returns user data or appropriate error messages.
- `POST /api/user/getRoleByUid`: Retrieves the role of a user by UID. Requires `uid` in the request body. Responds with the user's role or error messages.
- `POST /api/user/get`: Retrieves all users. Requires appropriate authorization (e.g., admin role) to access. Returns user data or permission error.
- `POST /api/user/updatePicture`: Updates a user's profile picture. Requires `uid` and `photoBase64` in the request body. Responds with success status or errors.
- `POST /api/user/update`: Updates a user's profile. Requires `uid`, `firstName`, `lastName`, and `date` in the request body. Returns updated user data or error messages.
- `POST /api/user/update/admin`: Allows an admin to update user data. Requires `uid` and `data` in the request body. Responds with success status or errors.
- `POST /api/user/delete`: Deletes a user's account. Requires `uid` in the request body. Responds with deletion status or errors.
- `POST /api/user/delete/guid`: Allows an admin to delete a user account by UID. Requires `uid` in the request body. Responds with deletion status or errors.

### Roles

- `GET /api/roles/get`: Retrieves all roles. Requires appropriate permissions to access. Returns role data or permission error.

### Products

- `GET /api/products/get`: Retrieves all products. Requires appropriate permissions to access. Returns product data or permission error.
- `POST /api/products/getProductsPerSellerUid`: Retrieves products associated with a specific seller UID. Requires `uid` in the request body. Returns product data or permission error.
- `POST /api/products/create`: Creates a new product. Requires various product details in the request body. Responds with creation status or errors.
- `POST /api/products/update`: Updates a product's details. Requires updated product information in the request body. Responds with updated product data or errors.
- `POST /api/products/delete`: Deletes a product. Requires `uid` in the request body. Responds with deletion status or errors.

### Orders

- `POST /api/orders/create`: Creates a new order. Requires `buyQuantity`, `buyerUid`, and `product` in the request body. Responds with order creation status or errors.
- `POST /api/orders/getOrdersPerBuyer`: Retrieves orders for a specific buyer UID. Requires `uid` in the request body. Returns order data or permission error.
- `POST /api/orders/get`: Retrieves all orders. Requires appropriate permissions to access. Returns order data or permission error.

### Genres

- `GET /api/genres/get`: Retrieves all genres. Requires appropriate permissions to access. Returns genre data or permission error.

### Audits

- `POST /api/audits/create`: Creates a new audit. Requires `messageType` and `message` in the request body. Responds with audit creation status or errors.
- `POST /api/audits/get`: Retrieves all audits. Requires appropriate permissions to access. Returns audit data or permission error.

### Miscellaneous

- `ANY /(.*)`: Redirects to the main application or handles unmatched routes.

Each endpoint performs specific actions and requires certain parameters in the request body. It responds with relevant data or error messages based on the operation performed.

## Contributing

Contributions are welcome! If you find any issues or would like to enhance the project, feel free to create a pull request or report an issue in the [Issues](https://github.com/Vukajlo01/Osnove-informacione-bezbednosti/issues) section.

## License

This project is licensed under the [MIT LICENCE] License - see the [LICENSE](LICENSE) file for details.
