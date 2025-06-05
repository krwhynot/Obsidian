# Structuring Your CV with Semantic HTML

Semantic HTML uses tags that clearly describe their meaning and purpose, which helps both browsers and humans understand your document structure. Here's how to organize your CV content semantically:

## 1. Header Section

The `<header>` element is perfect for your CV's top section:

```html
<header>
    <h1>Your Name</h1>
    <h2>Professional Title</h2>
    <address>
        <a href="mailto:your.email@example.com">your.email@example.com</a>
        <a href="tel:+1234567890">123-456-7890</a>
        <a href="https://linkedin.com/in/yourprofile" target="_blank">LinkedIn</a>
        <p>City, State</p>
    </address>
</header>
```

## 2. Professional Summary

Use the `<section>` element with a descriptive ID:

```html
<section id="summary">
    <h2>Professional Summary</h2>
    <p>A concise paragraph highlighting your professional background, key strengths, and career goals.</p>
</section>
```

## 3. Education Section

```html
<section id="education">
    <h2>Education</h2>
    <article>
        <h3>Degree Name</h3>
        <p>Institution Name</p>
        <p>Graduation Year</p>
        <ul>
            <li>Notable achievement or honor</li>
            <li>Relevant coursework</li>
        </ul>
    </article>
    <!-- Repeat article elements for each education entry -->
</section>
```

## 4. Skills Section

```html
<section id="skills">
    <h2>Skills</h2>
    <ul>
        <li>Skill Category 1</li>
        <li>Skill Category 2</li>
        <li>Skill Category 3</li>
    </ul>
    <!-- Alternative: Use dl for categorized skills -->
    <dl>
        <dt>Technical Skills</dt>
        <dd>HTML, CSS, JavaScript</dd>
        
        <dt>Soft Skills</dt>
        <dd>Communication, Teamwork, Leadership</dd>
    </dl>
</section>
```

## 5. Work Experience

```html
<section id="experience">
    <h2>Work Experience</h2>
    <article>
        <h3>Job Title</h3>
        <p><strong>Company Name</strong> | <time datetime="2020-01">Jan 2020</time> - <time datetime="2023-01">Present</time></p>
        <ul>
            <li>Key responsibility or achievement</li>
            <li>Another responsibility or achievement</li>
            <li>Quantifiable accomplishment with metrics</li>
        </ul>
    </article>
    <!-- Repeat article elements for each job -->
</section>
```

## 6. Projects or Portfolio (Optional)

```html
<section id="projects">
    <h2>Projects</h2>
    <article>
        <h3>Project Name</h3>
        <p>Brief description of the project and your role.</p>
        <a href="project-url" target="_blank">View Project</a>
    </article>
    <!-- Repeat for each project -->
</section>
```

## 7. Footer

```html
<footer>
    <p>&copy; <time datetime="2024">2024</time> Your Name. All rights reserved.</p>
    <p>References available upon request.</p>
</footer>
```

## Key Semantic HTML Benefits:

1. **Accessibility**: Screen readers can better navigate your content
2. **SEO**: Search engines understand your document structure
3. **Maintainability**: Clearer code organization for future updates
4. **Device Compatibility**: Better adaptation to different screen sizes
5. **Future-Proofing**: Easier to add CSS styling later

Would you like me to put all these sections together into a complete CV template?