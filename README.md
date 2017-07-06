# RubyOnRails as RESTful Demo for Clever-Cloud

## Description

This application is a fork from [official getting started](http://guides.rubyonrails.org/getting_started.html) which contains the configuration for Clever Cloud ruby application.

This application is a RESTful app which is using PostgreSQL addon.

## Configuration

### Environment variables

On your Clever Cloud application you must specify some environment variables as following:

- `RUBY_VERSION` with one of the next values:
  - "2" will select the greatest "2.X.Y" version available;
  - "2.3" will select the greatest "2.0.Y" version available;
  - "2.3.1-p112" will select the "2.3.1-p112" version.
- `SECRET_KEY_BASE` with a value that can be generate using `rake secret`.

This application is provided to work with Postgresql, you have to define the next variables, or link your application with Postgresql addon on Clever.

- `POSTGRESQL_ADDON_DB`
- `POSTGRESQL_ADDON_HOST`
- `POSTGRESQL_ADDON_USER`
- `POSTGRESQL_ADDON_PASSWORD`
- `POSTGRESQL_ADDON_PORT`

### Clever Cloud

To work, your application must contains the file `clevercloud/ruby.json` which contains:

```json
{
    "deploy": {
        "rakegoals": [
            "db:setup",
            "assets: precompile"
        ]
    }
}
```

Create your data schema and relations and enable rails assets pipeline.

## Application

This REST API provides a design to definie new content on website, there is an **HTTP Basic Authentication** with username: `admin` and password: `admin`.

These are the routes available.

```
              Prefix Verb   URI Pattern                                       Controller#Action
       welcome_index GET    /welcome/index(.:format)                          welcome#index
    article_comments GET    /articles/:article_id/comments(.:format)          comments#index
                     POST   /articles/:article_id/comments(.:format)          comments#create
 new_article_comment GET    /articles/:article_id/comments/new(.:format)      comments#new
edit_article_comment GET    /articles/:article_id/comments/:id/edit(.:format) comments#edit
     article_comment GET    /articles/:article_id/comments/:id(.:format)      comments#show
                     PATCH  /articles/:article_id/comments/:id(.:format)      comments#update
                     PUT    /articles/:article_id/comments/:id(.:format)      comments#update
                     DELETE /articles/:article_id/comments/:id(.:format)      comments#destroy
            articles GET    /articles(.:format)                               articles#index
                     POST   /articles(.:format)                               articles#create
         new_article GET    /articles/new(.:format)                           articles#new
        edit_article GET    /articles/:id/edit(.:format)                      articles#edit
             article GET    /articles/:id(.:format)                           articles#show
                     PATCH  /articles/:id(.:format)                           articles#update
                     PUT    /articles/:id(.:format)                           articles#update
                     DELETE /articles/:id(.:format)                           articles#destroy
                root GET    /                                                 welcome#index
```