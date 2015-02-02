# rafinesque
Customize your application semantics.

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
