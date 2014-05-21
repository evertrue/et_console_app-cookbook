et_console_app cookbook CHANGELOG
============================
This file is used to list changes made in each version of the et_console_app cookbook.

v2.1.0
------
- Use our own Berkshelf API server for internal cookbooks
- Fix ChefSpec tests to have Node install command properly stubbed
- Add `(stage-)app.evertrue.com` as a vhost
    + This cookbook is increasingly inaccurately named…

v2.0.4
------
- Add missing hyphen

v2.0.3
------
- Hack attributes to work with stage-newvpc environment

v2.0.2
------
- Set RewriteLogLevel back to 0 to prevent huge logs from being written

v2.0.1
------
- Fix OPTIONS requests for better HAProxy health checks

v2.0.1
------
- Fix hard-coded setting of listen port for `web_app` resources

v2.0.0
------
- Switch to configure Apache to listen on port 8080 (breaking change)

v1.0.1
------
- Fix RewriteRule for cachebusting timestamped assets

v1.0.0
------
- Add installation of Node.js, NPM, Bower, Grunt, Git
- Fix ChefSpec tests for group ownership of some Apache folders
- Specify platform for ChefSpec tests

v0.1.0 (2014-03-21)
-------------------
- Initial release of et_console_app
