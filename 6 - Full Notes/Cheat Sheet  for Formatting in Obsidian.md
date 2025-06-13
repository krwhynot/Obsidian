


# Formatting in Obsidian

How to be able to quote something. 

>"Here's a list, but I wanna quote it. "


Here's a cheat sheet for common Obsidian formatting, which uses Markdown syntax. This will help you quickly format text, create lists, add links, insert images, and more while using Obsidian for note-taking.

### Obsidian Markdown Formatting Cheat Sheet

#### 1. **Headings**
```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```

#### 2. **Text Formatting**
- **Bold**: `**bold text**` → **bold text**
- *Italic*: `*italic text*` → *italic text*
- ***Bold and Italic***: `***bold and italic text***` → ***bold and italic text***
- ~~Strikethrough~~: `~~strikethrough~~` → ~~strikethrough~~

#### 3. **Lists**
- **Unordered List**:
  ```markdown
  - Item 1
  - Item 2
    - Sub-item 2.1
    - Sub-item 2.2
  ```
- **Ordered List**:
  ```markdown
  1. Item 1
  2. Item 2
     1. Sub-item 2.1
     2. Sub-item 2.2
  ```

#### 4. **Checklists (Task List)**
```markdown
- [ ] Task not completed
- [x] Task completed
```

#### 5. **Links and Files**
- **Internal Link** (link to another note):  
  `[[Note Title]]`
- **Internal Link with Alias**:  
  `[[Note Title|Custom Text]]`
- **External Link**:  
  `[Link Text](https://example.com)`

#### 6. **Images**
- **Embed an Image**:  
  `![[image.png]]`
- **Embed an Image from a URL**:  
  `![Alt Text](https://example.com/image.png)`

#### 7. **Blockquotes**
```markdown
> This is a blockquote.
>> Nested blockquote.
```

#### 8. **Code**
- **Inline Code**:  
  `` `inline code` ``
- **Code Block**:  
  \`\`\`  
  code block  
  \`\`\`

#### 9. **Tables**
```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Row 1    | Data     | Data     |
| Row 2    | Data     | Data     |
```

#### 10. **Horizontal Line**
```markdown
---
```

#### 11. **Callouts**
- Use `>` followed by `[!info]`, `[!note]`, `[!warning]`, etc.
```markdown
> [!info] This is an info callout.
> [!note] This is a note callout.
> [!warning] This is a warning callout.
```

#### 12. **Embedding Content**
- **Embed Note**:  
  `![[Note Title]]`
- **Embed Section of a Note**:  
  `![[Note Title#Section Heading]]`
- **Embed Blocks**:  
  `![[Note Title^blockID]]`

#### 13. **Tags**
- Use hashtags to add tags:  
  `#tagname`

#### 14. **Footnotes**
```markdown
Here is a sentence with a footnote.[^1]

[^1]: This is the footnote text.
```

#### 15. **Math and Diagrams**
- **Math Block**:  
  `$$ e = mc^2 $$`
- **Mermaid Diagrams**:  
  \`\`\`mermaid  
  graph TD  
  A-->B  
  B-->C  
  \`\`\`

### Tips
- You can combine these elements to create complex notes.
- Use keyboard shortcuts (like `Ctrl + B` for bold) for faster formatting.

This cheat sheet covers the essentials of Obsidian Markdown formatting to enhance your note-taking experience!