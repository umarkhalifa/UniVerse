

class Course {
  final String? courseCode;
  final String? courseTitle;
  final int? creditHours;
  final String? description;
  final String? status;
  final String? instructor;
  final List<dynamic>? materials;
  final List<dynamic>? pastQuestions;

  Course( {
    this.courseCode,
     this.courseTitle,
     this.creditHours,
    this.description,
     this.status,
    this.instructor = 'Not available',
    this.materials= const <String>[],
    this.pastQuestions = const <String>[]
  });

  Map<String, dynamic> toMap() {
    return {
      'courseCode': courseCode,
      'courseTitle': courseTitle,
      'creditHours': creditHours,
      'description': description,
      'status': status,
      'instructor': instructor,
      'materials': materials,
      'pastQuestions': pastQuestions,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseCode: map['courseCode'] as String,
      courseTitle: map['courseTitle'] as String,
      creditHours: map['creditHours'] as int,
      description: map['description'] as String,
      status: map['status'] as String,
      instructor: map['instructor'] as String,
      materials: map['materials'] as List<String>,
      pastQuestions: map['pastQuestions'] as List<String>,
    );
  }
}

List<Course> courses1 = [
  Course(
    courseCode: "SEN 101",
    courseTitle: "Introduction to Computing and Applications",
    creditHours: 3,
    description:
        '''Introduction to problem solving methods and algorithm development, designing, coding, 
debugging and documenting programmes using techniques of a good programming 
language style, programming language and programming algorithm development. A 
widely used programming language should be used in teaching the course. ''',
    status: "C",
    instructor: "Mrs. Gbolagade",
  ),
  Course(
    courseCode: "GNS 101",
    courseTitle: "Use of English and Library Studies I",
    creditHours: 2,
    description:
        '''Effective communication and writing in English, Language skills, writing of essay answers, 
Comprehension, Sentence construction, Outlines and paragraphs, Collection and 
organization of materials and logical presentation, Punctuation''',
    status: "C",

  ),
  Course(
    courseCode: "GNS 103",
    courseTitle: "Beginners’ Arabic Reading and Conversation I",
    creditHours: 1,
    description: '''''',
    status: "C",

  ),
  Course(
    courseCode: "MAT 101",
    courseTitle: "Algebra and Trigonometry",
    creditHours: 3,
    description: '''
Elementary set theory, subsets, union, intersection, complements,and Venn diagrams. Number systems, real number system,complex number system, real line, inequality, surds, indicesandlogarithms, mathematical induction, sequence and series, partial
fraction. Equations, polynomials, remainder theorem, completingthe square, change of variable, reciprocal equation, methodofrationalization, simultaneous equation, theory of quadraticequations, Binomial theorem, Matrices and Determinants, circularmeasure, trigonometric functions of angles of any magnitude,addition and factor formulae
''',
    status: "C",

  ),
  Course(
    courseCode: "MAT 103",
    courseTitle: "Vectors, Mechanics and Geometry",
    creditHours: 3,
    description:
        '''Geometric representation of vector in 1-3 dimensions componentsdirection cosines, scalars and vector with respect toascalarvariable. Coordinate geometry, distance between twopoints,equation of straight line, equation of a line in normal form,equation of tangent, equation of ellipse, equation of parabola,equation of hyperbola, equation of conic section, and equationof acircle. Tangents, normal, kinematics of a particle. Component ofvelocity and acceleration of a particle moving in a plane. Force,momentum, laws of motion under gravity, projectiles, resistedvertical motion, elastic string, simple pendulumimpulse impact oftwo smooth spheres, and of a sphere on a sphere''',
    status: "C",

  ),
  Course(
    courseCode: "CHM 105",
    courseTitle: "General Physical Chemistry",
    creditHours: 3,
    description:
        '''States of matter, changes of state. Colligative properties, crystal
lattice, chemical equilibrium and kinetics. Thermo chemistry and introductory thermodynamics. Electrochemistry.''',
    status: "C",

  ),
  Course(
    courseCode: "PHY 101",
    courseTitle: "Mechanics, thermal Physics & Waves",
    description:
        '''Space and Time, Units and dimension, Kinematics; Fundamental Laws of Mechanics, 
statics and dynamics; work and energy; Conservation laws. Elasticity; Hooke's law, 
Young's shear and bulk moduli, Hydrostatics; Pressure; buoyance, Archimedes' 
Principles, Surface tension; adhesion, cohesion, capillarity, drops and bubbles. 
Temperature; heat; gas laws; laws of thermodynamics; kinetic theory of gases. Sound, 
Applications. ''',
    creditHours: 3,
    status: "C",

  ),
  Course(
    courseCode: "PHY 107",
    courseTitle: "General Physics Laboratory I",
    creditHours: 1,
    description: '''''',
    status: "C",

  ),
  Course(
    courseCode: "CMP 101",
    courseTitle: "Introduction to Computer Science",
    creditHours: 3,
    description:
        '''Problem solving strategies, Role of algorithm in problem solving process, 
implementations strategies, concepts and properties of algorithm, development of flow 
chats, pseudo codes, program objects implementation of algorithm in a programming 
language, Introduction to Software Engineering, Software Development Life Cycle Model.''',
    status: "C",
    instructor: "Dr. Mustapha, Mr. Akanni & Mrs. Gbolagade",

  ),
  Course(
    courseCode: "SEN 102",
    courseTitle: "Principles of Programming I",
    creditHours: 3,
    description:
        '''Problem solving strategies, Role of algorithm in problem solving process, 
implementations strategies, concepts and properties of algorithm, development of flow 
chats, pseudo codes, program objects implementation of algorithm in a programming 
language, Introduction to Software Engineering, Software Development Life Cycle Model.''',
    status: "C",
    instructor: "Dr. Alimi",

  ),
  Course(
    courseCode: "SEN 104",
    courseTitle: "Introduction to Web Technologies",
    creditHours: 3,
    description:
        '''Introduction to Web Computing An introduction to the Internet, the World Wide Web, and 
web development students will create interactive web pages by writing HT 'and and CSS 
and by programming in JavaScript- Topics include the origins of the web, the roles and 
operations of web browsers and web servers, interacting with web applications through 
forms, and using digital media. style sheets to separate document structure and 
document formatting''',
    status: "C",
    instructor: "Mr. Ogidan",

  ),
  Course(
    courseCode: "GNS 102",
    courseTitle: "Use of English II",
    creditHours: 2,
    description:
        '''Effective communication and writing in English, Language skills, writing of essay answers, 
Comprehension, Sentence construction, Outlines and paragraphs, Collection and 
organization of materials and logical presentation, Punctuation.''',
    status: "C",

  ),
  Course(
    courseCode: "MAT 102",
    courseTitle: "Calculus",
    creditHours: 3,
    description:
        '''Calculus: Function of a real variable, graphs, limits and idea of continuity. The derivative, 
as limit of rate of change. Techniques of differentiation. Extreme curve sketching; 
29
Integration as an inverse of differentiation. Methods of integration, Definite integrals. 
Application to areas, volumes.''',
    status: "C",

  ),
  Course(
    courseCode: "GNS 104",
    courseTitle: "Islamic Faith and Practice",
    creditHours: 1,
    description: '''''',
    status: "R",

  ),
  Course(
    courseCode: "PHY 102",
    courseTitle: "Electricity, Magnetism & Modern Physics",
    creditHours: 3,
    description:
        '''Electrostatics; conductors and currents; dielectrics; magnetic fields and induction; 
Maxwell's equations; electromagnetic oscillations and waves; Applications.''',
    status: "C",

  ),
  Course(
    courseCode: "PHY 108",
    courseTitle: "General Physics Laboratory II",
    creditHours: 1,
    description: '''''',
    status: "C",

  ),
  Course(
    courseCode: "CMP 102",
    courseTitle: "Introduction to Problem Solving",
    creditHours: 3,
    description:
        '''ntroduction to problem solving methods and algorithm development, designing, coding, 
debugging and documenting programmes using techniques of a good programming 
language style, programming language and programming algorithm development. A 
widely used programming language should be used in teaching the course''',
    status: "C",

  ),
  Course(
    courseCode: "STA 102",
    courseTitle: "Statistical Inference I",
    creditHours: 3,
    description:
        '''Statistical data, their sources, collection and preliminaryanalysisby tables and graphs, measure of location and dispersion(forgrouped and ungrouped data), skewness and kurtosis; simpleregression and correlation analysis, index numbers''',
    status: "C",

  ),
  Course(
    courseCode: "STA 104",
    courseTitle: "Introduction to Probability",
    creditHours: 2,
    description:
        '''Measure of location and dispersion in simple and grouped data exponential. Elements of 
probability and probability distribution, normal, binomial, poison, geometric, Negative 
binomial distributions. Estimation and tests of hypothesis concerning the parameters of 
distribution. Regression, correlation, and analysis of variance contingency table Nonparametric inference''',
    status: "C",

  ),
];

