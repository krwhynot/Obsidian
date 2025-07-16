# Universal Development Standards for AI-Assisted Coding

  ## Code Quality Enforcement

  

### TypeScript Standards

- **Strict Mode Always**: Use TypeScript strict mode with comprehensive type definitions

- **Zero Any Types**: Create proper interfaces and types instead of using `any`

- **Consistent Naming**:

  - camelCase for variables and functions

  - PascalCase for components and classes

  - UPPER_CASE for constants

  - kebab-case for file names

- **Comprehensive Error Handling**: Implement try-catch blocks with specific error types

- **Documentation Requirements**: Add JSDoc comments for complex functions and business logic

  

### Code Structure Requirements

```typescript

// Example of proper TypeScript interface definition

interface GameState {

  solution: string;

  guesses: Guess[];

  currentGuess: string;

  gameStatus: 'playing' | 'won' | 'lost';

  isRevealing: boolean;

}

  

// Example of proper error handling

async function validateWord(word: string): Promise<ValidationResult> {

  try {

    const response = await api.validateWord(word);

    return { valid: true, word: response.word };

  } catch (error) {

    if (error instanceof NetworkError) {

      return { valid: false, error: 'Network connection failed' };

    }

    throw new ValidationError(`Word validation failed: ${error.message}`);

  }

}