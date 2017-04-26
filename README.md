# itamae selenium

create selenium(python), xvfb, chrome environment by itamae

## Requirement

- CentOS 7

## Usage

install gem(itamae).
```
bundle install --path vendor/bundle
```

run
```
bundle exec itamae ssh -i ~/.ssh/id_rsa_example_jp -u root -h host001.example.jp -y nodes/default.yml cookbooks/selenium/default.rb
```

dry run
```
bundle exec itamae ssh -i ~/.ssh/id_rsa_example_jp -u root -h host001.example.jp -y nodes/default.yml cookbooks/selenium/default.rb -n
```
