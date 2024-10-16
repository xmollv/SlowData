# SlowData

This project was created to demonstrate how SwiftData doesn't seem to properly handle large datasets. Trying to render 30_000 rows on a List causes hangs that lasts seconds, even if the List only renders the visible rows.

## Steps to reproduce:
1. Download and open the project
2. Go to `2. ContentView.swift` and uncomment lines 30 to 33 to seed the database
3. Run the app
4. Go to `2. ContentView.swift` and comment lines 30 to 33 to prevent adding more data to the database on future runs since the database has been seeded
5. Run the app
6. Change between the menus to observe the hang

## Other:
- This does happen in Debug builds and Release builds
- The project has `SWIFT_ENABLE_OPAQUE_TYPE_ERASURE=NO` to work around the performance issues of debug builds in Xcode 16: https://indieweb.social/@curtclifton/113273571392595819
