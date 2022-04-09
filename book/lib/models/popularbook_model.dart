class PopularBookModel {
  String title, author, price, image, description;
  int color;

  PopularBookModel(
      {required this.title,
      required this.author,
      required this.price,
      required this.image,
      required this.color,
      required this.description});
}

List<PopularBookModel> populars = [
  PopularBookModel(
      title: "AI Introductory Course",
      author: "Sikander Sultan",
      price: "400",
      image: "assets/images/ai.jpg",
      color: 0xFFFFD3B6,
      description:
          "Artificial intelligence (AI) is intelligence demonstrated by machines, as opposed to the natural intelligence displayed by humans or animals. Leading AI textbooks define the field as the study of intelligent agents: any system that perceives its environment and takes actions that maximize its chance of achieving its goals. Some popular accounts use the term artificial intelligence to describe machines that mimic cognitive functions that humans associate with the human mind, such as learning and problem solving, however this definition is rejected by major AI researchers.\n\nAI applications include advanced web search engines, recommendation systems (used by YouTube, Amazon and Netflix), understanding human speech (such as Siri or Alexa), self-driving cars (e.g. Tesla), and competing at the highest level in strategic game systems (such as chess and Go), As machines become increasingly capable, tasks considered to require intelligence are often removed from the definition of AI, a phenomenon known as the AI effect.For instance, optical character recognition is frequently excluded from things considered to be AI, having become a routine technology."),
  PopularBookModel(
      title: "The C++ Programming Language",
      author: "Bjarne Stroustrup",
      price: "450",
      image: "assets/images/c++book.jpg",
      color: 0xFF2B325C,
      description:
          "C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or C with Classes. The language has expanded significantly over time, and modern C++ now has object-oriented, generic, and functional features in addition to facilities for low-level memory manipulation. It is almost always implemented as a compiled language, and many vendors provide C++ compilers, including the Free Software Foundation, LLVM, Microsoft, Intel, Oracle, and IBM, so it is available on many platforms.\n\nC++ was designed with an orientation toward system programming and embedded, resource-constrained software and large systems, with performance, efficiency, and flexibility of use as its design highlights. C++ has also been found useful in many other contexts, with key strengths being software infrastructure and resource-constrained applications, including desktop applications, video games, servers (e.g. e-commerce, web search, or databases), and performance-critical applications (e.g. telephone switches or space probes)."),
  PopularBookModel(
      title: "Theory of Computation",
      author: "Ajay Pashankar",
      price: "500",
      image: "assets/images/toc.jpg",
      color: 0xFFF7EA4A,
      description:
          "In theoretical computer science and mathematics, the theory of computation is the branch that deals with what problems can be solved on a model of computation, using an algorithm, how efficiently they can be solved or to what degree (e.g., approximate solutions versus precise ones). The field is divided into three major branches: automata theory and formal languages, computability theory, and computational complexity theory, which are linked by the question: What are the fundamental capabilities and limitations of computers?\n\nIn order to perform a rigorous study of computation, computer scientists work with a mathematical abstraction of computers called a model of computation. There are several models in use, but the most commonly examined is the Turing machine.Computer scientists study the Turing machine because it is simple to formulate, can be analyzed and used to prove results, and because it represents what many consider the most powerful possible reasonable model of computation."),
];
