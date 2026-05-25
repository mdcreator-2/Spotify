# Spotify Clone UI

A static Flutter application recreating the Home Screen UI of Spotify. This project is built for the Hackslash Naugat: Flutter Dev Team Induction Task

## Approach

The goal of this project is to focus strictly on UI/UX, matching the layout, colors, spacing, and overall design of the Spotify desktop/web application as closely as possible. 

I structured the application by breaking down the main interface into reusable, independent widgets:
- **Left Sidebar**: Contains navigation links and the user's library with a custom scrollable list.
- **Main Body**: The central hub displaying scrollable horizontal rows of popular albums, radio stations, and favorite artists.
- **Right Sidebar**: Displays currently playing song details, album art, and artist information.
- **Player (Bottom Bar)**: Features track info, transport controls, and volume adjustments.
- **Navbar (Top Bar)**: Holds search, profile, and quick navigation buttons.

To keep the codebase clean, each major section was moved into its own file within the `lib/components` directory. Custom widgets like `HoverBuilder` and `HoverScrollableRow` were created to handle interactive states and scrolling behavior efficiently without duplicating code.

## Challenges

During development, several challenges were encountered:
1. **Hover Effects**: Implementing smooth and consistent hover effects across all clickable icons and texts required a custom wrapper widget.
2. **Hover Effect on Rows in Main Body**: Managing hover states for the horizontally scrollable rows in the main body (changing background colors and displaying shadow effects) while keeping the scroll performant was tricky.
3. **Slider Functionality in Bottom Player**: Accurately designing the custom slider in the bottom player (for progress and volume) to display the active track color only on hover (green) and white otherwise, without standard Material padding interfering with the layout.

## Potential Improvements

- **Responsivity**: The current layout uses fixed widths for sidebars. Making the UI responsive (adaptable to different screen sizes, automatically collapsing sidebars on smaller screens) is the top priority.
- **State Management**: Implementing a proper state management solution to handle currently playing track details, play/pause states, and volume across different widgets.
- **Data Models**: Instead of hardcoding static UI data, separating the data into proper models and a mock backend repository would make the UI much easier to scale and test.
- **Animations**: Adding micro-animations to make the application feel more polished and alive.
