/// 這是用來儲存問題與答案格式的class
/// 沒有主要功能
class QuizQuestion {
  const QuizQuestion({required this.question, required this.answers});

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswer =
        List.of(answers); // 複製一個list, 另外shuffle會改原本的值，但是不改記憶體位置
    shuffledAnswer.shuffle(); // shuffle會改原本的array值，但本質是回傳void
    return shuffledAnswer;
  }
}
