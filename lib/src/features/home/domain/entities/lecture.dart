
class Lecture {
  final String? code;
  final String? title;
  final String? venue;
  final String? startTime;
  final String? endTime;
  final int? day;
  final Semester? semester;

  const Lecture({
     this.code,
  this.title,
    this.venue,
    this.startTime,
     this.endTime,
     this.day,
    this.semester,
  });


}



















enum Semester { harmattan, rain }

extension StringSemester on String{
  Semester toSemester(){
    switch (toLowerCase()){
      case 'harmattan':
        return Semester.harmattan;
      case 'rain':
        return Semester.rain;
      default:
        throw ArgumentError('Invalid semester value: $this');

    }
  }
}

List<Lecture> timeTable100 = [
  const Lecture(
      code: "SEN 101",
      title: "Introduction to Computing and Applications",
      venue: "Lr 9",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 101",
      title: "Introduction to Computing and Applications",
      venue: "Lr 12",
      startTime: "16:15 pm",
      endTime: "17:15 pm",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "GNS 101",
      title: "Use of English and Library Studies I",
      venue: "CBT",
      startTime: "10:00 am",
      endTime: "12:00 am",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "GNS 103",
      title: "Beginners’ Arabic Reading and Conversation I",
      venue: "AUD",
      startTime: "12:00 Pm",
      endTime: "13:00 Pm",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "MAT 103",
      title: "Vectors, Mechanics and Geometry",
      venue: "Lr 13",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.wednesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "MAT 103",
      title: "Vectors, Mechanics and Geometry",
      venue: "Lr 13",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "CHM 105",
      title: "General Physical Chemistry",
      venue: "CBT",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "CHM 105",
      title: "General Physical Chemistry",
      venue: "Lr 15",
      startTime: "16:15 pm",
      endTime: "17:15 pm",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "MAT 101",
      title: "Algebra and Trigonometry",
      venue: "CBT",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "MAT 101",
      title: "Algebra and Trigonometry",
      venue: "CBT",
      startTime: "14:00 pm",
      endTime: "15:00 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "CMP 101",
      title: "Introduction to Computer Science",
      venue: "AUD",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "PHY 101",
      title: "Mechanics, thermal Physics & Waves",
      venue: "CBT",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "PHY 101",
      title: "Mechanics, thermal Physics & Waves",
      venue: "CBT",
      startTime: "14:00 pm",
      endTime: "15:00 pm",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "PHY 107",
      title: "General Physics Laboratory I",
      venue: "PLAB",
      startTime: "8:00 am",
      endTime: "12:00 am",
      day: DateTime.friday,
      semester: Semester.harmattan),
];

List<Lecture> timeTableSecond100 = [
  const Lecture(
      code: "SEN 102",
      title: "Principles of Programming I",
      venue: "Lr 13",
      startTime: "11:00 am",
      endTime: "12:00 pm",
      day: DateTime.wednesday,
      semester: Semester.rain),
  const Lecture(
      code: "SEN 102",
      title: "Principles of Programming I",
      venue: "Lr 16",
      startTime: "11:00 am",
      endTime: "13:00 pm",
      day: DateTime.friday,
      semester: Semester.rain),
  const Lecture(
      code: "SEN 104",
      title: "Introduction to Web Technologies",
      venue: "Lr 16",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.monday,
      semester: Semester.rain),
  const Lecture(
      code: "SEN 104",
      title: "Introduction to Web Technologies",
      venue: "Lr 13",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.tuesday,
      semester: Semester.rain),
  const Lecture(
      code: "GNS 102",
      title: "Use of English II",
      venue: "AUD",
      startTime: "10:00 am",
      endTime: "12:00 am",
      day: DateTime.monday,
      semester: Semester.rain),
  const Lecture(
      code: "MAT 102",
      title: "Calculus",
      venue: "CBT",
      startTime: "15:00 Pm",
      endTime: "16:00 Pm",
      day: DateTime.wednesday,
      semester: Semester.rain),
  const Lecture(
      code: "MAT 102",
      title: "Calculus",
      venue: "CBT",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.thursday,
      semester: Semester.rain),
  const Lecture(
      code: "GNS 104",
      title: "Islamic Faith and Practice",
      venue: "AUD",
      startTime: "12:00 pm",
      endTime: "13:00 pm",
      day: DateTime.tuesday,
      semester: Semester.rain),
  const Lecture(
      code: "PHY 102",
      title: "Electricity, Magnetism & Modern Physics",
      venue: "CBT",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.tuesday,
      semester: Semester.rain),
  const Lecture(
      code: "PHY 102",
      title: "Electricity, Magnetism & Modern Physics",
      venue: "CBT",
      startTime: "16:15 pm",
      endTime: "17:15 pm",
      day: DateTime.friday,
      semester: Semester.rain),
  const Lecture(
      code: "PHY 108",
      title: "General Physics Laboratory II",
      venue: "PLAB",
      startTime: "8:00 am",
      endTime: "12:00 pm",
      day: DateTime.wednesday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 102",
      title: "Introduction to Problem Solving",
      venue: "AUD",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.thursday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 102",
      title: "Introduction to Problem Solving",
      venue: "AUD",
      startTime: "15:00 pm",
      endTime: "16:00 pm",
      day: DateTime.friday,
      semester: Semester.rain),
  const Lecture(
      code: "STA 104",
      title: "Introduction to Probability",
      venue: "Lr 10",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.wednesday,
      semester: Semester.rain),
];

