# MPCS 52553 - Final Project Starting Point

* Download the ZIP of this repository to start your project.  
* Rename your folder to `mpcs52553-final`

<hr>

Or, you can create a new Rails app yourself and follow these steps:

1. Generate a new Rais app: `rails new mpcs52553-final --skip-bundle`
2. Add `gem 'ez'` inside the `Gemfile`
3. `bundle install`
4. Then customize the `config/development.rb` as follows:

    ```
      config.assets.debug = false
      config.assets.digest = false
    ```

Now you can start developing.  Happy coding!


1. The connection can not be duplicate.
can we make sure from the database level?
3. How to record time inside?
4. The security need to be make sure.
5. How to delete something in database?
