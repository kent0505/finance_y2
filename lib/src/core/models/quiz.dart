import 'package:flutter/material.dart';

class Quiz {
  Quiz({
    required this.question,
    required this.answers,
  });

  final String question;
  final List<Answer> answers;
}

class Answer {
  Answer({
    required this.title,
    required this.isCorrect,
    this.color = Colors.white,
  });

  final String title;
  final bool isCorrect;
  Color color;
}

List<Quiz> quizesList = [
  Quiz(
    question: 'What is the value of π (pi) rounded to two decimal places?',
    answers: [
      Answer(title: '3.14', isCorrect: true),
      Answer(title: '3.15', isCorrect: false),
      Answer(title: '3.13', isCorrect: false),
      Answer(title: '3.16', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the square root of 144?',
    answers: [
      Answer(title: '12', isCorrect: true),
      Answer(title: '14', isCorrect: false),
      Answer(title: '10', isCorrect: false),
      Answer(title: '16', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is 15% of 200?',
    answers: [
      Answer(title: '30', isCorrect: true),
      Answer(title: '25', isCorrect: false),
      Answer(title: '35', isCorrect: false),
      Answer(title: '40', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which number is a prime number?',
    answers: [
      Answer(title: '17', isCorrect: true),
      Answer(title: '20', isCorrect: false),
      Answer(title: '21', isCorrect: false),
      Answer(title: '24', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the result of 7 x 8?',
    answers: [
      Answer(title: '56', isCorrect: true),
      Answer(title: '54', isCorrect: false),
      Answer(title: '55', isCorrect: false),
      Answer(title: '57', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the formula for the area of a circle?',
    answers: [
      Answer(title: 'πr²', isCorrect: true),
      Answer(title: '2πr', isCorrect: false),
      Answer(title: 'r²/2', isCorrect: false),
      Answer(title: 'πr/2', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the value of 5 factorial (5!)?',
    answers: [
      Answer(title: '120', isCorrect: true),
      Answer(title: '25', isCorrect: false),
      Answer(title: '100', isCorrect: false),
      Answer(title: '60', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which number is an irrational number?',
    answers: [
      Answer(title: '√2', isCorrect: true),
      Answer(title: '8', isCorrect: false),
      Answer(title: '0.5', isCorrect: false),
      Answer(title: '4', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'If x = 3, what is the value of 2x + 5?',
    answers: [
      Answer(title: '11', isCorrect: true),
      Answer(title: '8', isCorrect: false),
      Answer(title: '10', isCorrect: false),
      Answer(title: '13', isCorrect: false),
    ],
  ),
  Quiz(
    question:
        'What is the hypotenuse of a right triangle with legs of 3 and 4?',
    answers: [
      Answer(title: '5', isCorrect: true),
      Answer(title: '6', isCorrect: false),
      Answer(title: '7', isCorrect: false),
      Answer(title: '4.5', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the derivative of x² with respect to x?',
    answers: [
      Answer(title: '2x', isCorrect: true),
      Answer(title: 'x', isCorrect: false),
      Answer(title: 'x²', isCorrect: false),
      Answer(title: '2', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the solution to the equation 3x + 4 = 10?',
    answers: [
      Answer(title: '2', isCorrect: true),
      Answer(title: '3', isCorrect: false),
      Answer(title: '1', isCorrect: false),
      Answer(title: '4', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'How many degrees are in a right angle?',
    answers: [
      Answer(title: '90', isCorrect: true),
      Answer(title: '45', isCorrect: false),
      Answer(title: '180', isCorrect: false),
      Answer(title: '360', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the volume of a cube with side length 3?',
    answers: [
      Answer(title: '27', isCorrect: true),
      Answer(title: '9', isCorrect: false),
      Answer(title: '18', isCorrect: false),
      Answer(title: '36', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'If a = 5 and b = 2, what is the value of a² - b²?',
    answers: [
      Answer(title: '21', isCorrect: true),
      Answer(title: '25', isCorrect: false),
      Answer(title: '17', isCorrect: false),
      Answer(title: '23', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the solution to the equation 4x = 20?',
    answers: [
      Answer(title: '5', isCorrect: true),
      Answer(title: '10', isCorrect: false),
      Answer(title: '15', isCorrect: false),
      Answer(title: '4', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which of these numbers is a perfect square?',
    answers: [
      Answer(title: '49', isCorrect: true),
      Answer(title: '45', isCorrect: false),
      Answer(title: '50', isCorrect: false),
      Answer(title: '55', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the result of dividing 45 by 9?',
    answers: [
      Answer(title: '5', isCorrect: true),
      Answer(title: '6', isCorrect: false),
      Answer(title: '7', isCorrect: false),
      Answer(title: '8', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which of the following is the solution to 2² + 3²?',
    answers: [
      Answer(title: '13', isCorrect: true),
      Answer(title: '10', isCorrect: false),
      Answer(title: '12', isCorrect: false),
      Answer(title: '9', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is 3 to the power of 3?',
    answers: [
      Answer(title: '27', isCorrect: true),
      Answer(title: '9', isCorrect: false),
      Answer(title: '18', isCorrect: false),
      Answer(title: '24', isCorrect: false),
    ],
  ),
];
