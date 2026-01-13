# Animation Usage Guide

## Quick Reference for OneWorld Vacation Animations

### Available Animation Classes

#### Entrance Animations
```html
<!-- Fade in from below -->
<div class="animate-fade-in">Content</div>

<!-- Slide in from left -->
<div class="animate-slide-left">Content</div>

<!-- Slide in from right (index.html only) -->
<div class="animate-slide-right">Content</div>
```

#### Continuous Animations
```html
<!-- Slow pulse effect (3s) -->
<div class="animate-pulse-slow">Content</div>

<!-- Slow bounce effect (2s) -->
<div class="animate-bounce-slow">Content</div>

<!-- Shimmer gradient effect -->
<div class="bg-shimmer">Content</div>
```

#### Hover Effects
```html
<!-- Blue glow on hover -->
<div class="hover-glow-blue">Content</div>

<!-- Yellow glow on hover -->
<div class="hover-glow-yellow">Content</div>
```

#### Animation Delays
Use these to stagger animations:
```html
<div class="animate-fade-in delay-100">First</div>
<div class="animate-fade-in delay-200">Second</div>
<div class="animate-fade-in delay-300">Third</div>
<div class="animate-fade-in delay-400">Fourth</div>
```

### Example Usage Patterns

#### Feature Cards (Staggered)
```html
<div class="grid grid-cols-4 gap-8">
    <div class="animate-fade-in delay-100">
        <div class="hover-glow-blue">
            <!-- Feature 1 -->
        </div>
    </div>
    <div class="animate-fade-in delay-200">
        <div class="hover-glow-blue">
            <!-- Feature 2 -->
        </div>
    </div>
    <div class="animate-fade-in delay-300">
        <div class="hover-glow-blue">
            <!-- Feature 3 -->
        </div>
    </div>
    <div class="animate-fade-in delay-400">
        <div class="hover-glow-blue">
            <!-- Feature 4 -->
        </div>
    </div>
</div>
```

#### Call-to-Action Button
```html
<button class="bg-primary-600 hover:bg-primary-700 animate-pulse-slow hover-glow-blue">
    Book Now
</button>
```

#### Hero Section Title
```html
<h1 class="animate-fade-in">
    Welcome to OneWorld Vacation
</h1>
```

#### Image Cards with Hover
```html
<div class="group card-hover">
    <img src="..." class="transition duration-500 group-hover:scale-110">
</div>
```

### Color Classes

#### Primary (Blue)
- `bg-primary-50` - Lightest blue background
- `bg-primary-500` - Main blue background
- `bg-primary-600` - Hover blue background
- `bg-primary-700` - Deep blue background
- `text-primary-600` - Blue text
- `border-primary-100` - Light blue border

#### Accent (Yellow)
- `bg-accent-400` - Bright yellow background
- `bg-accent-500` - Golden yellow background
- `text-accent-400` - Yellow text

### Best Practices

1. **Don't Overuse Animations**
   - Use animations purposefully to guide user attention
   - Limit continuous animations (pulse, bounce) to 1-2 per page

2. **Stagger Related Elements**
   - Use delay classes for groups of similar items
   - Creates a more polished, professional feel

3. **Combine Effects**
   - Pair entrance animations with hover effects
   - Example: `animate-fade-in hover-glow-blue`

4. **Performance**
   - All animations use GPU-accelerated properties (transform, opacity)
   - Safe to use multiple animations on a page

5. **Accessibility**
   - Consider users with motion sensitivity
   - Animations are subtle and not required for functionality

### Custom Animation Timing

To create custom timing, add inline styles:
```html
<div class="animate-fade-in" style="animation-delay: 0.5s;">
    Custom delayed content
</div>
```

### Browser Support
All animations work in:
- ✅ Chrome/Edge (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Mobile browsers

---

**Need Help?**
Refer to the `THEME_UPDATE_SUMMARY.md` for complete documentation or view `theme-comparison.html` for visual examples.
