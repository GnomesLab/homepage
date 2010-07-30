# WARNING!

As of beta3 development, all commits without tests will be rolledback as soon as I catch them.

## Issue tracker
Have an issue? Report it in our [Lighthouse Tracker Page](http://gnomeslab.lighthouseapp.com/projects/55987-homepage/overview "Gnomeslab Lighthouse Tracker")

## How to develop and commit code

1. If it's a front end start with a very generic set of expectations
2. Plan the necessary objects (paper diagrams rock)
3. When you know all the objects that you're going to require, start by creating their expectations **as needed**
4. Say you added a Post object in your expectation and a generic behavior. Now it should be in epic fail mode. Great!
5. Get your specs green and _as you go_ keep an eye on your cucumber tests. Keep'em running as you go
6. All green? Outstanding! Now review your code, make sure you didn't forget any comments for our docs and refactor
7. Still everything green? Fantastic! You're almost there!...
8. Run rake spec to make sure that you didn't break anything
9. Run rake cucumber:ok to make sure that the site is still in one piece
10. Visually check the site! You can't trust silly computers, can you?
11. All cool? Get ready for the last few steps. checkout the master branch (you were using a different branch, right?)
12. git pull origin master
13. rake spec && rake cucumber:ok #=> this should flood you with green goodness. If it didn't kill someone!
14. git merge <your branch(s)
15. rake spec && rake cucumber:ok #=> all cool? if not fix it!
16. Visually check everything again. It should be all good to go!
19. Commit your code and push it with git push origin master
20. (optionally) delete your working branch with git branch -d <your branch>

Pop a bottle of crystal. You've made it once again!

**Note:** Please don't forget to add @crystal to all .feature files that represent completed features that should be passing.

## Github - Lighthouse commands

* [closes #id]

## Production stack:

### Gems
#### External
* Bundler 1.0.0.rc.1
* Rails 3.0.0.rc
* Devise 1.2.0
* will_paginate 3.0.pre2

#### Internal
* active_record_attributes_equality 1.0.0.rc.2
