Basic Access Control Smart Contract

Overview
`basic-access-control` is a Clarity smart contract designed for the Stacks blockchain.  
It provides a simple framework for user registration, data management, and admin-controlled operations.  
The contract is scalable and can be extended to support additional functionality like token management, vaults, or NFTs.

---

Features

- **User Registration**: Users can register with custom data.  
- **Data Management**: Users can update their own data.  
- **Admin Control**: The admin can reset any user's data.  
- **Read-Only Queries**: Check user data and retrieve the admin.  
- **Error Handling**: Unauthorized actions return a clear error code (`u100`).  

---

Data Structures

- `users` (map): Stores user data, keyed by user principal.  
- `admin` (data-var): Stores the contract admin (deployer).  

---

Functions

Public Functions
- `register(user-data)` – Register a new user with custom data.  
- `update-data(new-data)` – Update the sender's own data.  
- `reset-user(target)` – Admin-only function to reset a user's data.  

Read-Only Functions
- `get-user-data(user)` – Retrieve a specific user's data.  
- `get-admin()` – Retrieve the contract admin.  

---

Deployment

1. Install [Clarity CLI](https://docs.stacks.co/docs/develop/clarity/clarity-cli).  
2. Compile the contract:
   ```bash
   clarity-cli check ./basic-access-control.clar
