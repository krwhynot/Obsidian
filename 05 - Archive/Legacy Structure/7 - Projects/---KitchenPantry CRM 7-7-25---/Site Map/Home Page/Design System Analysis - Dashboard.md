```markdown
Kitchen Pantry CRM - Dashboard Design System Analysis

  1. Design Style Overview
  Design Philosophy: Mission Control Dashboard with professional CRM focusFramework: Vue.js 3 with Composition API and TypeScriptLayout Strategy: CSS
   Grid with Flexbox fallbacks, responsive-first approachIcon System: Heroicons with consistent 16px-28px sizingAnimation Approach: Subtle
  micro-interactions with 150ms-300ms transitionsAccessibility: WCAG 2.1 AA compliant with comprehensive screen reader support

  Visual Mood: Clean, professional, data-driven with emphasis on clarity and efficiency. The design prioritizes information hierarchy and user task
  completion over decorative elements.

  ---
  2. Color Scheme
  Primary Colors

  --primary: #3b82f6 (Blue 500)
  --primary-hover: #2563eb (Blue 600)
  --accent-primary: #3b82f6
  --accent-secondary: #2563eb

  Semantic Colors

  --success: #10b981 (Emerald 500)
  --warning: #f59e0b (Amber 500)
  --danger: #ef4444 (Red 500)
  --info: #3b82f6 (Blue 500)

  Background Hierarchy

  --bg-primary: #ffffff (White)
  --bg-secondary: #f8fafc (Slate 50)
  --bg-tertiary: #f1f5f9 (Slate 100)

  Text Colors

  --text-primary: #0f172a (Slate 900)
  --text-secondary: #64748b (Slate 500)

  Borders & Shadows
  --border-color: #e2e8f0 (Slate 200)
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05)
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1)
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1)

  Usage Context: Primary blue for CTAs and key actions, semantic colors for status indicators, neutral grays for content hierarchy and subtle UI
  elements.

  ---
  3. UI Components Breakdown

  Dashboard Header

  Role: Main page title with user greeting and refresh functionalityMarkup: <header> with flexbox layoutStyling: Responsive typography using clamp(),
   user avatar integrationBehavior: Time-based greeting, data refresh with loading states

  <h1 class="dashboard-title font-extrabold text-text-primary">
    Mission Control Dashboard
  </h1>

  Quick Actions Bar

  Role: Primary action shortcuts for common CRM tasksMarkup: Horizontal button group in centered containerStyling: 48px height, 120px min-width
  buttons, responsive collapse to vertical stackBehavior: Icon + text buttons with hover lift effects

  .quick-action-button {
    min-width: 120px !important;
    height: 48px !important;
    display: flex !important;
    align-items: center !important;
    gap: 8px !important;
  }

  KPI Cards

  Role: Key metric display with trend indicatorsMarkup: Card container with icon, value, and change indicatorStyling: Hover scale (1.05), interactive
   shadows, color-coded iconsBehavior: Click navigation, trend arrows (up/down/stable)

  <div class="group cursor-pointer transition-all duration-normal 
       hover:scale-105 hover:shadow-lg active:scale-95">

  Principal Widgets

  Role: Top 5 lists for opportunities and interactionsMarkup: Widget container with header actions and scrollable contentStyling: 480px × 320px
  desktop, 52px item height, rank circlesBehavior: Hover states, "View All" actions, loading skeletons

  Dashboard Grid System

  Role: Responsive container for widget layoutMarkup: CSS Grid with named areas and slot-based contentStyling: Auto-fit columns with min-max
  sizingBehavior: Responsive breakpoint adaptation

  ---
  4. Layout System & Structure

  Grid Strategy

  Desktop (1280px+): 12-column CSS Grid with 3-row layout
  - Row 1: 4 KPI cards (1:1:1:1 ratio)
  - Row 2: 3 principal widgets (1:1:1 ratio)

  Tablet (768px-1279px): Flexible 2-column or stacked based on orientation
  Mobile (≤767px): Single column stack with touch optimization

  Responsive Breakpoints

  /* Mobile First Approach */
  320px: Single column, touch targets
  768px: Tablet layout, gesture support
  1280px: Desktop grid system
  2560px: Ultrawide constraints (max 1600px width)

  Spacing System

  /* Responsive gaps using clamp() */
  gap: clamp(8px, 2vw, 16px);   /* Mobile */
  gap: clamp(16px, 2.5vw, 24px); /* Tablet */
  gap: clamp(24px, 3vw, 40px);   /* Desktop */
  gap: clamp(48px, 2vw, 80px);   /* Ultrawide */

  Container Strategy

  .dashboard-content {
    width: min(100% - 2rem, 1200px);
    margin: 0 auto;
    padding: var(--dashboard-content-padding);
  }

  ---
  5. Design Consistency Blueprint (for New Components)

  Typography Rules

  /* Responsive scaling with clamp() */
  .dashboard-title: clamp(1.5rem, 4vw, 2.5rem)
  .widget-title: clamp(1rem, 2.5vw, 1.5rem)
  .greeting-text: clamp(1rem, 2vw, 1.25rem)

  /* Font weights */
  font-weight: 400 (normal), 500 (medium), 600 (semibold), 700 (bold)

  Component Spacing & Sizing Units

  /* Touch targets (WCAG 2.5.5 compliant) */
  --touch-target: 48px (recommended)
  --touch-target-sm: 44px (minimum)

  /* Spacing scale */
  --spacing-xs: 4px, --spacing-sm: 8px, --spacing-md: 16px
  --spacing-lg: 24px, --spacing-xl: 32px

  Color & Shadow Usage

  - Primary Actions: Use --primary with --primary-hover on interaction
  - Secondary Actions: Use --bg-secondary with border
  - Danger Actions: Use --danger for destructive operations
  - Card Shadows: Progress from --shadow-sm → --shadow-lg on hover

  Border Radius Patterns

  /* Consistent rounding */
  border-radius: 8px;  /* Standard for cards, buttons */
  border-radius: 50%;  /* Circles (avatars, rank indicators) */
  border-radius: 4px;  /* Small elements (badges, inputs) */

  Hover/Focus Patterns

  /* Interactive state transitions */
  transition: all var(--duration-fast) ease; /* 150ms for micro-interactions */
  transition: all var(--duration-normal) ease; /* 300ms for major state changes */

  /* Standard hover effects */
  :hover { transform: translateY(-1px); box-shadow: var(--shadow-md); }
  :focus { outline: 2px solid var(--primary); outline-offset: 2px; }
  :active { transform: scale(0.95); }

  Animation Guidelines

  /* Preferred easings */
  --ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.275)
  --ease-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55)

  /* Reduced motion support */
  @media (prefers-reduced-motion: reduce) {
    * { animation-duration: 0.01ms !important; }
  }

  Component Architecture Pattern

  1. Props Interface: TypeScript with defaults
  2. Slot Architecture: Named slots for flexibility
  3. Event System: Emit-based with descriptive names
  4. Styling: Scoped styles with CSS custom properties
  5. Accessibility: ARIA labels, screen reader support, keyboard navigation

  New Component Checklist

  - Touch targets ≥44px minimum
  - Color contrast ≥4.5:1 for text, ≥3:1 for UI elements
  - Keyboard navigation support
  - Loading and error states
  - Responsive behavior across all breakpoints
  - Motion respects prefers-reduced-motion
  - Focus indicators meet WCAG standards

  This design system ensures new components will seamlessly integrate with the existing Mission Control Dashboard aesthetic while maintaining
  accessibility and responsive behavior across all device types.
```
