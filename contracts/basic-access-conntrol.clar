;; Contract Name: basic-access-control
;; Description: Skeleton for a Clarity smart contract with user registration, data management, and admin-controlled actions.

;; -------------------------------
;; 1. Data Definitions
;; -------------------------------

;; Map to store user information
(define-map users
  {user: principal}           ;; Key: user principal
  {data: (string-ascii 100)}) ;; Value: user-specific data

;; Contract admin
(define-data-var admin principal tx-sender) ;; Admin is set to deployer

;; -------------------------------
;; 2. Public Functions
;; -------------------------------

;; Register a new user with some data
(define-public (register (user-data (string-ascii 100)))
  (begin
    ;; Fixed tuple syntax - use {key: value} format instead of nested parentheses
    (map-set users {user: tx-sender} {data: user-data})
    (ok true)
  )
)

;; Update the sender's data
(define-public (update-data (new-data (string-ascii 100)))
  (begin
    ;; Fixed tuple syntax
    (map-set users {user: tx-sender} {data: new-data})
    (ok true)
  )
)

;; Admin-only function: reset a user's data
(define-public (reset-user (target principal))
  (if (is-eq tx-sender (var-get admin))
      (begin
        ;; Fixed tuple syntax
        (map-set users {user: target} {data: ""})
        (ok true))
      (err u100) ;; Error: Not authorized
  )
)

;; -------------------------------
;; 3. Read-Only Functions
;; -------------------------------

;; Get data of a specific user
(define-read-only (get-user-data (user principal))
  ;; Fixed tuple syntax for map-get?
  (default-to "" (get data (map-get? users {user: user}))))

;; Get the contract admin
(define-read-only (get-admin)
  (var-get admin))
