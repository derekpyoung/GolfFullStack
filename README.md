# Golf Betting Tracker

A Rails application for tracking golf rounds and betting between players.

## Overview

This application allows users to:
- Create and manage golf rounds with betting parameters
- Track individual player performance per round
- Record holes won, closest to pin (KP), longest drive (LD), and scores
- Manage user accounts with secure authentication

## System Requirements

- **Ruby version**: 3.0.3
- **Rails version**: 7.0.3
- **Database**: PostgreSQL

## Setup Instructions

### 1. Install Dependencies

```bash
bundle install
```

### 2. Database Setup

Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### 3. Start the Server

```bash
rails server
```

Visit `http://localhost:3000` in your browser.

## Database Schema

### Users
- `name`: Player name (stored lowercase)
- `email`: Unique email address (stored lowercase)
- `password_digest`: Encrypted password using bcrypt

### Rounds
- `course`: Golf course name
- `bet_per_hole`: Bet amount per hole won
- `bet_per_kp`: Bet amount for closest to pin
- `bet_per_ld`: Bet amount for longest drive

### UserRounds (Join Table)
- `user_id`: Reference to user
- `round_id`: Reference to round
- `holes_won`: Number of holes won
- `kp_won`: Number of closest to pin wins
- `ld_won`: Number of longest drive wins
- `splits`: Number of split holes
- `score`: Player's score for the round

## Features

- **User Authentication**: Secure signup/login with encrypted passwords
- **Round Management**: Create, view, update, and delete golf rounds
- **Performance Tracking**: Record and view individual player statistics
- **Betting Calculation**: Track bets per hole, KP, and LD

## Routes

### Authentication
- `GET /signup` - New user registration form
- `GET /login` - Login form
- `POST /login` - Create session
- `DELETE /logout` - Destroy session

### Users
- `GET /users` - List all users
- `GET /users/:id` - Show user profile
- `POST /users` - Create new user
- `PATCH /users/:id` - Update user
- `DELETE /users/:id` - Delete user

### Rounds
- `GET /rounds` - List all rounds
- `GET /rounds/:id` - Show round details
- `POST /rounds` - Create new round
- `PATCH /rounds/:id` - Update round
- `DELETE /rounds/:id` - Delete round

### User Rounds
- `GET /user_rounds` - List all user rounds
- `GET /user_rounds/:id` - Show specific user round
- `POST /user_rounds` - Create new user round entry
- `PATCH /user_rounds/:id` - Update user round
- `DELETE /user_rounds/:id` - Delete user round
- `GET /user_rounds/current/:id` - View all players in a specific round

## Running Tests

```bash
rails test
```

## Development Notes

- All email addresses and names are automatically converted to lowercase
- Foreign key constraints ensure data integrity
- Deleting a user or round will automatically delete associated user_rounds
- Strong parameters are enforced for security
