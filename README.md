# Demo RubyOnRails

This application is a fork from [official getting started](http://guides.rubyonrails.org/getting_started.html) which contains the configuration for Clever Cloud ruby application.

## Configuration

### Environment variables

On your Clever Cloud application you must specify some environment variables as following:

- `RUBY_VERSION` with one of the next values:
  - "2" will select the greatest "2.X.Y" version available;
  - "2.3" will select the greatest "2.0.Y" version available;
  - "2.3.1-p112" will select the "2.3.1-p112" version.

- `SECRET_KEY_BASE` with a value that can be generate using `rake secret`.

### Clever Cloud

To work, your application must contains the file `clevercloud/ruby.json` which contains:

```json
{
    "deploy": {
        "rakegoals": ["assets:precompile"]
    }
}
```

To enable rails assets pipeline.