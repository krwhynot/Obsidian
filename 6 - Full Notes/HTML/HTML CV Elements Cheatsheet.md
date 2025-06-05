# HTML CV Elements Cheatsheet

## Document Structure

|Element|Description|Example|
|---|---|---|
|`<!DOCTYPE html>`|Defines the document type and HTML version|`<!DOCTYPE html>`|
|`<html>`|Root element of an HTML page|`<html lang="en">...</html>`|
|`<head>`|Container for metadata|`<head>...</head>`|
|`<body>`|Contains the visible page content|`<body>...</body>`|
|`<main>`|Specifies the main content of the document|`<main>...</main>`|

## Meta Tags (Head Section)

|Element|Description|Example|
|---|---|---|
|`<title>`|Defines the document title|`<title>Your Name - CV</title>`|
|`<meta charset>`|Specifies character encoding|`<meta charset="UTF-8">`|
|`<meta name="viewport">`|Controls viewport settings for responsive design|`<meta name="viewport" content="width=device-width, initial-scale=1.0">`|
|`<meta name="description">`|Provides a description for search engines|`<meta name="description" content="Professional CV of...">`|
|`<meta name="author">`|Specifies the document's author|`<meta name="author" content="Your Name">`|
|`<meta name="keywords">`|Lists keywords for search engines|`<meta name="keywords" content="CV, skills">`|

## Open Graph Tags

|Element|Description|Example|
|---|---|---|
|`<meta property="og:title">`|Title for social media sharing|`<meta property="og:title" content="Your Name - CV">`|
|`<meta property="og:description">`|Description for social media sharing|`<meta property="og:description" content="Professional CV">`|
|`<meta property="og:type">`|Type of content|`<meta property="og:type" content="profile">`|
|`<meta property="og:url">`|Canonical URL|`<meta property="og:url" content="https://example.com">`|
|`<meta property="og:image">`|Image for social media sharing|`<meta property="og:image" content="image-url.jpg">`|

## Favicon

|Element|Description|Example|
|---|---|---|
|`<link rel="icon">`|Links to a favicon|`<link rel="icon" href="favicon.ico" type="image/x-icon">`|
|`<link rel="apple-touch-icon">`|Icon for iOS devices|`<link rel="apple-touch-icon" href="apple-touch-icon.png">`|

## Semantic Structure Elements

|Element|Description|Example|
|---|---|---|
|`<header>`|Introductory content or navigational links|`<header>...</header>`|
|`<section>`|Standalone section of a document|`<section id="experience">...</section>`|
|`<article>`|Self-contained composition|`<article>...</article>`|
|`<footer>`|Footer for a document or section|`<footer>...</footer>`|
|`<address>`|Contact information|`<address>Email: example@mail.com</address>`|

## Heading Elements

|Element|Description|Example|
|---|---|---|
|`<h1>`|Most important heading (your name)|`<h1>Your Name</h1>`|
|`<h2>`|Section headings (Experience, Education, etc.)|`<h2>Work Experience</h2>`|
|`<h3>`|Sub-section headings (Job titles, etc.)|`<h3>Software Engineer</h3>`|

## Text Elements

|Element|Description|Example|
|---|---|---|
|`<p>`|Paragraph|`<p>A brief description about yourself.</p>`|
|`<strong>`|Important text (bold)|`<strong>Key skill</strong>`|
|`<em>`|Emphasized text (italic)|`<em>Relevant detail</em>`|
|`<time>`|Defines a date/time|`<time datetime="2023-12">December 2023</time>`|
|`<span>`|Inline container|`<span>Additional info</span>`|

## List Elements

|Element|Description|Example|
|---|---|---|
|`<ul>`|Unordered list|`<ul><li>Skill 1</li><li>Skill 2</li></ul>`|
|`<ol>`|Ordered list|`<ol><li>Step 1</li><li>Step 2</li></ol>`|
|`<li>`|List item|`<li>List item</li>`|
|`<dl>`|Description list|`<dl><dt>Term</dt><dd>Description</dd></dl>`|
|`<dt>`|Term in a description list|`<dt>Technical Skills</dt>`|
|`<dd>`|Description in a description list|`<dd>HTML, CSS, JavaScript</dd>`|

## Link Elements

|Element|Description|Example|
|---|---|---|
|`<a>`|Hyperlink|`<a href="https://example.com">Link text</a>`|
|`<a>` with mailto|Email link|`<a href="mailto:example@mail.com">Email me</a>`|
|`<a>` with tel|Phone number link|`<a href="tel:+1234567890">Call me</a>`|
|`<a>` with target|Open link in new tab|`<a href="url" target="_blank">New tab</a>`|

## CV-Specific ID Attributes

|ID|Purpose|Example|
|---|---|---|
|`id="summary"`|Professional summary section|`<section id="summary">...</section>`|
|`id="experience"`|Work experience section|`<section id="experience">...</section>`|
|`id="education"`|Education section|`<section id="education">...</section>`|
|`id="skills"`|Skills section|`<section id="skills">...</section>`|
|`id="projects"`|Projects section|`<section id="projects">...</section>`|
|`id="certifications"`|Certifications section|`<section id="certifications">...</section>`|