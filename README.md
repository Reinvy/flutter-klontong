# Klontong - Mobile Project

**Klontong** is a mobile application designed to help a small convenience store enter the digital age by selling their products online. This project simulates a basic CRUD (Create, Read, Update, Delete) application, where product management is the core feature.

---

## Overview

As a family member of the convenience store owner, the task is to manage and display products in a structured, digital format. From a technical perspective, this is a CRUD application, but since the backend development is delayed, the project uses a mocked API to demonstrate the functionality.

## Project Stack

- **Flutter**
- **State Management:** Provider
- **API Mocking:** [crudcrud.com](https://crudcrud.com/)
- **Image Storage:** Firebase Storage (temporary credentials for testing)
- **Unit Testing:** Mocktail

---

## Features

1. **List Products with Search & Pagination**  
   The product list supports search and infinite scroll pagination. The technique used ensures smooth data loading as users scroll through products.

2. **Product Details**  
   Each product has a detailed page showing its name, description, category, weight, dimensions, image, and price.

3. **Add Product**  
   You can add new products through the mobile app interface, with fields such as name, description, price, SKU, and category. Images uploaded by users are stored in **Firebase Storage**.

---

## Data Schema

The product data follows a consistent schema:

```json
{
  "id": "86",
  "CategoryId": "14",
  "categoryName": "Cemilan",
  "sku": "MHZVTK",
  "name": "Ciki ciki",
  "description": "Ciki ciki yang super enak, hanya di toko klontong kami",
  "weight": 500,
  "width": 5,
  "length": 5,
  "height": 5,
  "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
  "harga": 30000
}
```

**Note:** The `id` and `categoryId` fields in the schema are of type string rather than integer. This is because the [crudcrud.com](https://crudcrud.com/) API provides IDs in string format only.

---

## Firebase Storage

The project uses **Firebase Storage** to store images uploaded by users. The Firebase credentials currently in use are temporary and meant for testing purposes only. They may need to be updated in the future to more secure and permanent credentials.

---

## Mock API

This project uses the [crudcrud.com](https://crudcrud.com/) API as a mock service during development. Since this service is limited to a 1-day lifespan for the free API, you will need to regenerate the API endpoint URL daily.

### API Regeneration Steps:

1. Open a new **Incognito Mode** browser session.
2. Visit [crudcrud.com](https://crudcrud.com/).
3. Generate a new API endpoint and update it in your project.

**Important Note:** When regenerating the API, you will need to create a list of categories before adding products. This can be done using Postman with the following endpoint:

- **Endpoint:** `newAPI/category` (`https://crudcrud.com/api/3545058bb29a411fbf8fba294ecac766/category`)
- **Method:** POST
- **Body:** JSON format with values like the example below:

```json
{
  "name": "Cemilan"
}
```

This step is necessary as product data requires category information.

---

## Unit Testing

This project has been unit tested using the **Mocktail** library to ensure that the code is reliable and that each part of the app functions correctly. Testing focused on mocking the API interactions and verifying the state management logic.

---

## How to Run the Project

1. Clone the repository.
2. Update the `baseUrl` in the code with your generated [crudcrud.com](https://crudcrud.com/) endpoint.
3. Run the project using `flutter run`.

---

## Pagination Strategy

The project implements **infinite scroll** pagination to manage around 100 products efficiently. As users scroll through the product list, new data is fetched automatically from the API.

---

## Internationalization

This project is developed in English to accommodate the diverse, international development team.

---

## License

This project is licensed under the MIT License.

```
This version adds the clarification that the Firebase credentials are for testing and may need to be changed in the future.
```
