# SwiftUITranslation

SwiftUI translation sample using the [Apple Translation Framework](https://developer.apple.com/documentation/translation/).

The sample has the following three tabs within a TabView, illustrating different features of the framework.

- Simple Translation View
  - Illustrates the use of text translation using the [TranslationSession](https://developer.apple.com/documentation/translation/translationsession) class.
 
- Batch Translationn View
  - Illustrates the use of batch translation where each string in an array of strings, representing tasks within a task list, are translated asynchronously.
 
- Cutom Translation View
  - Illustrates the use of cusom [TranslationSession.Configuration](https://developer.apple.com/documentation/translation/translationsession/configuration/) where the source and target languages are specified using languages represented by an enum.
 
**Note:** The Apple Translation Framework is not currently supported within the simulator and the app must be ran on an actual device.   
