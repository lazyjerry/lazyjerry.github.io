Master GitHub Copilot Customization in Visual Studio Code with Instructions and Prompt Files - Copilot That Jawn (function() { const theme = localStorage.getItem('theme') || 'auto'; const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches; const isDark = theme === 'dark' || (theme === 'auto' && prefersDark); document.documentElement.setAttribute('data-theme', theme); document.documentElement.setAttribute('data-theme-resolved', isDark ? 'dark' : 'light'); if (isDark) { document.documentElement.classList.add('theme-dark'); } else { document.documentElement.classList.add('theme-light'); } })(); :root { /\* Light theme colors \*/ --bg-primary: #ffffff; --bg-secondary: #f8f9fa; --text-primary: #212529; --text-secondary: #6c757d; --navbar-bg: #ffffff; --navbar-text: #212529; } /\* Dark theme colors \*/ html\[data-theme="dark"\], html\[data-theme-resolved="dark"\] { --bg-primary: #1a1a1a; --bg-secondary: #2d3748; --text-primary: #f7fafc; --text-secondary: #cbd5e0; --navbar-bg: #1a1a1a; --navbar-text: #f7fafc; } /\* Immediate body styling \*/ body { background-color: var(--bg-primary); color: var(--text-primary); margin: 0; transition: background-color 0.3s ease, color 0.3s ease; } /\* Immediate navbar styling \*/ .navbar { background-color: var(--navbar-bg) !important; color: var(--navbar-text) !important; } .navbar.navbar-light { background-color: var(--navbar-bg) !important; } .navbar.bg-white { background-color: var(--navbar-bg) !important; } .navbar .navbar-brand, .navbar .nav-link { color: var(--navbar-text) !important; } /\* Code block styling with word wrapping \*/ pre { white-space: pre-wrap; /\* CSS3 \*/ word-wrap: break-word; /\* IE \*/ word-break: break-word; overflow-wrap: break-word; max-width: 100%; overflow-x: hidden !important; } pre code { white-space: pre-wrap !important; }

                               window.dataLayer = window.dataLayer || \[\]; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'G-5Z6Y93FZC5');

[![Copilot That Jawn](/img/icon-100.webp) Copilot That Jawn](/)

- [Tips](/tips)
- [About](/about)
- [Contribute](/contribute)

1.  [Home](/)
2.  [Tips](/tips)
3.  [GitHub Copilot](/tips/category/github%20copilot)
4.  Master GitHub Copilot Customization in Visual Studio Code with Instructions and Prompt Files

GitHub Copilot

10 min read

July 14, 2025

# Master GitHub Copilot Customization in Visual Studio Code with Instructions and Prompt Files

Learn how to use .instructions.md and .prompt.md files to customize GitHub Copilot responses in VIsual Studio Code for consistent, project-specific AI assistance

By **Copilot That Jawn**

Intermediate Level