// Future<void> uploadCourses() async {
//   for (var element in courses3) {
//     await FirebaseFirestore.instance
//         .collection("COURSES")
//         .doc('SOFTWARE ENGINEERING')
//         .collection('300 LEVEL')
//         .add(element.toMap());
//     print('added');
//   }
// }

List<Course> courses2 = [
  Course(
    courseCode: "SEN 201",
    courseTitle: "Introduction to Software Engineering",
    creditHours: 3,
    description:
        '''Software engineering concepts and principles; design, development and testing of 
software systems. Introduction to software life cycle. Requirements, design and testing. 
Review of principles of object orientation. Object oriented analysis using UML. 
Frameworks and APIs. Introduction to the client-server architecture. Analysis, design and 
programming of a team-project including user interface considerations.
''',
    status: "C",
    instructor: "Dr. Alimi",
      materials:[]

  ),
  Course(
    courseCode: "SEN 205",
    courseTitle: "Software Requirements and Design",
    creditHours: 3,
    description:
        '''Definition of a software requirement, product and process requirements, functional and 
non–functional requirements, emergent properties, quantifiable requirements, and 
system and software requirements; Requirements process – process models and actors, 
process support and management, and process quality and improvement; Requirements 
elicitation – requirements sources and elicitation techniques''',
    status: "C",
    instructor: "Dr. Alimi",
      materials:[]

  ),
  Course(
    courseCode: "SEN 207",
    courseTitle: "Computer Architecture and Organization",
    creditHours: 3,
    description:
        '''Differences between computer architecture and computer organisation, basic structure of 
computers; performance evaluation: metrics and calculations, performance equations, 
Amdahl's law; CPU organization and micro-architectural level design; Instruction set
design; register transfer; RISC design principles; data-path design; controller design; 
memory system; addressing; microprogramming; computer arithmetic; survey of real 
computers and microprocessors; peripheral devices and input/output busses; and 
introduction to parallel computing. The course is a broad introduction to all aspects of 
computer systems organization and architecture and serves as the foundation for 
subsequent computer systems courses.
''',
    status: "C",
    instructor: "Prof. R.G. Jimoh",
      materials:[]

  ),
  Course(
    courseCode: "SEN 211",
    courseTitle: "Software Construction",
    creditHours: 2,
    description:
        '''Topics include specifications, abstraction techniques including typing, access control, 
inheritance, polymorphism, genericity and design patterns, frameworks and 
architectures. Students will also learn the proper engineering use of techniques such as 
information hiding, classes, objects, inheritance, design by contract, exception handling, 
event-based systems, and concurrency. Special emphasis should be placed on suitable 
and appropriate object-oriented software development such as software quality and 
corresponding concepts, principles and best practices for addressing both functional and 
non-functional requirements of the software system in its architecture.
''',
    status: "C",
    instructor: "Mrs. Gbolagade",
      materials:[]

  ),
  Course(
    courseCode: "SEN 213",
    courseTitle: "Principle of Operating System",
    creditHours: 2,
    description:
        '''Surveys methods and algorithms used in operating systems. Concurrent distributed 
operation is emphasized. The main topics covered are an introduction to operating 
systems, process management, process scheduling, inter-process communications, 
memory management techniques, virtual memory, I/O management, deadlock 
avoidance, file system design, socket programming, distributed operation; distributed 
data; performance evaluation, protection and security. Prerequisites.''',
    status: "C",
    instructor: "Mr. Akanni",
      materials:[]

  ),
  Course(
    courseCode: "GNS 201",
    courseTitle: "Philosophy, Logic and Afro-Arab Culture I",
    creditHours: 2,
    description:
        '''A brief survey of the main branches of Philosophy Symbolic Logic Special symbols in 
symbolic Logic-conjunction, negation, affirmation, disjunction, equivalent and conditional 
statements law of tort. The method of deduction using rules of inference and biconditionals qualification theory. Types of discourse, Nature or arguments, Validity and 
soundness; Techniques for evaluating arguments; Distinction between inductive and 
deductive inferences; etc. (Illustrations will be taken from familiar texts, Including 
literature materials, Novels, Law reports and newspaper publications)''',
    status: "R",
      materials:[]

  ),
  Course(
    courseCode: "GNS 203",
    courseTitle: "Beginners’ Arabic Reading and Conversation II",
    creditHours: 1,
    description: '''''',
    status: "R",
      materials:[]

  ),
  Course(
    courseCode: "MAT 205",
    courseTitle: "Linear Algebra I",
    creditHours: 2,
    description:
        '''Vector spaces over the real field. Subspaces, linear independence, basis and dimension. 
Linear transformations and their representation by matrices; range, null space, rank. 
Singular and non-singular transformations and matrices. Algebra of matrices.''',
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "STA 209",
    courseTitle: "Statistics for Physical Sciences and Engineering I",
    creditHours: 2,
    description: '''
    Statistical estimation, estimation by methods of momentsandmaximum likelihood. Some properties of point estimators:unbiasedness, mean square error, sufficiency, efficiency,consistency, Completeness, UMVU, Best asymptotic normal.Cramer-Rao inequalities (lower bound). Interval estimationformeans, proportion and their difference. Test of hypothesis,contingency tables and test of independence''',
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "SEN 202",
    courseTitle: "Software Engineering Process",
    creditHours: 3,
    description:
        '''Software process definition – software process management and infrastructure, Software 
life cycles – categories of software processes, software life cycle models, software 
process adaptation, practical considerations; Software process assessment and 
improvement – software process assessment methods, software process improvement 
models, and continuous and staged software process rating; Software measurement –
software process and product measurement, quality of measurement results, and 
software process measurement techniques; Software engineering process tools.''',
    status: "C",
    instructor: "Mrs. T.T. Salau-Ibrahim",
      materials:[]

  ),
  Course(
    courseCode: "SEN 204",
    courseTitle: "Logic and Its Application in Computer Science",
    creditHours: 2,
    status: "C",
    description:
        '''Topics include valid and invalid arguments, translating from English to the language of 
proportional and predicate logic, formal deduction and its role in providing the validity of 
an argument: logic and computer science, how to build a circuit from logic gates and how 
to minimize circuits using propositional logic, introduction to prolog, a programming 
language based on logic and the application of logic in computer science. AI automated 
theorem- provers,, expert system etc. Fundamental concepts of computer systems and 
system programming. Hardware fundamental including digital logic, memory systems, 
processor design, buses, I/O subsystems data representations, computer arithmetic, 
microprogramming, and instruction-set, architecture. Software concepts including 
assembly language programming, operating systems, assemblers, linkers and compilers, 
computer peripherals interfacing and maintenance. ''',
    instructor: "Mr. Akanni",
      materials:[]

  ),
  Course(
    courseCode: "SEN 208",
    courseTitle: "Design and Analysis of Computer Algorithms",
    creditHours: 2,
    description:
        '''Introduction to algorithms and its importance, mathematical foundations: growth 
functions, complexity analysis of algorithms, summations, recurrences, sorting 
algorithms. Algorithm design: divide-and-conquer approach, greedy approach. Graph 
algorithms: graph searching, topological sort, minimum spanning tree, shortest paths, 
backtracking and its applications in games. String matching. Dynamic programming and 
longest common subsequence. Theory of NP-completeness. Turing machines and the 
halting problem''',
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "GNS 202",
    courseTitle: "Nigerian People, Culture & Economy",
    creditHours: 2,
    description:
        '''Study of Nigerian history, culture and arts in pre-colonial times, Nigerian’s perception of 
his world, Culture areas of Nigeria and their characteristics, Evolution of Nigeria as a 
political unit, Indigene/settler phenomenon, Concepts of trade, Economic self-reliance, 
Social justice, Individual and national development, Norms and values, Negative attitudes and conducts (cultism and related vices), Re-orientation of moral Environmental 
problems.''',
    status: "R",
      materials:[]

  ),
  Course(
    courseCode: "GNS 204",
    courseTitle: "Basic Islamic Concepts",
    creditHours: 1,
    description: '''''',
    status: "R",
      materials:[]

  ),
  Course(
    courseCode: "CMP 212",
    courseTitle: "Computer Hardware",
    creditHours: 3,
    description:
        '''Introduces the principles of user interface development, focusing on three key areas: (1). 
Design: How to design good user interfaces, starting with human capabilities and using 
those capabilities to drive design techniques: task analysis, user-centered design, 
iterative design, usability guidelines, interaction styles, and graphic design principles. (2). 
Implementation: Techniques for building user interfaces, including low-fidelity prototypes, 
Wizard of Oz, and other prototyping tools; input models, output models, model-viewcontroller, layout, constraints, and toolkits. (3). Evaluation: Techniques for evaluating and 
measuring interface usability, including heuristic evaluation, predictive evaluation, and 
user testing''',
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "CMP 204",
    courseTitle: "Data Structure and Algorithms",
    creditHours: 3,
    description:
        '''Covers Abstract Data Types (ADTs) and their support and implementations in object 
oriented languages. Topics include recursion, complexity analysis, linear data structures 
(stacks, queues, priority queues, lists and strings), and non-linear data structures (hash 
tables, binary trees, search trees, balanced trees, heaps), searching and sorting 
algorithms and graph algorithms. This will also include substantial programming 
assignments and projects. Introduction to algorithm for parallel & distributed computing''',
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "CMP 208",
    courseTitle: "Discrete Structure",
    creditHours: 3,
    description:
        '''This covers the Mathematics needed for Computer Science. Topics covered include: 
functions, relations, propositional and first order predicate logic, set theory, proofs and 
their construction, counting and elementary probability''',
    status: "C",
      materials:[]

  ),
];

