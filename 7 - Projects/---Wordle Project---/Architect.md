**

<goal>

I'd like for you to help me brainstorm the overall structure of my application. You should act like a Senior Software Engineer that has extensive experience developing, and building architecture for large scale web applications. You should ask me follow up questions as we proceed if you think it's necessary to gather a fuller picture.

To accomplish this, you take the Context below, considering:

What I’m trying to build (WHAT)

Who I’m building it for (WHO)

The pains it solves (WHY)

How it’s different from the current status quo (HOW)

Any other details I give you

<sub-goal>

As part of your process, make sure to research public documentation for each tech choice we’re making to ensure it makes sense in the broader context of our application.

</sub-goal>

</goal>

<format>

Return your format in Markdown, without pre-text or post-text descriptions.

## Launch Features (MVP)

### Feature Name

**Strong** 2-3 sentence summary of what the feature is or does

* List

* Of

* Core

* Requirements or Functions

#### Tech Involved

* Main Technologies Involved w/ Feature

#### Main Requirements

* Any

* Requirements

* Of Feature

## Future Features (Post-MVP)

### Feature Name

* List

* Of

* Core

* Requirements or Functions

#### Tech Involved

* Main Technologies Involved w/ Feature

#### Main Requirements

* Any

* Requirements

* Of Feature

## System Diagram

An image detailing a full system diagram of the MVP. Please create a clean architecture diagram with layers, rounded containers, and clear component relationships, similar to the one attached image

## Questions & Clarifications

* list

* of

* clarifying

* questions

## List of Architecture Consideration Questions

* list

* of

* Architecture

* questions

</format>

<warnings-or-guidance>

We’re focusing on functional accomplishments of features in this stage, not designing UX in detail

If a feature or tech choice seems ambiguous, ask me for clarification such that you would get what you need to continue

You should consider how tech choices may evolve or change if the application scales and give me recommendations with tradeoff consideration

We should have a clear architecture for the app, including main infrastructure considerations, services/microservices required, critical 3rd party APIs choices, etc

</warnings-or-guidance>

<context>

I’d want to build a web version of the Wordle game that is Azure-integrated and the game is themed around the Food & Beverage industry words.  

- It should require the user to put in their name before they can play the game. 
- The format of the layout should auto adjust for desktop or mobile viewing. 

- The layout should have the typical Wordle checkerboard with six rows with 5 boxes for each letter.  Have a keyboard at the bottom of the screen that can be clicked on or using actual keyboard. After a letter has been guessed the letter should be highlighted to show it was guessed already red for a wrong guess and green if correct letter. 

-I have a text file of 3000 words(word per line) that I want the game to use for a session. It should randomly pick a word for each session ensuring that it does not use the same word again until the user has used 30 words or so. 

- UI should look like Android 16  new UI design based on the "Material 3 Expressive" language, which will bring springy animations, fresh color themes, impactful fonts, improved motion physics, and new icon shapes. The changes, including background blur effects.

