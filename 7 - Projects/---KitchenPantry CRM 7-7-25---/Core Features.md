# ForkFlow-CRM Mission Control Dashboard Design

## Design Rationale

The Mission Control dashboard paradigm serves as a centralized command center for managers and power users who need immediate visibility into business-critical activities. For food brokers managing restaurant relationships, this design provides:

- **Real-time Situational Awareness**: Managers can instantly see visit activities, follow-up statuses, and deal progression
- **Rapid Decision Making**: KPI bar and widgets surface critical metrics requiring immediate attention
- **Operational Efficiency**: Drag-and-drop widgets allow personalized workflows matching individual management styles
- **Mobile-First Reality**: Touch optimization ensures field managers can monitor operations from iPads during visits

## Layout Architecture

### 1. KPI Command Bar (Fixed Top)

- **Height**: 80px desktop, 64px mobile
- **Content**: 3-5 configurable metrics with real-time updates
- **Interaction**: Touch/click to drill-down into detailed metric views
- **Dark/Light**: High contrast backgrounds with semantic color coding

### 2. Responsive Grid System

```
Desktop (1280px+): 12-column grid
- Sidebar: 2 columns (240px)
- Main Grid: 10 columns (4-2-2-2 widget layout)

Tablet (768px-1279px): 8-column grid  
- Sidebar: Collapsible (48px collapsed, 200px expanded)
- Main Grid: 8 columns (4-4 or 2-2-2-2 widget layout)

Mobile (320px-767px): Single column
- Sidebar: Hidden (swipe from left to reveal)
- Main Grid: Stacked widgets with swipe navigation
```

### 3. Widget Types & Sizes

**Small Widgets (1x1)**: Quick stats, counters, mini-charts

- New leads count
- Overdue follow-ups
- Today's visits scheduled

**Medium Widgets (2x1)**: Lists, activity feeds, maps

- Recent customer interactions
- Team activity timeline
- Territory heat map

**Large Widgets (2x2)**: Complex visualizations, detailed views

- Sales pipeline funnel
- Customer relationship graph
- Revenue forecasting chart

**Full-Width Widgets (4x1)**: Tables, comprehensive lists

- Customer data grid with filters
- Deal progression board
- Team performance leaderboard

## Responsive Behavior

### Desktop Experience (1280px+)

- Full sidebar navigation always visible
- 4-column main grid supporting all widget sizes
- Hover states for enhanced interactivity
- Keyboard shortcuts for power users (Cmd/Ctrl + 1-9 for widget focus)

### Tablet Experience (768px-1279px)

- Collapsible sidebar (icon-only when collapsed)
- 2-column main grid with widget reflow
- Touch-optimized with 48px minimum targets
- Long-press for widget configuration

### Mobile Experience (320px-767px)

- Hidden sidebar with swipe gesture reveal
- Single column stacked widgets
- Horizontal swipe between widget pages
- Pull-to-refresh for real-time updates
- Bottom tab navigation for quick section access

## Performance Optimizations

### Data Loading Strategy

typescript

```typescript
// Progressive data loading with React Suspense
const DashboardWidget = lazy(() => import('./widgets/DashboardWidget'));

// Supabase real-time subscriptions with debouncing
const channel = supabase
  .channel('dashboard-updates')
  .on('postgres_changes', 
    { 
      event: '*', 
      schema: 'public',
      filter: 'user_id=eq.current_user'
    }, 
    debounce(handleRealtimeUpdate, 500)
  )
  .subscribe();
```

### Caching Strategy

- **Widget State**: localStorage for personalization (positions, sizes, visibility)
- **Data Cache**: React Query with 5-minute stale time for non-critical data
- **Real-time Data**: WebSocket connections for KPIs and activity feeds

### Bundle Optimization

- Widget lazy loading with code splitting
- CSS-in-JS for component-level styling (reduces unused CSS)
- Image optimization with next/image for avatars and charts
- Target bundle size: <200KB initial load

## Interaction Patterns

### Drag-and-Drop Implementation

typescript