List<Course> courses3 = [
  Course(
    courseCode: "SEN 301",
    courseTitle: "Object-Oriented Analysis and Design",
    creditHours: 3,
    description:
        '''Object–oriented approach to information system development, particularly in reference to 
the earlier stages of analysis and design. Importance of modelling, principles of modelling, 
object–oriented modelling, conceptual model of the Unified Modelling Language (UML), 
architecture, software development life cycle. The principles and basic concepts of object 
orientation and the different aspects of object–oriented modelling as represented by the 
UML technique. Case study of a typical UML–based CASE too''',
    status: "C",
    instructor: "Mr. Akanni",
      materials:[]

  ),
  Course(
    courseCode: "SEN 303",
    courseTitle: "Software Testing and Quality Assurance",
    creditHours: 2,
    description:
        '''How to assure it and verify it, and the need for a culture of quality. Avoidance of errors 
and other quality problems. Inspections and reviews. Testing, verification and validation 
techniques. Process assurance vs. Product assurance. Quality process standards. 
Product and process assurance. Problem analysis and reporting. Statistical approaches 
to quality control''',
    status: "C",
    instructor: "Dr. Saheed",
      materials:[]

  ),
  Course(
    courseCode: "SEN 305",
    courseTitle: "Web Application Development",
    creditHours: 3,
    description:
        '''Covers client-server model for web applications and associated client-side and server 
side technologies, MVC development guideline and development of a complete web 
application using a framework such as Ruby of rails of Django.
''',
    status: "C",
    instructor: "Mr. Ogidan",
      materials:[]

  ),
  Course(
    courseCode: "SEN 307",
    courseTitle: "Database Systems",
    creditHours: 3,
    description:
        '''The course will cover the concept, principles, components, development and application 
of database systems. The conceptual models and structures necessary to designing and 
implementing a relational database system will be taught. Topics to be covered: entityrelationship, relational data models, relational algebra, SQL, normalization, file 
organization, indexing, hashing, and enterprise-wide web-based applications that employ 
databases''',
    status: "C",
    instructor: "Mr. Ogidan",
      materials:[]

  ),
  Course(
    courseCode: "SEN 313",
    courseTitle: "Engineering Mobile Applications",
    creditHours: 1,
    description:
        '''Introduces concepts, principles and applications of open source software. Discusses 
about open source software development process. Covers economy, business, societal 
and intellectual property aspects of open source software. Obtain hands‐on experiences 
on open source software and related tools through developing various open source 
software applications such as mobile applications and Web applications building on 
existing open-source frameworks and application development platforms. ''',
    status: "C",
    instructor: "Dr. Tosho",
      materials:[]

  ),
  Course(
    courseCode: "GNS 301",
    courseTitle: "Environment & Sustainable Development",
    description: '''''',
    creditHours: 2,
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "CMP 331",
    courseTitle: "Operation Research",
    creditHours: 3,
    description:
        '''Foundation of research, problem identification and formulation, research design, 
qualitative and quantitative research, measurement, sampling data analysis, 
interpretation of data and technical report writing, use of encyclopedia, research guides 
handbook etc, academic data bases for computing disciplines, use of tools for research, 
reference management software, software for detection of plagiarism''',
    status: "C",
    instructor: "Prof. Olabiyisi",
      materials:[]

  ),
  Course(
    courseCode: "GNS 303",
    courseTitle: "Graduate Self Employment Scheme (Entrepreneurship)",
    creditHours: 3,
    description: '''''',
    status: "C",
      materials:[]

  ),
  Course(
    courseCode: "SEN 399",
    courseTitle: "SIWES",
    creditHours: 6,
    description:
        '''Students are attached to private and public organizations for a period of six months with 
a view to making them acquire practical experience and to the extent possible, develop 
skills in all areas of computing. Students are supervised during the training period and 
shall be expected to keep records designed for the purpose of monitoring their 
performance. They are also expected to submit a report on the experience gained and 
defend their reports''',
    status: "C",
  ),
];