List<Lecture> timeTable200 = [
  const Lecture(
      code: "SEN 201",
      title: "Introduction to Software Engineering",
      venue: "Lr 10",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 201",
      title: "Introduction to Software Engineering",
      venue: "Lr 13",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 205",
      title: "Software Requirements and Design",
      venue: "Lr 13",
      startTime: "8:00 am",
      endTime: "11:00 am",
      day: DateTime.wednesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 207",
      title: "Computer Architecture and Organization",
      venue: "Lr 11",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 207",
      title: "Computer Architecture and Organization",
      venue: "ILAB",
      startTime: "15:00 pm",
      endTime: "16:00 pm",
      day: DateTime.wednesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 211",
      title: "Software Construction",
      venue: "Lr 16",
      startTime: "10:00 am",
      endTime: "12:00 pm",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 213",
      title: "Principle of Operating System",
      venue: "Lr 13",
      startTime: "10:00 am",
      endTime: "12:00 pm",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 213",
      title: "Principle of Operating System",
      venue: "Lr 9",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "GNS 201",
      title: "Philosophy, Logic and Afro-Arab Culture I",
      venue: "AUD",
      startTime: "11:00 am",
      endTime: "13:00 pm",
      day: DateTime.wednesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "GNS 203",
      title: "Beginners’ Arabic Reading and Conversation II",
      venue: "AUD",
      startTime: "13:00 pm",
      endTime: "13:00 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "MAT 205",
      title: "Linear Algebra I",
      venue: "Lr 9",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "STA 209",
      title: "Statistics for Physical Sciences and Engineering I",
      venue: "Lr 13",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
];
List<Lecture> timeTableSecond200 = [
  const Lecture(
      code: "SEN 202",
      title: "Software Engineering Process",
      venue: "GLAB",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.tuesday,
      semester: Semester.rain),
  const Lecture(
      code: "SEN 202",
      title: "Software Engineering Process",
      venue: "ILAB",
      startTime: "14:00 pm",
      endTime: "16:00 pm",
      day: DateTime.thursday,
      semester: Semester.rain),
  const Lecture(
      code: "SEN 204",
      title: "Logic and Its Application in Computer Science",
      venue: "Lr 11",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.friday,
      semester: Semester.rain),
  const Lecture(
      code: "SEN 208",
      title: "Design and Analysis of Computer Algorithms",
      venue: "GLAB",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.monday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 212",
      title: "Computer Hardware",
      venue: "AUD",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.monday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 212",
      title: "Computer Hardware",
      venue: "ILAB",
      startTime: "14:00 pm",
      endTime: "15:00 pm",
      day: DateTime.tuesday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 204",
      title: "Data Structure and Algorithms",
      venue: "CBT",
      startTime: "11:00 am",
      endTime: "13:00 pm",
      day: DateTime.monday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 204",
      title: "Data Structure and Algorithms",
      venue: "Lr 13",
      startTime: "12:00 pm",
      endTime: "13:00 pm",
      day: DateTime.thursday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 208",
      title: "Discrete Structure",
      venue: "Lr 9",
      startTime: "15:00 pm",
      endTime: "16:00 pm",
      day: DateTime.tuesday,
      semester: Semester.rain),
  const Lecture(
      code: "CMP 208",
      title: "Discrete Structure",
      venue: "Lr 13",
      startTime: "10:00 am",
      endTime: "12:00 pm",
      day: DateTime.friday,
      semester: Semester.rain),
  const Lecture(
      code: "GNS 204",
      title: "Basic Islamic Concepts",
      venue: "AUD",
      startTime: "11:00 am",
      endTime: "12:00 pm",
      day: DateTime.wednesday,
      semester: Semester.rain),
  const Lecture(
      code: "GNS 202",
      title: "Nigerian People, Culture & Economy",
      venue: "AUD",
      startTime: "10:00 am",
      endTime: "12:00 pm",
      day: DateTime.thursday,
      semester: Semester.rain),
];

List<Lecture> timeTable300 = [
  const Lecture(
      code: "SEN 301",
      title: "Object-Oriented Analysis and Design",
      venue: "Lr 12",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 301",
      title: "Object-Oriented Analysis and Design",
      venue: "ILAB",
      startTime: "8:00 am",
      endTime: "10:00 am",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 303",
      title: "Software Testing and Quality Assurance",
      venue: "ILAB",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 303",
      title: "Software Testing and Quality Assurance",
      venue: "ILAB",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 305",
      title: "Web Application Development",
      venue: "Lr 10",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 305",
      title: "Web Application Development",
      venue: "ILAB",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 307",
      title: "Database Systems",
      venue: "Lr 12",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.monday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 307",
      title: "Database Systems",
      venue: "Lr 11",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.thursday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 311",
      title: "Research Methodology",
      venue: "ILAB",
      startTime: "10:00 am",
      endTime: "11:00 am",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "GNS 301",
      title: "Philosophy of Science and Computer Application",
      venue: "aud",
      startTime: "80:00 am",
      endTime: "10:00 pm",
      day: DateTime.tuesday,
      semester: Semester.harmattan),
  const Lecture(
      code: "CMP 331",
      title: "Operation Research",
      venue: "Lr 13",
      startTime: "16:15 pm",
      endTime: "18:15 pm",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "GNS 303",
      title: "Graduate Self Employment Scheme (Entrepreneurship)",
      venue: "AUD",
      startTime: "11:00 am",
      endTime: "12:00 pm",
      day: DateTime.friday,
      semester: Semester.harmattan),
  const Lecture(
      code: "SEN 399",
      title: "SIWES",
      venue: "Office",
      startTime: "9:00 am",
      endTime: "17:00 pm",
      day: DateTime.monday,
      semester: Semester.rain),
];

