# et_console_app-cookbook

A cookbook to provision an Apache server for the purpose of serving Console and it's accompanying Mobile Web app.

The Mobile Web app should be broken out into its own cookbook(s) if that becomes a separate property.

## Supported Platforms

* Ubuntu 12.04

## Attributes

Key                                    | Type            | Description                                      | Default
---                                    | ----            | -----------                                      | -------
`['apache']['listen_ports']`           | String or Array | Ports Apache listens on                          | `%w(80 10443)`
`['apache']['contact']`                | String          | Apache server contact                            | `'devops@evertrue.com'`
`['et_console_app']['deploy_to']`      | String          | Path to Console                                  | `'/var/www/console.evertrue.com'`
`['et_console_app']['docroot']`        | String          | Docroot for Console                              | `"#{node['et_console_app']['deploy_to']}/current/release"`
`['et_console_app']['server_name']`    | String          | Primary domain for Console                       | `"#{domain_prefix}console.evertrue.com"`
`['et_console_app']['server_aliases']` | Array           | Secondary domains for Console                    | `["#{domain_prefix}dashboard.evertrue.com"]`
`['et_web_app']['deploy_to']`          | String          | Path to Web                                      | `'/var/www/web.evertrue.com'`
`['et_web_app']['docroot']`            | String          | Docroot for Web                                  | `"#{node['et_web_app']['deploy_to']}/current/release"`
`['et_web_app']['server_name']`        | String          | Primary domain for Web                           | `"#{domain_prefix}web.evertrue.com"`
`['apache']['default_modules']`        | Array           | Loaded Apache modules                            |`%w(status alias auth_basic authn_file authz_default authz_groupfile authz_host authz_user dir env mime setenvif deflate expires headers rewrite)`
`['apache']['status_allow_list']`      | String          | Addresses allow to get server status             | `'127.0.0.1 localhost ip6-localhost'`
`['apache']['ext_status']`             | Boolean         | Whether or not to provide extended server status | `true`


## Usage

### et_console_app::default

Include `et_console_app` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[et_console_app::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: EverTrue, Inc. (<jeff@evertrue.com>)
