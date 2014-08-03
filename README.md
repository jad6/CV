# Jad's Curriculum Vitae

![image](cover_image.png)

## iOS Application

I am an avid iOS developer and Mac OS X dabbler who likes to think of new ways to present things. Therefore, my CV has been written in the form of a universal iOS application. The code (under a [BSD 3-Clause](http://opensource.org/licenses/BSD-3-Clause)) is [available](https://github.com/jad6/CV/releases) to download, browse and use.

This app is localised for English 🇬🇧 and French 🇫🇷! Set your device to French to run the application under its French localised from. The base localised language is English and as such the application will present its contents in English for all other languages.

## Objective-C

The Objective-C application is iOS 7.1+ and the installation intrsuction are described in the next section.

### Compiling The Application

To compile the application you will need to run Mac OS X with [Xcode 5.1+](https://developer.apple.com/xcode/) installed. Then simply open the ```Jad's CV.xcodeproj``` file and run the application.

**Note:** To run it on a personal iOS device you will need to have an active full [iOS Developer](https://developer.apple.com/programs/ios/) account. Alternatively you could go through TestFlight as per the below instructions.

### TestFlight

Through [TestFlight](http://help.testflightapp.com/customer/portal/articles/402851-testflight-faq) you can download the application without the need for the App Store.

By completing the [recruitment information](http://tflig.ht/1gycrc2) I will be able to authorise you to download the application and you will have access to the latest uploaded builds.

## Swift *(In Development)*

I am currently porting the application to Swift as a fun learning experience. The Swift application is iOS 8.0+ and aims to improve the code and paradigms used in the Objective-C version. The improvements include:

- A restructured class hierarchy for the models.
- Generics, Extensions and other usefull new Swift specific language features. 
- Dynamic Font Type and accessibility extra large font size support.
- Removed the Storyboards.
	- *+ve* This allows for tighter layout controls of the subviews
	- *+ve* Enforces a clean and robust MVC structure;
	- *+ve* Merges are 100x nicer;
	- *-ve* Creates more boiler code, typically in `layoutSubviews`.

### Development 

The Swift application will continue to be developed on the [`swift`](https://github.com/jad6/CV/tree/swift) branch and once the application is fully ported the `master` branch will be updated.

## Old Fashioned Way

If you cannot compile or download the app, you can download [Jad's CV.pdf](https://github.com/jad6/CV/raw/master/Jad's%20CV%20en.pdf) (a [French version](http://raw.githubusercontent.com/jad6/CV/master/Jad's%20CV%20fr.pdf) of the PDF is also available). However, the PDF version of my CV is slightly less informative than the app as the projects I worked on have been omitted.
