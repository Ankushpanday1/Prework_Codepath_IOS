# Pre-work - *What's the Tip?*

**What's the Tip?** is a tip calculator application for iOS.

Submitted by: **Mihir Suvarna**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [X] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] App-specific Dark Mode
- [X] Tip Slider with a customizable amount
- [X] Auto-layout constraints for various screen sizes

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://user-images.githubusercontent.com/49384703/120921991-475e1000-c68c-11eb-94be-450a50a1a733.mp4' title='Video Walkthrough' width='240' alt='Video Walkthrough' />

GIF created with [QuickTime Player](https://support.apple.com/en-us/HT208721).

## Notes

Implementing the basic UI for the initial tip calculator proved to be fairly easy, with the steps provided. Dark Mode proved to be quite a challenge, as the app had to have a app-wide darkmode theme. It was a pain to implement this across various view controllers, but I solved this using notifications. 

Another challenge was connecting the slider and updating the right labels. Often, the slider and its respective label would display the wrong value, but this was fixed after refactoring my code.

Various screen sizes also proved to be problematic, as my app would not initially resize. However, I added constraints that aligned all UI elements in my canvas, thus solving the issue and allowing the device to automatically resize each element to fit the right dimensions.

Overall, this was a fun app to build, and I learned a lot about Xcode/Swift through developing it.


## License

    Copyright 2021 Mihir Suvarna

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
