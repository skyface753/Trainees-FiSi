function quizHandler() {
  // const wholeDiv = document.createElement('div');
  const quiz = document.getElementById('quiz');
  const hiddenSolution = document.getElementById('hidden-solution');
  if (!quiz || !hiddenSolution) {
    console.log('No quiz or solution found');
    console.log('Please add the following Meta to your markdown file:');
    console.log(
      `---\nquestion: Are you ready?\nanswers:\n\t- Yes!\n\t- No!\nanswerStyle: code\nanswerIndex: 0\n---`
    );
    console.log(
      'For the solution add the following to the content of the markdown file:'
    );
    console.log(`<div id="solution">Hello WORLD</div>`);
    return;
  }
  let solution = document.createElement('div');
  solution.id = 'solution';
  solution.innerHTML = hiddenSolution.innerHTML;

  // wholeDiv.appendChild(quiz);
  quiz.appendChild(solution);
  // Set the whole div where the solution was
  hiddenSolution.parentElement.insertBefore(quiz, hiddenSolution);
  hiddenSolution.parentElement.removeChild(hiddenSolution);
  quiz.querySelector('.question').addEventListener('submit', function (event) {
    event.preventDefault();
    // Check if any radio button is checked
    if (!quiz.querySelector('input[name="your-answer"]:checked')) {
      alert('Please select an answer');
      return;
    }
    var yourAnswerAsIndex =
      quiz.querySelector('input[name="your-answer"]:checked').value - 1;
    var realAnswer = quiz.querySelector('#real-answer').value;
    yourAnswerAsIndex = parseInt(yourAnswerAsIndex, 10);
    realAnswer = parseInt(realAnswer, 10);
    console.log(yourAnswerAsIndex);
    console.log(realAnswer);

    if (yourAnswerAsIndex === realAnswer) {
      solution.classList.add('show');
      quiz.querySelector('.wrong-answer').classList.remove('show');
      applyClasses(true);
    } else {
      solution.classList.remove('show');
      quiz.querySelector('.wrong-answer').classList.add('show');
      applyClasses(false);
    }
  });
}

quizHandler();

function applyClasses(isCorrect) {
  var radioButtons = quiz.querySelectorAll('input[name="your-answer"]');
  for (var i = 0; i < radioButtons.length; i++) {
    radioButtons[i].parentElement.classList.remove('correct');
    radioButtons[i].parentElement.classList.remove('wrong');
    radioButtons[i].classList.remove('correct');
    radioButtons[i].classList.remove('wrong');
  }
  if (isCorrect) {
    quiz
      .querySelector('input[name="your-answer"]:checked')
      .parentElement.classList.add('correct');
    quiz
      .querySelector('input[name="your-answer"]:checked')
      .classList.add('correct');
  } else {
    quiz
      .querySelector('input[name="your-answer"]:checked')
      .parentElement.classList.add('wrong');
    quiz
      .querySelector('input[name="your-answer"]:checked')
      .classList.add('wrong');
  }
}

function stringToHeadingLevel(string) {
  return parseInt(string.replace('H', ''), 10);
}
