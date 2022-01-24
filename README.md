# README
The ruby version required for rails `6.1.x is >= 2.5.0`. I used ruby 3.0.

From the root of your app, run bundle to install required gems and dependent gems.

To start your web server, from the root of your app run: `rails s`

Note This app assumes your databases exists outside of the application. In other words it does not exist in the default `<your_app>/db/` directory. Instead the database exists at: `../imported_dbs/musings_database.sqlite3`

The reasoning for doing this is so that I can seperately version a repo containing all the sqlite databases for each of my personal apps.
