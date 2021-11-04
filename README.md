# Blog App

![Microverse](https://img.shields.io/badge/Microverse-blueviolet)

> The Blog app will is a classic blog website,that shows the list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With

- Ruby on Rails
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails & Postgres](https://www.howtoforge.com/tutorial/ubuntu-ruby-on-rails/?fbclid=IwAR3G0lCOxctwwOCAXmJKAma8p-IciYv2qwwRUyOX-pULaB_7lmrGgMMK8G4)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine

```sh
git clone git@github.com:andersonlebon/blogApp.git
~ cd blogApp

```

### Development Database

```sh
# Go Postgres shell user
 sudo -i -u postgres psql
```

```sh
 - rails db:setup
 and then run
-  rails db:migrate

```

```sh
# Create a user with password
create user "user_name" with password 'user_password';

```

### Install

```sh
bundle install
```

### Run

```sh
rails s
```

### Test

```sh
rspec
```

## Authors

👤 **Anderson Caleb**

- GitHub: [@Andersonlebon](https://github.com/andersonlebon)
- Twitter: [@BuyananaCaleb](https://twitter.com/BuyananaCaleb)
- LinkedIn: [Anderson Caleb](https://www.linkedin.com/in/anderson-caleb-915343209/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## License

[MIT](./LICENSE)
