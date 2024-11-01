import 'package:flutter/material.dart';

List<Map<String, String>> newsArticles = [
  {
    "category": "Technology",
    "title": "AI Revolutionizes Data Processing in 2024",
    "date": "27 Oct 2024"
  },
  {
    "category": "Science",
    "title": "New Discovery Suggests Water on Exoplanet",
    "date": "25 Oct 2024"
  },
  {
    "category": "Health",
    "title": "Breakthrough in Cancer Treatment: A New Hope",
    "date": "23 Oct 2024"
  },
  {
    "category": "Business",
    "title": "Global Markets Rally Amid Economic Optimism",
    "date": "20 Oct 2024"
  },
  {
    "category": "Sports",
    "title": "Historic Win as Team X Claims Championship Title",
    "date": "19 Oct 2024"
  },
  {
    "category": "Entertainment",
    "title": "Blockbuster Movie Breaks Box Office Records",
    "date": "18 Oct 2024"
  },
  {
    "category": "Politics",
    "title": "New Policy Changes Spark Nationwide Debate",
    "date": "15 Oct 2024"
  },
  {
    "category": "Environment",
    "title": "Global Summit Pledges to Reduce Carbon Emissions",
    "date": "13 Oct 2024"
  },
  {
    "category": "Travel",
    "title": "Top Destinations for 2024 Announced",
    "date": "10 Oct 2024"
  },
  {
    "category": "Education",
    "title": "New Learning Platform Revolutionizes Online Education",
    "date": "8 Oct 2024"
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade400, Colors.lightBlue.shade300],
                  )),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 64),
                  Text(
                    'Welcome Back, Dian!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover a world of news that matter to you',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Chip(
                      visualDensity: VisualDensity.compact,
                      label: const Text('All'),
                      backgroundColor: Colors.blue,
                      labelStyle: const TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Chip(
                      visualDensity: VisualDensity.compact,
                      label: const Text(
                        'Bussiness',
                        style: TextStyle(color: Colors.blue),
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Chip(
                      visualDensity: VisualDensity.compact,
                      label: const Text(
                        'Technology',
                        style: TextStyle(color: Colors.blue),
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Chip(
                      visualDensity: VisualDensity.compact,
                      label: const Text(
                        'Economy',
                        style: TextStyle(color: Colors.blue),
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Chip(
                      visualDensity: VisualDensity.compact,
                      label: const Text(
                        'Health',
                        style: TextStyle(color: Colors.blue),
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Latest News',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text('See All',
                    style: TextStyle(fontSize: 14, color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chip(
                            labelPadding: EdgeInsets.all(0),
                            visualDensity: VisualDensity.compact,
                            label: Text(
                              newsArticles[index]['category'] ?? '',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                            ),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(32)),
                          ),
                          Text(
                            newsArticles[index]['title'] ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            newsArticles[index]['date'] ?? '',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Image.asset(
                        "assets/images/computer.jpeg",
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
