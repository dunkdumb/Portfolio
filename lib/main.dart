import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uppada Enos - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(),
            _buildAboutSection(),
            _buildEducationSection(),
            _buildSkillsSection(),
            _buildExperienceSection(),
            _buildProjectsSection(),
            _buildContactSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _scrollToSection(index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Education'),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Skills'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Experience'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Projects'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6), Color(0xFF60A5FA)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.code,
                size: 80,
                color: Color(0xFF1E3A8A),
              ),
            ).animate().scale(duration: 800.ms).fadeIn(),
            const SizedBox(height: 30),
            Text(
              'Uppada Enos',
              style: GoogleFonts.inter(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().slideY(duration: 600.ms, begin: 0.3).fadeIn(),
            const SizedBox(height: 10),
            Text(
              'AI/ML Engineer & Computer Science Student',
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.white70,
              ),
            ).animate().slideY(duration: 600.ms, begin: 0.3, delay: 200.ms).fadeIn(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(Icons.email, 'enosuppada2005@gmail.com', 'mailto:enosuppada2005@gmail.com'),
                const SizedBox(width: 20),
                _buildSocialButton(Icons.phone, '+91 7799477236', 'tel:+917799477236'),
                const SizedBox(width: 20),
                _buildSocialButton(Icons.link, 'LinkedIn', 'https://linkedin.com/in/uppada-enos'),
                const SizedBox(width: 20),
                _buildSocialButton(Icons.code, 'GitHub', 'https://github.com/uppada-enos'),
              ],
            ).animate().slideY(duration: 600.ms, begin: 0.3, delay: 400.ms).fadeIn(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label, String url) {
    return ElevatedButton.icon(
      onPressed: () => _launchURL(url),
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E3A8A),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'I am a passionate AI/ML Engineer and Computer Science student at CRRao Advanced Institute of Mathematics, Statistics and Computer Science. With hands-on experience in machine learning, deep learning, and computer vision, I specialize in developing innovative AI solutions and building scalable applications.',
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 30),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CRRao Advanced Institute of Mathematics, Statistics and Computer Science',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'B-Tech in Computer Science Engineering',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hyderabad, Telangana • Aug 2023 - Present',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Relevant Coursework:',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'Machine Learning',
                      'Deep Learning',
                      'Computer Vision',
                      'Data Structures',
                      'Artificial Intelligence',
                    ].map((course) => Chip(
                      label: Text(course),
                      backgroundColor: const Color(0xFF3B82F6).withOpacity(0.1),
                      labelStyle: const TextStyle(color: Color(0xFF1E3A8A)),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 30),
          _buildSkillCategory('Programming Languages', [
            'Java', 'Python', 'C', 'R', 'Dart'
          ]),
          const SizedBox(height: 20),
          _buildSkillCategory('Frameworks & Libraries', [
            'OpenCV', 'TensorFlow', 'Keras', 'Scikit-Learn', 'Matplotlib', 
            'Seaborn', 'Ultralytics', 'Transformers'
          ]),
          const SizedBox(height: 20),
          _buildSkillCategory('Developer Tools', [
            'Git', 'Google Cloud Platform', 'VS Code', 'Visual Studio', 
            'PyCharm', 'Eclipse', 'Hugging Face', 'Docker', 'PyPi', 'Azure AI Foundry'
          ]),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) => Chip(
            label: Text(skill),
            backgroundColor: const Color(0xFF3B82F6).withOpacity(0.1),
            labelStyle: const TextStyle(color: Color(0xFF1E3A8A)),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 30),
          _buildExperienceCard(
            'Conquerors Software Technologies',
            'AI/ML Engineer',
            'July 2025 - Present',
            'On-site',
            [
              'Applied few-shot learning, zero-shot learning, and prompt engineering to story and quiz generation models for real-world use cases.',
              'Redesigned and developed a website with the latest tech stack, AI API integrations, and SEO-friendly architecture for improved performance and visibility.',
            ],
          ),
          const SizedBox(height: 20),
          _buildExperienceCard(
            'Summer Internship',
            'Computer Vision Engineer',
            'June 2025 - Aug 2025',
            'Remote',
            [
              'Implemented computer vision algorithms for various detection tasks using OpenCV and Ultralytics.',
              'Enhanced deep learning knowledge by working with Python, neural networks, and real-world AI applications.',
              'Improved model accuracy using different Ultralytics YOLO models.',
            ],
          ),
          const SizedBox(height: 20),
          _buildExperienceCard(
            'SB Solutions',
            'Data Science Intern',
            'Feb 2025 - July 2025',
            'On-Site',
            [
              'Developed and fine-tuned AI models, combining them into a cohesive system. Created Python libraries for efficient data processing.',
              'Worked extensively with Hugging Face, Dockerization, web scraping, and Azure AI Foundry.',
              'Gained experience in the deployment, implementation, and optimization of AI models.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String company, String role, String duration, String location, List<String> responsibilities) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3A8A),
                        ),
                      ),
                      Text(
                        role,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      duration,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3B82F6),
                      ),
                    ),
                    Text(
                      location,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...responsibilities.map((responsibility) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF3B82F6))),
                  Expanded(
                    child: Text(
                      responsibility,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 30),
          _buildProjectCard(
            'Face Recognition using CV',
            'Nov-Dec 2024',
            ['Python', 'TensorFlow', 'Scikit-learn', 'OpenCV'],
            [
              'Built a real-time face recognition system using Python and OpenCV.',
              'Integrated TensorFlow, RCNN, and LBPH for accurate face detection.',
              'Optimized model using Eigenfaces, MT-CNN, and data augmentation techniques.',
            ],
          ),
          const SizedBox(height: 20),
          _buildProjectCard(
            'Multi-Modal File Classifier',
            'Dec 2024',
            ['Python', 'Keras', 'OpenCV'],
            [
              'Used ResNet50 & MFCC to extract embeddings from images, videos, and audio.',
              'Applied PCA & Random Forest for efficient classification.',
              'Built a pipeline to predict file types with high accuracy.',
            ],
          ),
          const SizedBox(height: 20),
          _buildProjectCard(
            'Agenbits Python Library',
            'May 2025',
            ['Python'],
            [
              'Developed Agenbits, a Python library to fetch, convert, and decode binary input data for ML models.',
              'Handling of various file inputs, including CSV, XLSX, JPEG, WAV, FLAC, TSV, XML, and binary files.',
              'Implemented features to fetch files from URLs (HTTP/HTTPS) and hold them as temporary files.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String date, List<String> technologies, List<String> details) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies.map((tech) => Chip(
                label: Text(tech),
                backgroundColor: const Color(0xFF3B82F6).withOpacity(0.1),
                labelStyle: const TextStyle(color: Color(0xFF1E3A8A)),
              )).toList(),
            ),
            const SizedBox(height: 16),
            ...details.map((detail) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF3B82F6))),
                  Expanded(
                    child: Text(
                      detail,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: const Color(0xFF1E3A8A),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Ready to collaborate on exciting AI/ML projects?',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => _launchURL('mailto:enosuppada2005@gmail.com'),
                icon: const Icon(Icons.email),
                label: const Text('Contact Me'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1E3A8A),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _scrollToSection(int index) {
    // This is a simplified implementation
    // In a real app, you'd want to calculate exact positions
    double offset = index * MediaQuery.of(context).size.height;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
