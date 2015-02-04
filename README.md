# rafinesque
Customize your application semantics.

[![Code Climate](https://codeclimate.com/github/demental/rafinesque/badges/gpa.svg)](https://codeclimate.com/github/demental/rafinesque)
[![Build Status](https://travis-ci.org/demental/rafinesque.svg)](https://travis-ci.org/demental/rafinesque)

## What is it ?
You created an Ruby application, which functional specifications can be applied to various domains.

*Problem* : the texts in your app are somewhat tied to a specific domain, unless you add many placeholders to your translations yml files, and, more problematic, inject values to these placeholders everywhere in your views, mailers ... and so on...

### Example
You created a classified app, specialized in real estate. Some application.en.yml file look like this:

```yml
en:
  home:
    title: Real estate classified
  search:
    title: Find a home for sale.

```

Now you want to fork your project and create a classified to sell yachts. I have to update your translations :

```yml
en:
  home:
    title: Marine classified
  search:
    title: Find a boat for sale.

```

You now will have issues maintaining your fork, because it's a fork. So you decide to put placeholders and inject variables in your views:


```yml
en:
  home:
    title: %{domain_capitalized} classified
  search:
    title: Find a %{sold_object} for sale.

```

Then in your views :

```haml
 = t('.title', domain_capitalized: some_var)
```

And your views start to get bloated...

*Solution*

Here comes Rafinesque. Rafinesque allows you to make custom, localized placeholders inside your translated strings, that are substituted when translations are loaded in memory.

*Setup*

1. Add Rafinesque to your Gemfile

```ruby
  gem "rafinesque"
```

2. Add your semantics in a json string, in ENV (you may use Figaro for example, to load a yaml into ENV)

```ruby
  ENV['semantics']= "{\"fr\":{\"Real estate\":\"Marine\",\"home\":\"yacht\",\"maison\":\"bateau\"", \"fr\":{\"l'immobilier\":\"la marine\",\"maison\":\"bateau\""
```

3. Insert some placeholders in your yml translations files (must be surrounded with $). The important thing to unserstand is that these placeholders are not variables, they are some real words. This allows you to make sure that you handle all the syntactical odds and ends of your language :

```yml
en:
  home:
    title: The best $Real estate$ listing website
  search:
    title: Find a $home$ for sale
```

### Roadmap

* Add more test (test and extract the currently private recursive_map method).
* Add more storage systems than ENV (database or yml files for example).
* Allow to customize placeholders syntax.
* Add a rails generator.
* Create rake tasks to extract existing placeholders.
* Make sure it can be used with other I18n backend than the default one (I18n::Backend::Simple).

