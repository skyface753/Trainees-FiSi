from mkdocs.config.defaults import MkDocsConfig
from mkdocs.plugins import BasePlugin
from mkdocs import utils
from mkdocs.structure.files import Files, File
from mkdocs.structure.pages import Page

"""
Generate a quiz in your markdown document.
Use the following syntax to create a quiz:

quiz-start
quiz-question: Are you ready?
quiz-answer-correct: Yes!
quiz-answer: No!
quiz-answer: Maybe!
quiz-content:
# Hello World
quiz-end


This will generate a quiz with a button to show the answer.
<div class="quiz">
    <h3>Are you ready?</h3>
    <form>
        <fieldset>
            <div>
                <input type="radio" name="answer" value="0">
                <label>Yes!</label>
            </div>
            <div>
                <input type="radio" name="answer" value="1">
                <label>No!</label>
            </div>
            <div>
                <input type="radio" name="answer" value="2">
                <label>Maybe!</label>
            </div>
        </fieldset>
        <button type="button" class="quiz-button">Show Answer</button>
    </form>
    <section class="hidden">
        <h1>Hello World</h1>
    </section>
</div>
"""
from importlib import resources as impresources
from . import css, js

inp_file = (impresources.files(css) / 'quiz.css')
with inp_file.open("rt") as f:
    style = f.read()

style = '<style type="text/css">{}</style>'.format(style)

js_file = (impresources.files(js) / 'quiz.js')
with js_file.open("rt") as f:
    js = f.read()

js = '<script type="text/javascript" defer>{}</script>'.format(js)


class MkDocsQuizPlugin(BasePlugin):
    def __init__(self):
        self.enabled = True
        self.dirty = False

    def on_startup(self, *, command, dirty: bool) -> None:
        """Configure the plugin on startup."""
        self.dirty = dirty
        utils.log.info("MkDocsQuizPlugin enabled: {}".format(self.enabled))

    def on_page_markdown(self, markdown, page, config, **kwargs):
        # utils.log.info(markdown)
        # Get the substring between quiz-start and quiz-end
        # First check if the quiz-start and quiz-end are present
        if "quiz-start" in markdown and "quiz-end" in markdown:
            # Get the substring between quiz-start and quiz-end
            quiz = markdown.split("quiz-start")[1].split("quiz-end")[0]
            quiz_lines = quiz.splitlines()
            # TODO: Dont remove empty lines in quiz-content
            quiz_lines = list(filter(None, quiz_lines))
            question = quiz_lines[0].split("quiz-question: ")[1]
            answers = quiz_lines[1: quiz_lines.index("quiz-content:")]
            correct_answer = list(filter(lambda x: x.startswith(
                "quiz-answer-correct: "), answers))[0].split("quiz-answer-correct: ")[1]
            answers = list(
                map(lambda x: x.startswith("quiz-answer-correct: ") and x.split("quiz-answer-correct: ")[1] or x.startswith("quiz-answer: ") and x.split("quiz-answer: ")[1], answers))
            full_answers = []
            for i in range(len(answers)):
                is_correct = answers[i] == correct_answer
                full_answers.append('<div><input type="radio" name="answer" value="{}" {}><label>{}</label></div>'.format(
                    i, is_correct and "correct" or "", answers[i]))
            # Get the content of the quiz
            content = quiz_lines[quiz_lines.index("quiz-content:") + 1:]
            utils.log.info("Content: {}".format(content))
            quiz = '<div class="quiz"><h3>{}</h3><form><fieldset>{}</fieldset><button type="submit" class="quiz-button">Show Answer</button></form><section class="content hidden">{}</section></div>'.format(
                question, "".join(full_answers), "<br>".join(content))
            old_quiz = markdown.split("quiz-start")[1].split("quiz-end")[0]
            old_quiz = "quiz-start" + old_quiz + "quiz-end"
            markdown = markdown.replace(old_quiz, quiz)
        return markdown

    def on_page_content(self, html: str, *, page: Page, config: MkDocsConfig, files: Files) -> str | None:

        html = html + style + js
        return html

    # def on_files(self, files: Files, *, config: MkDocsConfig) -> Files | None:
        # for file in files:
        #     utils.log.info("File: {}".format(file))
        # # Append the css file to the files
        # cssFile = File("quiz.css")
        # utils.log.info("CSS File: {}".format(cssFile))
        # files.append(cssFile)
        # return files
        # return super().on_files(files, config=config)
