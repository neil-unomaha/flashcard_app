# Welcome to the Flashcard App
This flashcard app includes a number of awesome features, including:

- Helping you keep your flashcards organized: associate your flashcards to a particular `domain`, and within that domain a `category`
- Add images to your flashcards
- Easily create flashcard tests. Running tests always randomizes the flashcard order
- Enjoy a great flashcard test interface that shows your progress, and includes hotkeys
- Review your test results
- Quickly create new tests that combine previous tests, or create tests that include cards that were answered incorrectly.  

![main_page](https://user-images.githubusercontent.com/38234505/156952539-a250d8d6-65f9-4745-b253-f500704d5231.png)

<br>
<br>

![drag-and-drop-image-feature](https://user-images.githubusercontent.com/38234505/156952592-5f5eff3d-8e4a-49e1-b0fd-c86a30dd05f6.png)

<br>
<br>

![flashcard_test_creation](https://user-images.githubusercontent.com/38234505/156953163-c2355fc5-1042-4634-8405-5b7d9fa358a5.png)

<br>
<br>

![flashcard_test_screen](https://user-images.githubusercontent.com/38234505/156952755-1e0bcef4-e82b-47be-a577-716ca42fc4e1.png)

<br>
<br>

![flashcard_test_results](https://user-images.githubusercontent.com/38234505/156952782-e52457cb-8761-400e-80b5-13ecc7820db0.png)


## Software Requirements

**Ruby**: You will need a ruby version >= `2.5.0`. I used ruby version `3.0`

**Rails**: You will need rails version `6.1.x`

**imagemagick**: This app depends on the `image_processing` gem so that thumbnails of your attached images properly show up.
  - To install on a Mac via homebrew: `brew install imagemagick`
  - To install via a debian/ubuntu terminal: `sudo apt install imagemagick`


## Setup
From the root of your app, run `bundle` to install the required gems and their dependencies.

### Important
The database where all your cards live, as well as the active storage location where all your uploads live, exist OUTSIDE of the application. This is a hackish way to easily seperate the data from the app. (For example: like me you might have multiple card decks and want to seperately version your card decks).

Lets examine the default database location. Look at the default configuration of your database at **config/database.yml**.  You will notice that the database name/location is:

`../imported_dbs/flashcard_cissp_database.sqlite3`

What this means:
- Your database will be located *up one directory* from this app's location on your computer, and within the directory named **imported_dbs**
- The default database name is **flashcard_cissp_database.sqlite3** (but this can easily be changed).

Lets also examine the default Active Storage location for the app. Look at the default configuration at **config/storage.yml**. You will notice that the Active Storage name/location is:

`../imported_dbs/flashcard_cissp_storage`.

What this means:
- Your Active Storage directory (location where all your associated attachments live) will be located *up one directory* from this app's location on your computer, and within the **imported_dbs/flashcard_cissp_storage** directory (but again, you can easily change the location if you want to).

Personally, I decided to nest my flashcard app into a directory called **meta_apps**. Inside my meta_apps directory you can see the **flashcard_app**, as well as the **imported_dbs** directory where all the flashcard app data lives:

![general_tree_structure](https://user-images.githubusercontent.com/38234505/156951845-fd0581f6-045d-49f7-8051-15ff906a6494.png)

Finally, run `rails db:migrate` to create your database file.

Startup your rails server with `rails s` and visit `localhost:3000` in your favorite web browser.

**Note** This app uses webpack, so the first time you run the app, all of the styling on the page may not be present.  If this happens, open up another terminal, `cd` to the app, and run the webpack server via `./bin/webpack-dev-server`.

## Last But Certainly Not Least
**STUDY EFFICIENTLY, FRIENDS**!

Strive to review your flashcards only as much as you need to in order to recall the content, but no more! [Read this awesome article about spaced repetition](https://collegeinfogeek.com/spaced-repetition-memory-technique/) to do just that. Happy studying!
