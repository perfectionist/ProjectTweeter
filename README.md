# First Tweeting Program #

This project is from 
[iOS SDK Programming](http://pragprog.com/book/adios/ios-sdk-development) by Chris Adamson and Bill Dudney.

## Chapter 1 ##

The start of the first twitter application. I just posts a canned message 
to your [Twitter](http://twitter.com/) account. Version tag is **v1.0**.

## Chapter 2 ##

Add a WebView pane and button to display my tweets to application. Book introduces `@property` and `IBOutlet`. Version tag is **v2.0**.

## Chapter 3 ##

First step to add asynchronicity so posting are reloaded after submitting a post.  We do this with **blocks**. Blocks in Objective-C are not much different than blocks in Smalltalk.

Hint: In the iPhone simulator be sure to setup Twitter account info.  I forgot to do this and the app was not behaving. I would click on **I finished the project** button and nothing would happen. Lost about a hour figuring that one out.

Great bit of advice in Adamson and Dudney book:

> *we always want to finish our UI before we start localizing*

This is because we are changing the UI components and you'll need to fix all the localizations at the same time. Better to wait until the UI is complete.

Version tag is **v3.0**.

## Environment ##

* Xcode 4.2.1 or 4.3beta. 
* Lion 10.7.2
* MacBook Pro 17in, Mid 2010

## Resources ##

### iOS Programming ###
* [iOS SDK Programming](http://pragprog.com/book/adios/ios-sdk-development) by Chris Adamson and Bill Dudney.
        This is an excellent book with uptodate iOS 5 examples.  It uses ARC and storyboards by default.  I am using the first *beta* version.
* [iOS Programming, the Big Nerd Ranch Guide, 2nd Ed](http://www.bignerdranch.com/book/ios_programming_the_big_nerd_ranch_guide_nd_edition_)

### Xcode ###
* [Xcode 4 videos](http://pragmaticstudio.com/screencast-tags/xcode4) **FREE**. These
    provide a great introduction to key and advanced features of Xcode 4. 

### Objective-C 2 Programming ###
* [Objective-C Programming](http://pragprog.com/screencasts/v-bdobjc/coding-in-objective-c-2-0) Pragmatic Programmer videos are a very good introduction.
* [Programming in Objective-C 2.0, 2nd Edition](http://www.pearsonhighered.com/educator/product/Programming-in-ObjectiveC-20/9780321566157.page) by Stephen G. Kochan is a excellent reference but does not really cover the idoms and best practices. 

### Git and GitHub ###
* [Git](http://git-scm.com/) site has an [documentation](http://git-scm.com/documentation) link that has tutorials to developer documentation. [Xcode supports git](http://developer.apple.com/library/ios/#documentation/ToolsLanguages/Conceptual/Xcode4UserGuide/SCM/SCM.html#//apple_ref/doc/uid/TP40010215-CH7-SW12). I use a combination of Xcode and SourceTree to manage my git repository.  Most adds and commits are from inside Xcode.  Merges, tagging, pushing to GitHub are from SourceTree.  Of course I also make use of the command line (mainly for setup) and even some commands on GitHub itself.
* [GitHub](http://github.com/) site has a very good set of help pages.
* [Insider Guide to GitHub videos](http://pragprog.com/screencasts/v-scgithub/insider-guide-to-github) while a bit dated have some excellent tips. First video is free, second is just $5.
* [SourceTree](http://www.sourcetreeapp.com/) from Atlassian is **FREE** tool for managing source code and you can download at the [Mac App Store](http://itunes.apple.com/us/app/sourcetree/id411678673?mt=12&ls=1).  It works well with **git** and **GitHub**.  