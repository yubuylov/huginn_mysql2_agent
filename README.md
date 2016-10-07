# Mysql2Agent

Huginn's agent for execute custom query.
Set connection string and write query – selected rows will be emitted as events.

## Installation

Add `huginn_mysql2_agent` to your Huginn's `ADDITIONAL_GEMS` configuration:

Docker installation (https://github.com/cantino/huginn/tree/master/docker):
```yaml
# docker env
environment:
  ADDITIONAL_GEMS: 'huginn_mysql2_agent(git: https://github.com/yubuylov/huginn_mysql2_agent.git)'
```

Local installation (https://github.com/cantino/huginn#local-installation):
```ruby 
# .env (Local huginn installation)
ADDITIONAL_GEMS=huginn_mysql2_agent(github: yubuylov/huginn_mysql2_agent)
```
And then execute:

    $ bundle

## Usage

1) Set db connections string: 
`mysql2://user:pass@localhost/database`
Use raw or from credential `{% credential mysql_connection %}` 

2) Write SQL:
```sql
select id, title, age, weight from tbl_girls where age >= 18 order by weight, age limit 2
```
Will be emitted events:
```json
[
    {"id":123456762, "title": "Ann", "age": 21, "weight": 45},
    {"id":123456713, "title": "Julia", "age": 18, "weight": 47}
]
```

## Development

Running `rake` will clone and set up Huginn in `spec/huginn` to run the specs of the Gem in Huginn as if they would be build-in Agents. The desired Huginn repository and branch can be modified in the `Rakefile`:

```ruby
HuginnAgent.load_tasks(branch: '<your branch>', remote: 'https://github.com/<github user>/huginn.git')
```

Make sure to delete the `spec/huginn` directory and re-run `rake` after changing the `remote` to update the Huginn source code.

After the setup is done `rake spec` will only run the tests, without cloning the Huginn source again.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/huginn_mysql2_agent/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
