IWDeviceInfo
============

A simple class that makes it easy to get information about an iOS device at runtime.

This class allows you to get common info about the device such as whether it is an
iPhone or iPad, if it has a retina display, what OS version is running (an easily
comparable value), etc. This prevents a lot of code duplication and is cleaner than
most alternatives, such as referencing a property defined on the app delegate.

All calls are cached so there is very little overhead when making repeated calls
since UIScreen and UIDevice property access only occurs once.