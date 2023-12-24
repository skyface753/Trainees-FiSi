# Create a quiz

This is for the creator of this trainee project.

To create a quiz in this mkdocs project, you need to use the following syntax:

````markdown
<div class="quiz">
    <h3> Are you ready? </h3>
    <answers>
        <answer correct>Yes!</answer>
        <answer>No!</answer>
    </answers>
    <content> 
        <h4> Great! </h4>
        ```bash
        sudo mn --topo single,3 --mac --switch ovsk --controller remote
        ```
    </content>
</div>
````

!!! tip

    **Note** Use `<h1>`/`<h2>`... instead of `#`/`##`... for the quiz (particular in the `content` section), to prevent mkdocs adding the quiz to the table of contents.

## How it works

The quiz is parsed by a custom javascript script `docs/js/quiz.js`.

The script parses the div with the class `quiz` and creates a quiz with the following structure:

```html
<div class="quiz">
  <h3>Are you ready?</h3>
  <form>
    <!-- Fieldset for the answers -->
    <fieldset>
      <div>
        <input type="radio" name="answer" value="Yes!" /><label>Yes!</label>
      </div>
      <div>
        <input type="radio" name="answer" value="No!" /><label>No!</label>
      </div>
    </fieldset>
    <button type="submit">Submit</button>
  </form>
  <!-- Content -->
  <section class="hidden">
    <h4>Great!</h4>
    <div class="highlight">
      <pre
        id="__code_0"
      ><span></span><button class="md-clipboard md-icon" title="Copy to clipboard" data-clipboard-target="#__code_0 > code"></button><code>sudo<span class="w"> </span>mn<span class="w"> </span>--topo<span class="w"> </span>single,3<span class="w"> </span>--mac<span class="w"> </span>--switch<span class="w"> </span>ovsk<span class="w"> </span>--controller<span class="w"> </span>remote
        </code></pre>
    </div>
  </section>
</div>
```
