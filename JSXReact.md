What is JSX in React?

JSX, or JavaScript XML, is an extension to JavaScript commonly used with React.js for describing what the UI should look like. It looks similar to XML or HTML but ultimately gets transpiled to regular JavaScript objects and functions.

In JSX:

1. **XML/HTML-Like Syntax:**
   JSX allows you to write markup using a syntax similar to XML or HTML. For example:
   ```jsx
   const element = <h1>Hello, World!</h1>;
   ```

2. **Embedding Expressions:**
   You can embed JavaScript expressions inside JSX using curly braces `{}`. For example:
   ```jsx
   const name = "John";
   const element = <h1>Hello, {name}!</h1>;
   ```

3. **Attributes and Expressions:**
   JSX allows you to use HTML-like attributes. You can also use expressions for attribute values. For example:
   ```jsx
   const imageUrl = "https://example.com/image.jpg";
   const element = <img src={imageUrl} alt="Sample Image" />;
   ```

4. **Nested JSX:**
   JSX elements can be nested inside each other just like in HTML or XML. For example:
   ```jsx
   const element = (
     <div>
       <h1>Hello, World!</h1>
       <p>This is a paragraph.</p>
     </div>
   );
   ```

5. **JSX Represents Objects:**
   Browsers don't understand JSX. It needs to be transformed into JavaScript objects. This transformation is typically done by a tool like Babel during the build process. For example, the JSX code:
   ```jsx
   const element = <h1>Hello, World!</h1>;
   ```
   Transforms into:
   ```javascript
   const element = React.createElement('h1', null, 'Hello, World!');
   ```

6. **Components in JSX:**
   JSX allows you to use custom React components as if they were HTML tags. For example:
   ```jsx
   function Greeting(props) {
     return <h1>Hello, {props.name}!</h1>;
   }

   const element = <Greeting name="John" />;
   ```

JSX makes React code more readable and writing UI components more intuitive, especially for developers who are already familiar with HTML and XML-like syntax. It's important to note that even though JSX resembles HTML, it's not the same; it's a syntactic sugar over JavaScript function calls.