[#instructions-files](/tips/tag/instructions-files) [#prompt-files](/tips/tag/prompt-files) [#customization](/tips/tag/customization) [#workspace-configuration](/tips/tag/workspace-configuration) [#ai-assistance](/tips/tag/ai-assistance)

# Master Copilot Customization with Instructions and Prompt Files

Take your GitHub Copilot experience to the next level by leveraging Visual Studio Code's powerful customization features: instructions files and prompt files. These tools allow you to create consistent, project-specific AI responses that understand your coding standards, preferences, and common workflows.

> **Reference**: This guide is based on the official \[Visual Studio Code Copilot Customization Documentation\](https://code.visualstudio.com/docs/copilot/copilot-customization). For the most up-to-date technical details and API changes, refer to the official documentation.

## Understanding the Customization Ecosystem

Visual Studio Code offers three main ways to customize Copilot responses:

1.  **`.github/copilot-instructions.md`** - Global project instructions
2.  **`.instructions.md` files** - Granular, context-specific instructions
3.  **`.prompt.md` files** - Reusable prompt templates for common tasks

## Setting Up Instructions Files

### Global Project Instructions

Create a `.github/copilot-instructions.md` file at your project root for project-wide guidelines:

    ---
    # Example: .github/copilot-instructions.md
    ---

    # Project Coding Standards

    ## General Guidelines
    - Use TypeScript for all new JavaScript code
    - Follow functional programming patterns when possible
    - Prefer composition over inheritance
    - Write comprehensive JSDoc comments for all public APIs

    ## Testing Requirements
    - Include unit tests for all business logic
    - Use Jest for testing framework
    - Aim for 80%+ code coverage
    - Write integration tests for API endpoints

    ## Error Handling
    - Always use proper error boundaries in React components
    - Log errors with structured logging
    - Return meaningful error messages to users
    - Handle async operations with proper try-catch blocks

**Enable Global Instructions:**

1.  Open Visual Studio Code settings (Ctrl+Shift+P → "Preferences: Open Settings")
2.  Search for `github.copilot.chat.codeGeneration.useInstructionFiles`
3.  Set to `true`

![](/article-images/75713bca437ed0b6/original.png)

### Granular Instructions Files

Create targeted `.instructions.md` files for specific scenarios:

#### Understanding Instructions File Naming and Frontmatter

Instructions files must follow the naming convention: `[name].instructions.md`

**File Naming Examples:**

- `react.instructions.md` - React component guidelines
- `database.instructions.md` - Database development patterns
- `testing.instructions.md` - Testing best practices
- `api-endpoints.instructions.md` - API development standards
- `typescript.instructions.md` - TypeScript coding conventions
- `security.instructions.md` - Security review guidelines

**File Location Options:**

- **Workspace**: `.github/instructions/` folder (default)
- **User Profile**: `%APPDATA%\Code\User\instructions\` (Windows)
- **Custom Locations**: Configure via `chat.instructionsFilesLocations` setting

The frontmatter section at the top of `.instructions.md` files uses YAML syntax and supports several key properties:

    ---
    applyTo: "glob-pattern"           # Required: Specifies which files to apply instructions to
    description: "Brief description"  # Optional: Describes what the instructions do
    ---

**Key Frontmatter Properties:**

- **`applyTo`**: Controls when instructions are automatically applied

  - `"**"` - Apply to all files in the workspace
  - `"**/*.ts"` - Apply only to TypeScript files
  - `"**/*.{tsx,jsx}"` - Apply to React component files
  - `"**/tests/**/*.ts"` - Apply only to test files
  - `"src/components/**/*"` - Apply to files in specific directories

- **`description`**: Brief explanation shown when hovering over the instruction file in chat view

**Complete File Examples with Suggested Names:**

**File: `react.instructions.md`**

    ---
    applyTo: "**/*.{tsx,jsx}"
    description: "React component development guidelines"
    ---

**File: `database.instructions.md`**

    ---
    applyTo: "**/models/**/*.ts"
    description: "Entity Framework patterns and database guidelines"
    ---

**File: `testing.instructions.md`**

    ---
    applyTo: "**/tests/**/*.{ts,js}"
    description: "Testing best practices and patterns"
    ---

**File: `api-endpoints.instructions.md`**

    ---
    applyTo: "src/api/**/*.ts"
    description: "RESTful API endpoint development guidelines"
    ---

#### Framework-Specific Instructions

**Example File: `react.instructions.md`**

    ---
    applyTo: "**/*.{tsx,jsx}"
    description: "React component development guidelines"
    ---

    # React Component Instructions

    ## Component Structure
    - Use functional components with hooks
    - Implement proper prop validation with TypeScript interfaces
    - Extract custom hooks for reusable logic
    - Use React.memo for performance optimization when needed

    ## State Management
    - Use useState for local component state
    - Use useReducer for complex state logic
    - Implement custom hooks for shared state logic
    - Avoid prop drilling - use Context API when appropriate

    ## Styling
    - Use CSS Modules or styled-components
    - Follow BEM methodology for class naming
    - Implement responsive design with mobile-first approach
    - Use CSS custom properties for theming

#### Database-Specific Instructions

**Example File: `database.instructions.md`**

    ---
    applyTo: "**/models/**/*.ts"
    description: "Database model and query guidelines"
    ---

    # Database Development Guidelines

    ## Entity Framework Patterns
    - Use repository pattern for data access
    - Implement proper entity relationships
    - Include audit fields (CreatedAt, UpdatedAt, CreatedBy)
    - Use value objects for complex properties

    ## Query Optimization
    - Always use parameterized queries
    - Implement proper indexing strategies
    - Use async methods for all database operations
    - Include proper error handling for database exceptions

### Creating Instructions Files via Visual Studio Code

![](./images/instructions-newfile.png)

**Quick Creation Method:**

1.  Open Chat view in Visual Studio Code
2.  Click the "Configure Chat" button (gear icon)
3.  Select "Instructions" → "New instruction file"
4.  Choose workspace or user profile location
5.  Name your file and start writing instructions

![](/article-images/75c9e978de9a084c/original.png)

**Command Palette Method:**

- Press `Ctrl+Shift+P`
- Type "Chat: New Instructions File"
- Follow the prompts

## Mastering Prompt Files

Prompt files (`.prompt.md`) are reusable templates for common development tasks.

### Understanding Prompt File Naming and Frontmatter

Prompt files must follow the naming convention: `[name].prompt.md`

**File Naming Examples:**

- `create-react-component.prompt.md` - Generate React components
- `security-review.prompt.md` - Perform security code reviews
- `api-endpoint.prompt.md` - Create RESTful API endpoints
- `generate-tests.prompt.md` - Create unit and integration tests
- `refactor-code.prompt.md` - Code refactoring workflows
- `generate-docs.prompt.md` - Documentation generation

**File Location Options:**

- **Workspace**: `.github/prompts/` folder (default)
- **User Profile**: `%APPDATA%\Code\User\prompts\` (Windows)
- **Custom Locations**: Configure via `chat.promptFilesLocations` setting

Prompt files use YAML frontmatter to configure how the prompt should be executed:

    ---
    mode: "ask"|"edit"|"agent"        # Optional: Chat mode to use (default: "agent")
    model: "gpt-4"|"gpt-3.5-turbo"    # Optional: Specific AI model to use
    tools: ["tool1", "tool2"]         # Optional: Tools available in agent mode
    description: "Brief description"   # Optional: What the prompt does
    ---

**Frontmatter Properties Explained:**

- **`mode`**: Determines how the prompt operates

  - `"ask"` - Simple question/answer mode
  - `"edit"` - Direct file editing mode
  - `"agent"` - Full agent mode with tool access (default)

- **`model`**: Specifies which AI model to use

  - `"gpt-4"` - Most capable model for complex tasks
  - `"gpt-3.5-turbo"` - Faster, more cost-effective for simpler tasks
  - If not specified, uses the currently selected model in Visual Studio Code

- **`tools`**: Array of tool names/sets available in agent mode

  - `["typescript"]` - TypeScript-specific tools
  - `["react", "typescript"]` - Multiple tool sets
  - `["web-search", "file-system"]` - External tools
  - Configure available tools via "Configure Tools" in chat

- **`description`**: Brief explanation of the prompt's purpose (shown in UI)

**Common Frontmatter Patterns:**

    # For code generation tasks
    ---
    mode: "agent"
    model: "gpt-4"
    tools: ["typescript", "react"]
    description: "Generate React component with tests"
    ---

    # For code review tasks
    ---
    mode: "ask"
    description: "Perform security code review"
    ---

    # For file editing tasks
    ---
    mode: "edit"
    model: "gpt-4"
    description: "Refactor code following team standards"
    ---

    # For documentation tasks
    ---
    mode: "agent"
    tools: ["markdown", "web-search"]
    description: "Generate comprehensive API documentation"
    ---

### Basic Prompt File Structure

**Example File: `create-react-component.prompt.md`**

    ---
    mode: "agent"
    model: "gpt-4"
    tools: ["typescript", "react"]
    description: "Generate a React component with TypeScript"
    ---

    # Create React Component

    Create a new React component with the following requirements:

    ## Component Specifications
    - Component name: ${input:componentName:Enter component name}
    - Use TypeScript with proper interfaces
    - Include proper prop validation
    - Implement responsive design
    - Add comprehensive JSDoc comments

    ## Additional Context
    - Follow our project's coding standards: [coding-standards](.github/copilot-instructions.md)
    - Reference existing components: #src/components/
    - Use our design system: #src/styles/design-system.ts

    ## Output Requirements
    - Generate the component file
    - Create a corresponding test file
    - Include usage examples in comments
    - Export the component properly

    Selected files for context: ${selection}

### Advanced Prompt Examples

#### Security Review Prompt

**Example File: `security-review.prompt.md`**

    ---
    mode: "agent"
    description: "Perform comprehensive security review"
    ---

    # Security Code Review

    Perform a thorough security analysis of the selected code:

    ## Review Areas
    1. **Input Validation**: Check for proper sanitization and validation
    2. **Authentication**: Verify proper auth implementation
    3. **Authorization**: Ensure proper access controls
    4. **Data Exposure**: Look for sensitive data leaks
    5. **SQL Injection**: Check for parameterized queries
    6. **XSS Prevention**: Verify proper output encoding

    ## Context Files
    - Security guidelines: [security-guidelines](./docs/security.md)
    - Authentication service: #src/services/auth.ts

    ## Output Format
    Provide findings in this format:
    - **Issue**: Description of the security concern
    - **Severity**: Critical/High/Medium/Low
    - **Location**: File and line number
    - **Recommendation**: Specific fix instructions
    - **Example**: Code example showing the fix

    Selected code: ${selection}

#### API Generation Prompt

**Example File: `api-endpoint.prompt.md`**

    ---
    mode: "edit"
    description: "Generate RESTful API endpoint"
    ---

    # Generate API Endpoint

    Create a complete RESTful API endpoint with the following specifications:

    ## Requirements
    - HTTP method: ${input:method:GET|POST|PUT|DELETE}
    - Resource: ${input:resource:Enter resource name}
    - Include proper validation middleware
    - Implement error handling
    - Add comprehensive OpenAPI documentation
    - Include unit and integration tests

    ## Dependencies
    - Follow API patterns: [api-patterns](./docs/api-patterns.md)
    - Use validation schemas: #src/schemas/
    - Reference existing endpoints: #src/controllers/

    ## File Structure
    Create these files:
    - Controller: `src/controllers/${input:resource}Controller.ts`
    - Routes: `src/routes/${input:resource}Routes.ts`
    - Tests: `tests/controllers/${input:resource}Controller.test.ts`
    - Schema: `src/schemas/${input:resource}Schema.ts`

    Target location: ${workspaceFolder}/src

## Using Prompt Files

### Running Prompts

**Via Chat Input:**

- Type `/` followed by prompt name: `/create-react-component`
- Pass parameters: `/create-api-endpoint: method=POST resource=users`

![](/article-images/80e8c4af2940a3ad/original.png)

**Via Command Palette:**

- Press `Ctrl+Shift+P`
- Type "Chat: Run Prompt"
- Select your prompt file

**Via Editor:**

- Open the `.prompt.md` file
- Click the play button in the editor title
- Choose to run in current or new chat session

![](/article-images/4d3bc3202723384e/original.png)

## Advanced Customization Techniques

### Variable System

Leverage Visual Studio Code's variable system in your instructions and prompts:

    # Current workspace: ${workspaceFolder}
    # Current file: ${file}
    # Selected text: ${selectedText}
    # User input: ${input:variableName:placeholder}

### File References

Link to other files and instructions:

    # Reference other instructions
    Follow guidelines in [typescript-rules](./typescript.instructions.md)

    # Reference workspace files
    Check existing patterns: #src/utils/helpers.ts

    # Reference with markdown links
    See [API documentation](../docs/api.md) for details

![](/article-images/4012bd77d3f54cbe/original.png)

### Conditional Instructions

Create context-aware instructions using the `applyTo` property:

    ---
    applyTo: "**/tests/**/*.ts"
    description: "Testing-specific instructions"
    ---

    # Testing Guidelines
    - Use describe/it pattern for test structure
    - Include setup and teardown as needed
    - Mock external dependencies
    - Test both success and error scenarios

## Organization Strategies

### Workspace Structure

    .github/
    ├── copilot-instructions.md           # Global project instructions
    ├── instructions/                     # Specific instruction files
    │   ├── react.instructions.md         # React component guidelines
    │   ├── database.instructions.md      # Database development patterns
    │   ├── testing.instructions.md       # Testing best practices
    │   ├── api-endpoints.instructions.md # API development standards
    │   └── security.instructions.md      # Security review guidelines
    └── prompts/                          # Reusable prompt templates
        ├── create-react-component.prompt.md    # Generate React components
        ├── api-endpoint.prompt.md             # Create API endpoints
        ├── security-review.prompt.md          # Security code reviews
        ├── generate-tests.prompt.md           # Create unit/integration tests
        └── refactor-code.prompt.md            # Code refactoring workflows

![](/article-images/c55dca90d6ce2b4f/original.png)

### User Profile Instructions

Store personal preferences in your user profile:

- **Location**: `%APPDATA%\Code\User\prompts\` (Windows)
- **Sync**: Enable Settings Sync to share across devices
- **Access**: Available in all workspaces

## Team Collaboration Best Practices

### Version Control

- Commit instruction and prompt files to your repository
- Document your customization strategy in README
- Review changes to instructions like code changes
- Use descriptive commit messages for instruction updates

### Team Standards

    ---
    # Example: .github/copilot-instructions.md for team
    ---

    # Team Development Standards

    ## Code Review Requirements
    - All PRs require 2 approvals
    - Include tests for new features
    - Update documentation for API changes
    - Follow conventional commit format

    ## Architecture Decisions
    - Use clean architecture patterns
    - Implement dependency injection
    - Follow SOLID principles
    - Document architectural decisions in ADRs

### Knowledge Sharing

- Create prompt libraries for common team tasks
- Share useful instructions via team documentation
- Conduct training sessions on customization techniques
- Maintain a team wiki of best practices

## Troubleshooting Common Issues

### Instructions Not Applied

1.  **Check Settings**: Ensure `github.copilot.chat.codeGeneration.useInstructionFiles` is enabled
2.  **File Location**: Verify files are in correct directories
3.  **Syntax**: Check YAML frontmatter formatting
4.  **File Extension**: Ensure `.instructions.md` or `.prompt.md` extensions

### Conflicting Instructions

- Avoid contradictory guidelines across files
- Use specific `applyTo` patterns to prevent conflicts
- Test instruction combinations before deployment
- Document instruction hierarchy and precedence

### Performance Considerations

- Keep instruction files concise and focused
- Avoid overly complex nested references
- Monitor token usage in complex setups
- Regular review and cleanup of unused instructions

## Measuring Effectiveness

### Success Metrics

- **Consistency**: Are generated responses following your guidelines?
- **Efficiency**: Are common tasks faster with prompts?
- **Quality**: Is code quality improving with instructions?
- **Adoption**: Is the team using the customizations?

### Iterative Improvement

1.  Start with basic instructions
2.  Gather feedback from team usage
3.  Refine and expand based on common patterns
4.  Document lessons learned
5.  Share successful patterns with the team

## Advanced Integration Patterns

### CI/CD Integration

    ---
    applyTo: "**/.github/workflows/*.yml"
    description: "GitHub Actions workflow guidelines"
    ---

    # CI/CD Instructions

    ## Workflow Standards
    - Use reusable workflows when possible
    - Include proper error handling
    - Implement security scanning
    - Use environment-specific deployments
    - Include rollback procedures

### Documentation Generation

    ---
    mode: "agent"
    description: "Generate API documentation"
    ---

    # Generate API Documentation

    Create comprehensive API documentation for: ${selection}

    ## Requirements
    - OpenAPI 3.0 specification
    - Include request/response examples
    - Document error responses
    - Add authentication requirements
    - Include rate limiting information

    Reference: [API standards](./docs/api-standards.md)

## Conclusion

Instructions and prompt files transform GitHub Copilot from a general-purpose assistant into a project-aware, team-aligned development partner. Start with basic instructions, gradually build your library of prompts, and continuously refine based on your team's needs.

The key to success is consistency, team adoption, and iterative improvement. Begin with the most common tasks in your workflow, then expand your customization library as you discover new opportunities for automation and standardization.

**Next Steps:**

1.  Create your first `.github/copilot-instructions.md` file
2.  Set up project-specific instruction files
3.  Build a library of common prompt templates
4.  Share and iterate with your team
5.  Measure and improve based on usage patterns

Remember: these customizations are not just about making Copilot work better—they're about codifying your team's knowledge and best practices into reusable, scalable tools that help maintain consistency and quality across your entire codebase.

###### Share this tip:

[X](https://x.com/intent/tweet?text=Master%20GitHub%20Copilot%20Customization%20in%20Visual%20Studio%20Code%20with%20Instructions%20and%20Prompt%20Files&url=https://copilotthatjawn.com/tips/copilot-instructions-prompt-files.md) [LinkedIn](<javascript:shareLinkedIn()>) [Bluesky](https://bsky.app/intent/compose?text=Master%20GitHub%20Copilot%20Customization%20in%20Visual%20Studio%20Code%20with%20Instructions%20and%20Prompt%20Files https://copilotthatjawn.com/tips/copilot-instructions-prompt-files.md) [Mastodon](<javascript:shareMastodon()>) Copy Link

##### Related Tips

###### [Supercharge Your Development with Microsoft Docs MCP](/tips/microsoft-docs-mcp-integration.md)

Harness the power of Microsoft's official documentation directly in GitHub Copilot using the Model Context Protocol (MCP) for instant, accurate answers

GitHub Copilot 5 min

###### [Supercharge Your Testing with GitHub Copilot Agent Mode](/tips/using-copilot-agent-for-unit-tests.md)

Learn how to leverage GitHub Copilot's Agent mode to efficiently generate and maintain comprehensive unit tests

GitHub Copilot 2 min

###### [Refactor Legacy Code Faster with GitHub Copilot](/tips/refactor-legacy-code-with-copilot.md)

Modernize, clean up, and optimize your codebase across .NET, Python, TypeScript, and JavaScript using GitHub Copilot's AI-powered suggestions.

GitHub Copilot 2 min

###### Explore More Tips

Discover more AI productivity tips and tricks

[Back to All Tips](/tips) [More from GitHub Copilot](/tips/category/github%20copilot)

.btn-outline-x { color: #563ACC; border-color: #563ACC; font-weight: bold; } .btn-outline-x:hover { color: #fff; background-color: #563ACC; border-color: #563ACC; } .btn-outline-purple { color: #563ACC; border-color: #563ACC; } .btn-outline-purple:hover { color: #fff; background-color: #563ACC; border-color: #563ACC; } .tip-content { line-height: 1.8; font-size: 1.1rem; } /\* Copy button styles for code blocks \*/ .tip-content pre { position: relative !important; } .tip-content .copy-button { position: absolute !important; right: 0.5rem !important; top: 0.35rem !important; padding: 0.25rem 0.5rem !important; margin-top: 0.5rem; font-size: 0.875rem !important; line-height: 1.5 !important; color: #6c757d !important; background-color: transparent !important; border: 1px solid #6c757d !important; border-radius: 0.25rem !important; cursor: pointer !important; } .tip-content .copy-button:hover { color: #fff !important; background-color: #6c757d !important; } .tip-content .copy-button.success { color: #fff !important; background-color: #198754 !important; border-color: #198754 !important; } .tip-content h1, .tip-content h2, .tip-content h3, .tip-content h4, .tip-content h5, .tip-content h6 { margin-top: 2rem; margin-bottom: 1rem; } .tip-content p { margin-bottom: 1.5rem; } .tip-content code { font-family: Consolas, monospace; padding: 0.2rem 0.4rem; border-radius: 0.25rem; font-size: 0.9em; } .tip-content pre { padding: 1rem; border-radius: 0.375rem; overflow-x: auto; margin-bottom: 1.5rem; } /\* Ensure Prism.js styles take precedence over our generic styles \*/ .tip-content pre\[class\*="language-"\] { padding: 1rem !important; border-radius: 0.5rem !important; overflow-x: auto !important; margin-bottom: 1.5rem !important; } .tip-content code\[class\*="language-"\] { font-family: Consolas, monospace !important; font-size: inherit !important; padding-top: 0 !important; display: block !important; } .tip-content blockquote { border-left: 4px solid #0d6efd; padding-left: 1rem; margin: 1.5rem 0; font-style: italic; } .tip-content img { max-width: 100%; height: auto; border-radius: 0.375rem; margin: 1rem 0; } @media (max-width: 991.98px) { .sticky-top { position: static !important; } } function shareLinkedIn() { const url = window.location.href; const title = "Master GitHub Copilot Customization in Visual Studio Code with Instructions and Prompt Files"; // Use LinkedIn's post creation with pre-populated content // This method ensures both title and URL are included in the post let linkedinUrl = \`https://www.linkedin.com/shareArticle?mini=true&url=${encodeURIComponent(url)}&title=${encodeURIComponent(title)}\`; // Add source linkedinUrl += \`&source=CopilotThatJawn\`; window.open(linkedinUrl, '\_blank', 'width=550,height=400'); } function shareMastodon() { // Prompt for Mastodon instance const instance = prompt("Enter your Mastodon instance URL (e.g., mastodon.social):", "mastodon.social"); if (instance) { // Construct share URL const text = "Master GitHub Copilot Customization in Visual Studio Code with Instructions and Prompt Files"; const url = window.location.href; const shareUrl = \`https://${instance}/share?text=${encodeURIComponent(text)}&url=${encodeURIComponent(url)}\`; window.open(shareUrl, '\_blank'); } } function copyToClipboard() { navigator.clipboard.writeText(window.location.href).then(function() { // Show success message const button = event.target.closest('button'); const originalText = button.innerHTML; button.innerHTML = '<i class="bi bi-check"></i> Copied!'; button.classList.remove('btn-outline-secondary'); button.classList.add('btn-success'); setTimeout(() => { button.innerHTML = originalText; button.classList.remove('btn-success'); button.classList.add('btn-outline-secondary'); }, 2000); }); } // Ensure Prism.js highlights the code blocks after content is loaded document.addEventListener('DOMContentLoaded', function() { // Wait a bit to ensure all styles are loaded setTimeout(function() { if (typeof Prism !== 'undefined') { // Remove any existing highlighting first document.querySelectorAll('pre\[class\*="language-"\] code').forEach(function(codeBlock) { if (codeBlock.hasAttribute('class')) { codeBlock.setAttribute('data-original-class', codeBlock.className); codeBlock.removeAttribute('class'); } codeBlock.className = codeBlock.parentElement.className; }); // Re-highlight everything Prism.highlightAll(); // Handle copy button success states document.querySelectorAll('.copy-button').forEach(function(button) { button.addEventListener('click', async function() { const pre = this.closest('pre'); const code = pre.querySelector('code')?.textContent || pre.textContent; try { await navigator.clipboard.writeText(code.trim()); const originalText = button.innerHTML; button.innerHTML = '<i class="bi bi-check"></i>'; button.classList.add('success'); setTimeout(() => { button.innerHTML = originalText; button.classList.remove('success'); }, 2000); } catch (err) { console.error('Failed to copy text: ', err); } }); }); } }, 100); }); // Listen for theme changes and re-highlight code document.addEventListener('theme-changed', function(e) { // We need a small delay to ensure the CSS has been applied setTimeout(function() { if (window.Prism) { console.log('Re-highlighting code blocks after theme change to: ' + e.detail.resolvedTheme); Prism.highlightAll(); } }, 200); }); document.addEventListener('DOMContentLoaded', function() { // Track tip view Analytics.trackTipView('Master GitHub Copilot Customization in Visual Studio Code with Instructions and Prompt Files', 'GitHub Copilot'); // Track tag clicks document.querySelectorAll('a\[asp-page="/Tips/Tag"\]').forEach(function(tag) { tag.addEventListener('click', function() { Analytics.trackTagClick(this.getAttribute('asp-route-tag')); }); }); // Track social shares document.querySelectorAll('.btn\[href^="https://x.com"\], .btn\[href^="https://bsky.app"\]').forEach(function(shareBtn) { shareBtn.addEventListener('click', function() { Analytics.trackShare(this.textContent.trim(), 'tip', 'copilot-instructions-prompt-files.md'); }); }); });

![Copilot That Jawn](/img/icon-100.webp)

##### Copilot That Jawn

Expert tips and tricks for Microsoft Copilot, GitHub Copilot, and related AI tools. Level up your workflow with our curated collection of productivity hacks.

###### AI Tools

- [GitHub Copilot](https://github.com/features/copilot)
- [Microsoft 365 Copilot](https://www.microsoft.com/microsoft-365/copilot)
- [Azure AI](https://azure.microsoft.com/products/ai-services)
- [Copilot Studio](https://powerapps.microsoft.com/copilot-studio/)

###### Quick Links

- [About](/about)
- [Contact](mailto:info@copilotthatjawn.com)
- [Terms](/terms)
- [Privacy](/privacy)
- [RSS Feed](/feed.rss)

---

© 2025 Copilot That Jawn. All rights reserved.

// Fix for code highlighting in theme changes document.addEventListener('DOMContentLoaded', function() { // Initial theme setup based on current setting const resolvedTheme = document.documentElement.getAttribute('data-theme-resolved'); const prismThemeLink = document.getElementById('prism-theme'); if (prismThemeLink && resolvedTheme) { const themeUrl = resolvedTheme === 'dark' ? '/css/prism-atom-dark.css' : 'https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism.min.css'; console.log(\`Initial Prism theme setting to: ${resolvedTheme} (${themeUrl})\`); prismThemeLink.href = themeUrl; } else if (!prismThemeLink) { console.warn('Prism theme link not found, creating element'); const newLink = document.createElement('link'); newLink.id = 'prism-theme'; newLink.rel = 'stylesheet'; newLink.href = resolvedTheme === 'dark' ? '/css/prism-atom-dark.css' : 'https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism.min.css'; document.head.appendChild(newLink); } // Initial highlight if (window.Prism) { setTimeout(() => Prism.highlightAll(), 100); } // Auto mode special case - ensure system preference changes are handled window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function(e) { if (document.documentElement.getAttribute('data-theme') === 'auto') { // Update data-theme-resolved attribute const isDark = e.matches; document.documentElement.setAttribute('data-theme-resolved', isDark ? 'dark' : 'light'); // Update Prism theme on system preference change const prismThemeLink = document.getElementById('prism-theme'); if (prismThemeLink) { prismThemeLink.href = isDark ? '/css/prism-atom-dark.css' : 'https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism.min.css'; if (window.Prism) { setTimeout(() => Prism.highlightAll(), 100); } } } }); }); /\*! loadCSS. \[c\]2017 Filament Group, Inc. MIT License \*/ (function(w){ "use strict"; if(!w.loadCSS){ w.loadCSS = function(){}; } var rp = loadCSS.relpreload = {}; rp.support = (function(){ var ret; try { ret = w.document.createElement("link").relList.supports("preload"); } catch (e) { ret = false; } return function(){ return ret; }; })(); rp.bindMediaToggle = function(link){ var finalMedia = link.media || "all"; function enableStylesheet(){ if(link.addEventListener){ link.removeEventListener("load", enableStylesheet); } link.media = finalMedia; } if(link.addEventListener){ link.addEventListener("load", enableStylesheet); } link.onloadcssdefined = enableStylesheet; }; rp.poly = function(){ if(rp.support()){ return; } var links = w.document.getElementsByTagName("link"); for(var i = 0; i < links.length; i++){ var link = links\[i\]; if(link.rel === "preload" && link.getAttribute("as") === "style" && !link.getAttribute("data-loadcss")){ link.setAttribute("data-loadcss", true); rp.bindMediaToggle(link); } } }; if(!rp.support()){ rp.poly(); var run = w.setInterval(rp.poly, 500); if(w.addEventListener){ w.addEventListener("load", function(){ rp.poly(); w.clearInterval(run); }); } } })(this);