Design System - **Design Philosophy**: Material 3 Expressive - **Primary Color**: Turquoise (#06D6A0) - **Accent Color**: Tangerine (#FFA552) - **Background Color**: Light Gray-Blue (#EFF6F5) - **Typography**: - Primary Font: Roboto - Heading Font: Montserrat - Fluid sizing with clamp() 

-Theming Implementation - SCSS variables defined in `_variables.scss` - CSS Custom Properties in `_css-variables.scss` - Dark mode via `[data-theme="dark"]` attribute - Responsive breakpoints: - xs: 0 - sm: 600px - md: 960px - lg: 1280px - xl: 1920px 

-Animation System - Transition durations: - Fastest: 100ms - Fast: 150ms - Medium: 300ms - Springy: 250ms cubic-bezier(0.34, 1.56, 0.64, 1) - Animation durations: - Short: 200ms - Medium: 400ms - Long: 600ms - Game-specific animations: - Tile flip animation - Tile pop animation - Keyboard feedback 

Game Implementation 

- Core Game Mechanics - 5-letter word guessing - 6 attempts maximum - Color-coded feedback: - Correct letter, correct position: Turquoise - Correct letter, wrong position: Tangerine - Letter not in word: Grey (#787c7e) 

-Game State Management - React Context API for state management - Local storage for persistence - Typed interfaces for game state 

-User Interaction Flows - Keyboard input (physical and virtual) - Game board display with animated feedback - Statistics tracking and display - Instruction modal for new users

**Authentication Strategy**: keep it lightweight for now

Only English

Not going to Monetization it

all players should get the same daily word but can access previous days' words

Show played games Stats indefinitely

implement auto-scaling policies based on concurrent users

start with a single partition and monitor

begin with in-memory caching and add Redis when scaling demands it

whatever is the stand from rate limits should we impose per IP/session

start with single-region and add DR later

for now just HTTPS and CORS

we target sub-3 second initial load and sub-200ms interactions

integrate Azure Application Insights

blue-green deployments

only plan on having a total of 10 users play the game

NOTE: In the beginning I want to keep cost down EXTREMELY low.


### Domain & Hosting Configuration

- **URL**: [https://wordle.kjrcloud.com](https://wordle.kjrcloud.com)
- **DNS**: CNAME record in Namecheap → Azure Static Web Apps
- **SSL**: Free certificate auto-provisioned by Azure
- **Cost**: $0 (domain already owned)

## Launch Features (MVP) - Updated

### Word Import & Management

**Strong** One-time import process for your 3000-word text file with efficient storage and retrieval system.

- Parse text file (one word per line)
- Import script using Node.js
- Store in Cosmos DB with indexing
- Validate all words are 5 letters
- Add metadata for future features
- Version control for word list updates

#### Tech Involved

- Node.js import script
- Cosmos DB bulk import
- Azure Functions for validation
- Git for word list versioning

#### Main Requirements

- One-time setup script
- Validation for 5-letter words
- Efficient storage structure

### 30-Day Historical Access

**Strong** Allow players to access and play any word from the past 30 days using deterministic selection.

- Deterministic word selection algorithm
- Date-based seed generation
- UTC midnight boundaries
- Calendar interface for date selection
- Past performance tracking
- Shareable historical results

#### Tech Involved

- Seedable random algorithm
- Date manipulation in TypeScript
- React calendar component
- Local storage for past games

#### Main Requirements

- Consistent words across all players
- Sub-second historical lookup
- Mobile-friendly date picker

### Aggregate Statistics Tracking

**Strong** Track total games played across all players with real-time updates and trend analysis.

- Global stats document
- Total games counter
- Win percentage tracking
- Guess distribution (1-6)
- Daily breakdowns
- Anonymous aggregation

#### Tech Involved

- Cosmos DB atomic operations
- Azure Functions for updates
- React charts for display
- Efficient caching strategy

#### Main Requirements

- Thread-safe increments
- Real-time updates
- Privacy-preserving

### Daily Word System (Enhanced)

**Strong** UTC-based daily word selection with historical access and deterministic generation.

- Midnight UTC reset
- Deterministic selection algorithm
- Historical word tracking
- Countdown timer to next word
- Time zone display
- Previous/next day navigation

#### Tech Involved

- Crypto-based seeding
- Azure Functions endpoint
- Client-side UTC handling
- Moment.js for time display

#### Main Requirements

- Reproducible selection
- No scheduling needed
- Accurate timezone handling

<other-critical-notes>

WHAT - per my intro above, I’m building a web version of Wordle the game

WHO - It should be familiar and appeal to anyone that have played Wordle while still inviting for user that have never played the game before. 

WHY - Create a fun Food & beverage themed wordle game for people in the industry. 

HOW - The Wordle web page should be easy to access no matter what device or where the user is at the time. 

</other-critical-notes>

<current-tech-choices>
Backend tech:
- Client-Server Communication**: REST API with JSON payloads 
- Database Access**: MongoDB SDK with Cosmos DB 
- Secret Management: Environment variables with Azure Key Vault references 
- Daily Word Generation: Deterministic algorithm based on date

The database will be hosted through Azure.

The frontend use React, TypeScript, and SCSS setup, to embody Android 16's Material 3 Expressive design principles with your chosen color palette: Primary: #06D6A0 (Turquoise), Accent: #FFA552 (Tangerine), and Background: #EFF6F5

The frontend tech:
- **Framework**: React 18+ - **Build Tool**: Vite (replacing older Create-React-App) - **Language**: TypeScript with strict type checking - **Styling**: SCSS with CSS custom properties - **Testing**: Vitest with React Testing Library - **Path Aliases**: `@/*` for src directory, `@shared/*` for shared package


</current-tech-choices>

</context>

**