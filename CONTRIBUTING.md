# Contributing

## Information content

- The project is structured in a way, that the trainee can learn the basics of IT infrastructure and coding.
- This project is not meant to be a complete documentation of all topics, but rather a starting point for the trainee to learn the basics and then continue to learn on their own.
  - The several topics should contain some basic information, but not too much.
  - They mainly contain links to further information and tutorials.
  - Preferably, the trainee should get a task to do, which they have to solve on their own.
  - At the end of each topic, it would be nice to have a quiz to test the knowledge of the trainee.

!!! note

    This project should just be a framework curriculum for the Traineeship as an IT specialist for system integration

## File Check

Please run the `file_check.py` script after making changes to the files in this repository. This script will check for missing `index.md` files in the `docs` directory. This will provide a better user experience for the website.
It will also check empty files.

## Navigation

The navigation gets build from the `.pages` files in the folders and subfolders (`awesome-pages` plugin).

If no `.pages` file is present, all files in the folder will be shown in the navigation (that's fine).

But if you create a `.pages` file, you should put `...` in it, so if some files are added to the folder, they will be shown in the navigation automatically.

### Example

```markdown
nav:

- index.md
- virtualbox.md
- proxmox.md
- docker.md
- kubernetes.md
- ...
```

!!! note

    The `...` is not a comment, it's a placeholder for the files in the folder.

## Quizzes

To create a quiz in this project, see [mkdocs_quiz](https://github.com/skyface753/mkdocs-quiz).

Quizzes are used to test the knowledge of the trainee. They should be used (but not needed) at the end of each topic.

## Admonitions

### Goal

Define the goals of the current topic at the **end** of the topic.

```markdown
!!! goal

    Goals for this section:

    - Learn how to use admonitions
    - Learn how to use admonitions in admonitions
```

## Custom classes

There are some custom classes defined in the `docs/assets/css/extra.css` file.

### Images

Possible classes for images:

- `.image-small`
- `.image-medium`
- `.image-large`
- `.image-x-large`

Use them like this:

```markdown
![Image](../../assets/images/image.jpg){: .image-medium}
```
