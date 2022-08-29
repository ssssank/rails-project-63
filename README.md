### Hexlet tests and linter status:
[![Actions Status](https://github.com/ssssank/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/ssssank/rails-project-63/actions)
[![Main](https://github.com/ssssank/rails-project-63/workflows/Ruby/badge.svg)](https://github.com/ssssank/rails-project-63/actions)


### Usage

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
```