```typescript
// Using @dnd-kit/sortable for touch-friendly drag-and-drop
const sensors = useSensors(
  useSensor(PointerSensor, {
    activationConstraint: {
      distance: 8, // Prevents accidental drags
    },
  }),
  useSensor(TouchSensor, {
    activationConstraint: {
      delay: 250, // Long-press activation on mobile
      tolerance: 5,
    },
  })
);
```

### Drill-Down Modals

- **Trigger**: Click/tap on widget headers or KPI metrics
- **Animation**: Slide-up on mobile, fade-scale on desktop
- **Content**: Detailed views with filtering and actions
- **Closure**: Swipe-down, ESC key, or backdrop click

### Real-Time Updates

- **Visual Feedback**: Pulse animation on data refresh
- **Update Frequency**: KPIs every 10 seconds, widgets every 30 seconds
- **Error States**: Graceful degradation with cached data display

## Theme System

### Light Theme

css

```css
--bg-primary: #ffffff;
--bg-secondary: #f8fafc;
--text-primary: #0f172a;
--accent-success: #10b981;
--accent-warning: #f59e0b;
--accent-danger: #ef4444;
```

### Dark Theme

css

```css
--bg-primary: #0f172a;
--bg-secondary: #1e293b;
--text-primary: #f8fafc;
--accent-success: #34d399;
--accent-warning: #fbbf24;
--accent-danger: #f87171;
```

## Mobile Gesture Support

### Swipe Gestures

- **Left Swipe**: Navigate to next widget page
- **Right Swipe**: Navigate to previous widget page or reveal sidebar
- **Down Swipe**: Refresh current view (with visual feedback)
- **Pinch**: Zoom in/out on map widgets

### Touch Interactions

- **Long Press**: Enter widget edit mode
- **Double Tap**: Maximize widget to full screen
- **Two-Finger Swipe**: Quick navigation between dashboard sections

## Accessibility Considerations

### WCAG 2.1 AA Compliance

- **Touch Targets**: Minimum 44x44px, recommended 48x48px
- **Color Contrast**: 4.5:1 for normal text, 3:1 for large text
- **Focus Indicators**: Visible outline for keyboard navigation
- **Screen Reader**: ARIA labels for all interactive elements

### Keyboard Navigation

- **Tab Order**: Logical flow through widgets
- **Arrow Keys**: Navigate between widgets in grid
- **Enter/Space**: Activate widget interactions
- **Escape**: Close modals and overlays

## Technical Implementation

### Component Structure

```
/components
  /dashboard
    /KPIBar
      - KPIBar.tsx
      - KPIMetric.tsx
    /Grid
      - DashboardGrid.tsx
      - GridWidget.tsx
    /Widgets
      - WidgetFactory.tsx
      - /types (various widget components)
    /Sidebar
      - DashboardSidebar.tsx
      - NavigationItem.tsx
```

### State Management

typescript

```typescript
// Zustand store for dashboard state
interface DashboardStore {
  widgets: Widget[];
  layout: LayoutConfig;
  theme: 'light' | 'dark';
  updateWidget: (id: string, data: Partial<Widget>) => void;
  reorderWidgets: (widgets: Widget[]) => void;
  toggleTheme: () => void;
}
```

### Supabase Integration

typescript

```typescript
// Real-time subscriptions for live data
useEffect(() => {
  const channel = supabase
    .channel('dashboard-metrics')
    .on('postgres_changes', 
      { event: 'UPDATE', schema: 'public', table: 'metrics' },
      (payload) => updateKPIs(payload.new)
    )
    .subscribe();

  return () => {
    supabase.removeChannel(channel);
  };
}, []);
```

## MVP Feature Set

### Core Features (Phase 1)

1. **Fixed KPI Bar** with 3 default metrics
2. **4 Essential Widgets**:
    - Today's Activity Feed
    - Customer Quick Search
    - Follow-Up Reminders
    - Team Performance Summary
3. **Basic Drag-and-Drop** for widget repositioning
4. **Theme Toggle** (light/dark)
5. **Mobile Responsive** layout

### Excluded from MVP

- Advanced widget customization
- Custom widget creation
- Export/sharing functionality
- Advanced analytics widgets
- Multi-dashboard support
- Widget marketplace

This design provides a powerful yet focused Mission Control experience that serves the immediate needs of food service CRM managers while maintaining the performance and usability required for field operations.

</design_plan>