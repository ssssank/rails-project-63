### Hexlet tests and linter status:
[![Actions Status](https://github.com/ssssank/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/ssssank/rails-project-63/actions)
[![Main](https://github.com/ssssank/rails-project-63/workflows/Ruby/badge.svg)](https://github.com/ssssank/rails-project-63/actions)

### Requirements

- Ruby 3
- Make

### Install

```bash
git clone git@github.com:ssssank/rails-project-63.git
cd rails-project-63
make install
```

### Usage

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
#   <input name="commit" type="submit" value="Save">
# </form>
```
