# Ruby on Rails PostgreSQL Example Application on Clever Cloud

[![Clever Cloud - PaaS](https://img.shields.io/badge/Clever%20Cloud-PaaS-orange)](https://clever-cloud.com)

This is a minimal Ruby on Rails application that demonstrates how to deploy a RESTful blog with PostgreSQL on Clever Cloud.

## About the Application

This application is a simple blog engine based on the [Rails Getting Started guide](https://guides.rubyonrails.org/getting_started.html). It provides:

- `/` - Welcome page
- `/articles` - CRUD for articles (create, read, update, delete)
- `/articles/:id/comments` - Nested comments on articles

Write operations are protected by HTTP Basic Authentication (username: `admin`, password: `admin`).

## Technology Stack

- [Ruby on Rails](https://rubyonrails.org) 8.0 - Full-stack web framework
- [PostgreSQL](https://www.postgresql.org) - Relational database
- [Puma](https://puma.io) 6+ - A fast, concurrent web server for Ruby
- [Propshaft](https://github.com/rails/propshaft) - Asset pipeline for Rails
- [Turbo](https://turbo.hotwired.dev) - SPA-like page navigation
- Ruby 3.3+

## Prerequisites

- Ruby 3.3+
- Bundler
- PostgreSQL

## Running the Application Locally

```bash
bundle install
bin/rails db:prepare
bin/rails server
```

The application will be accessible at http://localhost:3000.

## Deploying on Clever Cloud

You have two options to deploy your Rails application on Clever Cloud: using the Web Console or using the Clever Tools CLI.

### Option 1: Deploy using the Web Console

#### 1. Create an account on Clever Cloud

If you don't already have an account, go to the [Clever Cloud console](https://console.clever-cloud.com/) and follow the registration instructions.

#### 2. Set up your application on Clever Cloud

1. Log in to the [Clever Cloud console](https://console.clever-cloud.com/)
2. Click on "Create" and select "An application"
3. Choose "Ruby" as the runtime environment
4. Configure your application settings (name, region, etc.)

#### 3. Add a PostgreSQL add-on

1. In your application settings, go to "Service dependencies"
2. Click "Link add-ons to this application"
3. Select "PostgreSQL" and choose a plan
4. The database connection environment variables (`POSTGRESQL_ADDON_*`) will be set automatically

#### 4. Configure Environment Variables

Add the following environment variables in the Clever Cloud console:

| Variable | Value | Description |
|----------|-------|-------------|
| `CC_RACKUP_SERVER` | `puma` | Rack server to use |
| `SECRET_KEY_BASE` | *(generate one)* | Rails secret key for encrypted sessions |

> **Note:** Generate a `SECRET_KEY_BASE` by running `bin/rails secret` locally.

#### 5. Deploy Your Application

You can deploy your application using Git:

```bash
# Add Clever Cloud as a remote repository
git remote add clever git+ssh://git@push-par-clevercloud-customers.services.clever-cloud.com/app_<your-app-id>.git

# Push your code to deploy
git push clever master
```

### Option 2: Deploy using Clever Tools CLI

#### 1. Install Clever Tools

Install the Clever Tools CLI following the [official documentation](https://www.clever-cloud.com/doc/clever-tools/getting_started/):

```bash
# Using npm
npm install -g clever-tools

# Or using Homebrew (macOS)
brew install clever-tools
```

#### 2. Log in to your Clever Cloud account

```bash
clever login
```

#### 3. Create a new application

```bash
# Step 1: Initialize the current directory as a Clever Cloud application
clever create --type ruby <YOUR_APP_NAME>

# Step 2: Link a PostgreSQL add-on
clever addon create postgresql-addon <YOUR_ADDON_NAME> --link <YOUR_APP_NAME>

# Step 3: Set the required environment variables
clever env set CC_RACKUP_SERVER puma
clever env set SECRET_KEY_BASE $(bin/rails secret)

# Step 4: Add your domain (optional but recommended)
clever domain add <YOUR_DOMAIN_NAME>
```

#### 4. Deploy your application

```bash
clever deploy
```

#### 5. Open your application in a browser

Once deployed, you can access your application at `https://<YOUR_DOMAIN_NAME>/`.

### Clever Cloud Configuration

The `clevercloud/ruby.json` file configures deployment tasks:

```json
{
    "deploy": {
        "rakegoals": [
            "db:migrate",
            "assets:precompile"
        ]
    }
}
```

This ensures database migrations and asset precompilation run automatically on each deploy.

### Monitoring Your Application

Once deployed, you can monitor your application through:

- **Web Console**: The Clever Cloud console provides logs, metrics, and other tools to help you manage your application.
- **CLI**: Use `clever logs` to view application logs and `clever status` to check the status of your application.

## Additional Resources

- [Ruby on Rails Guides](https://guides.rubyonrails.org)
- [Puma Documentation](https://puma.io)
- [Clever Cloud Ruby Documentation](https://www.clever-cloud.com/developers/doc/applications/ruby/)
- [Clever Cloud PostgreSQL Documentation](https://www.clever-cloud.com/developers/doc/addons/postgresql/)
