-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 05:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `user_id`, `cat_title`) VALUES
(16, 0, 'Bootstrap'),
(17, 0, 'Ruby'),
(18, 0, 'Java'),
(19, 0, 'CMS'),
(20, 0, 'JavaScript'),
(21, 0, 'Node.js'),
(22, 0, 'A.I.'),
(23, 0, 'React'),
(24, 0, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(50, 111, 'picahu', 'picha@gmail.com', 'Gutters are also responsive and customizable', 'unapproved', '2024-04-23'),
(51, 109, 'Sandy', 'sany@gmail.com', 'Bootstrap communities?', 'unapproved', '2024-04-23'),
(52, 98, 'Rajat', 'rajat@gmail.com', 'Love the article', 'approved', '2024-04-27'),
(53, 99, 'Ishu', 'Ishu@gmail.com', 'Wrong content....\r\n', 'unapproved', '2024-04-27');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(76, 18, 10),
(131, 19, 11),
(133, 14, 10),
(134, 35, 75),
(135, 34, 71),
(136, 37, 89),
(137, 34, 109),
(138, 34, 89),
(139, 34, 111),
(140, 36, 111),
(141, 14, 96);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` varchar(5000) NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `user_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`) VALUES
(88, 16, 37, 'Bootstrap', '', 'swati', '2024-04-18', 'bootstrap.jpg', '<h3>What Is Bootstrap?</h3><p><br>Bootstrap is a free and open-source web development framework. It’s designed to ease the web development process of responsive, mobile-first websites by providing a collection of syntax for template designs.<br><br>In other words, Bootstrap helps web developers build websites faster as they don’t need to worry about basic commands and functions. It consists of HTML, CSS, and JS-based scripts for various web design-related functions and components.<br><br>This article will cover the benefits of using Bootstrap and explain the different file types it uses. By the end, you will know whether Bootstrap can benefit your workflow.<br><br></p><h3>Basic Functions of Bootstrap</h3><p><br>Bootstrap’s primary objective is to create responsive, mobile-first websites. It ensures all interface elements of a website work optimally on all screen sizes.<br><br>Bootstrap is available in two variants ‒ precompiled and based on a source code version. Experienced developers prefer the latter since it lets them customize the styles to suit their projects.<br><br>For example, the “source code” version of Bootstrap lets you access the Sass port. This means it creates a custom stylesheet that imports Bootstrap, allowing you to modify and extend the tool as needed.<br><br>You can also install Bootstrap with a package manager ‒ a tool that manages and updates frameworks, libraries, and assets.<br><br>Some of the most popular package managers include npm, Composer, and Bower. Npm manages server-side dependencies, while Composer focuses on the front-end. If you work on PHP-based projects, consider using Bower instead.<br><br>Due to its popularity, more and more Bootstrap communities emerge. These are great places for web developers and web designers to share knowledge and discuss the latest versions of Bootstrap patches.<br></p>', 'bootstrap', 0, 'published', 18, 0),
(89, 20, 37, 'Javasctipt - Introduction', '', 'swati', '2024-04-18', 'js intro.png', '<p><h3>What is JavaScript</h3>JavaScript (js) is a light-weight object-oriented programming language which is used by several websites for scripting the webpages. It is an interpreted, full-fledged programming language that enables dynamic interactivity on websites when applied to an HTML document. It was introduced in the year 1995 for adding programs to the webpages in the Netscape Navigator browser. Since then, it has been adopted by all other graphical web browsers. With JavaScript, users can build modern web applications to interact directly without reloading the page every time. The traditional website uses js to provide several forms of interactivity and simplicity.<br><br>Although, JavaScript has no connectivity with Java programming language. The name was suggested and provided in the times when Java was gaining popularity in the market. In addition to web browsers, databases such as CouchDB and MongoDB uses JavaScript as their scripting and query language.</p><p><br><br></p>', 'js', 0, 'published', 6, 2),
(90, 22, 37, 'Artificial Intelligence', '', 'swati', '2024-04-18', 'ai.jpg', '<h3>What is AI? </h3><p>Artificial intelligence, or AI, is technology that enables computers and machines to simulate human intelligence and problem-solving capabilities.</p><p>As a field of computer science, artificial intelligence encompasses (and is often mentioned together with) machine learning and deep learning. These disciplines involve the development of AI algorithms, modeled after the decision-making processes of the human brain, that can ‘learn’ from available data and make increasingly more accurate classifications or predictions over time.<br></p><p>Artificial intelligence has gone through many cycles of hype, but even to skeptics, the release of ChatGPT seems to mark a turning point. The last time generative AI loomed this large, the breakthroughs were in computer vision, but now the leap forward is in natural language processing (NLP). Today, generative AI can learn and synthesize not just human language but other data types including images, video, software code, and even molecular structures.<br></p><p>Applications for AI are growing every day. But as the hype around the use of AI tools in business takes off, conversations around ai ethics and responsible ai become critically important. For more on where IBM stands on these issues, please read Building trust in AI.</p><p><br></p><h3><br></h3>', 'ai', 0, 'published', 4, 0),
(91, 21, 40, 'Node.js', '', 'rajat', '2024-04-21', 'node.jpg', '<p>If we talk about any application then the part with which the user is interacting is basically the frontend of our website whereas there are many things which happen in the background or in the backend of our website. Basically there are three parts of any application, one is Frontend with which the users are interacting, then comes to the backend server and backend database. For backend servers we can use NodeJS, Java, Python, etc. and for backend databases we use relational or non-relational databases.<br><br></p><h4>Now let us first know what NodeJS is.</h4><p><br>Whenever a client requests something from the client side of the application what happens is , the request is first sent to the server and then in that server some processing or calculations goes on for the validation of the client side request and after doing all such validation a response is sent to the client side. Basically for doing all such calculations and processing , this NodeJs framework of JavaScript is used.<br><br>For running our web applications outside the client’s browser , NodeJS is basically used as an open-source and cross platform JavaScript runtime environment.For running the server side applications we use this.For building the I/O intensive applications like video streaming sites ,online chatting applications and many other applications , it is used. Many established tech giant companies and newly created start-ups are using NodeJs framework in their company.<br><br>In 2009, NodeJs was developed by a guy called Ryan Dahla and the current version of NodeJs is v16.9.0.<br></p>', 'node', 0, 'published', 2, 0),
(92, 22, 40, 'A Generative AI Primer', '', 'rajat', '2024-04-18', 'ai2.jpg', '<p>Generative artificial intelligence (AI) is in a renaissance amid a profusion of new discoveries and a breathless frenzy to keep up with emergent developments. Yet understanding the current state of technology requires understanding its origins. With the state of AI science changing quickly, we should first take a breath and establish proper footings. To help, this article provides a reading list relevant to the form of generative AI that led to natural language processing (NLP) models such as ChatGPT.</p><p><br></p><p>Artificial neural networksFootnote1 have been around for more than sixty years. We can start in 1958, when the perceptron was initially implemented on a computer.Footnote2 For the first time, an algorithm used computing power to ingest labeled sets of data and classify them into categories. Nearly thirty years later, in 1986, backpropagation was introduced as an algorithm for training a neural network to learn from its mistakes.Footnote3 This advancement enabled multilayer perceptron networks to learn in nonlinear ways. In 2017, the Transformer was created as a neural architecture that improves on the memory limitations of past recurrent models.Footnote4 This efficiency gain enables a network to better handle the context and relevance of the information it has been provided. All three of these technologies remain relevant and used today.<br></p><p>There is a deep historical record about practical developments in neural networks,Footnote5 and the theoretical work supporting them includes centuries of rigorous discoveries in math and biology. Interestingly, despite this rich context of empirical and conceptual work, neural networks have not received much popular attention.<br></p>', 'ai', 0, 'published', 5, 0),
(93, 17, 36, 'Ruby', '', 'rahul', '2024-04-18', 'ruby.jpg', '<p>Ruby is a pure object-oriented programming language. It was created in 1993 by Yukihiro Matsumoto of Japan.</p><p>You can find the name Yukihiro Matsumoto on the Ruby mailing list at www.ruby-lang.org. Matsumoto is also known as Matz in the Ruby community.</p><p>Ruby has features that are similar to those of Smalltalk, Perl, and Python. Perl, Python, and Smalltalk are scripting languages. Smalltalk is a true object-oriented language. Ruby, like Smalltalk, is a perfect object-oriented language. Using Ruby syntax is much easier than using Smalltalk syntax.</p><h4><br></h4><h4>Features of Ruby</h4><p><br>&nbsp;&nbsp;&nbsp; Ruby is an open-source and is freely available on the Web, but it is subject to a license.<br><br>&nbsp;&nbsp;&nbsp; Ruby is a general-purpose, interpreted programming language.<br><br>&nbsp;&nbsp;&nbsp; Ruby is a true object-oriented programming language.<br><br>&nbsp;&nbsp;&nbsp; Ruby is a server-side scripting language similar to Python and PERL.<br><br>&nbsp;&nbsp;&nbsp; Ruby can be used to write Common Gateway Interface (CGI) scripts.<br><br>&nbsp;&nbsp;&nbsp; Ruby can be embedded into Hypertext Markup Language (HTML).<br><br>&nbsp;&nbsp;&nbsp; Ruby has a clean and easy syntax that allows a new developer to learn very quickly and easily.<br><br>&nbsp;&nbsp;&nbsp; Ruby has similar syntax to that of many programming languages such as C++ and Perl.<br><br>&nbsp;&nbsp;&nbsp; Ruby is very much scalable and big programs written in Ruby are easily maintainable.<br><br>&nbsp;&nbsp;&nbsp; Ruby can be used for developing Internet and intranet applications.<br><br>&nbsp;&nbsp;&nbsp; Ruby can be installed in Windows and POSIX environments.<br><br>&nbsp;&nbsp;&nbsp; Ruby support many GUI tools such as Tcl/Tk, GTK, and OpenGL.<br><br>&nbsp;&nbsp;&nbsp; Ruby can easily be connected to DB2, MySQL, Oracle, and Sybase.<br><br>&nbsp;&nbsp;&nbsp; Ruby has a rich set of built-in functions, which can be used directly into Ruby scripts.<br><br></p>', 'ruby', 0, 'published', 2, 0),
(94, 18, 38, 'Java Developer', '', 'mahima', '2024-04-27', 'java.png', '<p></p><p></p><h3>What Is a Java Developer?</h3>A Java developer is someone who develops software, applications, and websites using the Java programming language (not to be confused with JavaScript).<br><br>Since the use and application of Java is incredibly diverse, Java developers can find themselves working on an even greater diversity of projects and technologies. Depending on the scope of the job or the project they’re working on, Java developers often work collaboratively with other developers, software engineers, and business managers to deliver useful products.<br><br>But before we get into the exact role of a Java developer, let’s take a closer look at the language itself. By getting to know the language first, you’ll be better equipped to understand the scope of Java development and the factors that impact a Java developer’s salary.<br><br>First released in 1995, Java is one of the world’s most popular and long-standing programming languages.<br><br>As a result, Java developers enjoy a steady demand and job growth even as programming trends and paradigms continue to change. In fact, Statista reports that a third of all software developers used Java in 2022 — a number that’s expected to remain steady in the coming years.<br><br>But what kind of salary can a Java developer expect?<br><br>In this article, we’ll explore the average Java developer’s salary by seniority, background, and location. We’ll also cover the roles and responsibilities of Java developers, as well as expected career growth and best practices for securing the job (and the hefty paycheck that often follows).<p></p><h3>Who Is a Java Developer?</h3><p>A Java developer is someone who designs, develops, tests, and manages Java applications.<br><br>That’s only the most general description, of course. Since Java is both general-purpose and extremely flexible, Java developers can work on a broad range of projects. Spotify and Twitter are just some of the many Java applications you might use daily.<br></p><p></p><p></p>', 'java', 0, 'draft', 9, 0),
(95, 23, 34, 'REACT', '', 'ronita', '2024-04-18', 'react.png', '<p>React (also known as React.js or ReactJS) is a free and open-source front-end JavaScript library[3][4] for building user interfaces based on components. It is maintained by Meta (formerly Facebook) and a community of individual developers and companies.[5][6][7]<br><br>React can be used to develop single-page, mobile, or server-rendered applications with frameworks like Next.js. Because React is only concerned with the user interface and rendering components to the DOM, React applications often rely on libraries for routing and other client-side functionality.[8][9] A key advantage of React is that it only rerenders those parts of the page that have changed, avoiding unnecessary rerendering of unchanged DOM elements. <br></p>', 'react', 0, 'published', 2, 0),
(96, 16, 37, 'What is Bootstrap? Definition & Tutorial for Beginners', '', 'swati', '2024-04-18', 'bootstrap3.jpg', '<p><br>The web development field is quite vast and chances are you have heard of Bootstrap at some level or the other. And if you’re still struggling what is Bootstrap, then you have come to the right place. Here at the TemplateToaster Bootstrap builder blog, this Bootstrap tutorial for beginners will help you understand the why and how of Bootstrap.<br><br>Since its inception in 2011, it has come a long way with its four versions. In the present scenario, all of us are somewhere dependent on the internet. And the websites we visit needs to be responsive. Now you must be wondering what is responsive web design? Well, responsive design is an approach that defines that the design should be able to respond as per the user’s device. And this intuitive CSS framework plays an important role in achieving a responsive web design.<br><br></p><h3>What is Bootstrap?</h3><p><br>Bootstrap is a collection of reusable pieces of code written in HTML, CSS, and JavaScript. However, it is a free and open-source front end web development framework to help you create responsive websites and web applications.<br><br>Also, it saves you from having to write lengthy code, since it is intended to create responsive websites. It allows a website to work optimally on varied screen sizes from small screen size as a smartphone to a big screen size of a personal computer. Basically, it sets you free from the burden of building a device-specific site and keeping Bootstrap cheat sheets handy makes it even simpler.<br></p>', 'bootstrap', 0, 'published', 5, 1),
(97, 19, 36, 'CMS', '', 'rahul', '2024-04-18', 'cms.png', '<h4>What Is a Content Management System (CMS)?</h4><br>A content management system (CMS) is software that helps users create, manage, and modify content on a website without the need for technical knowledge. In other words, a CMS lets you build a website without needing to write code from scratch (or even know how to code at all).<br><br><h4>How Does a Content Management System Work?</h4><br>To give you an idea of how a content management system works, we’re going to take a whirlwind tour of the WordPress interface (WordPress is a good example of a content management system).<br><br>Let’s start with creating a piece of content. Without a content management system, you’d need to write a static HTML file and upload it to your server (sounds complicated, right?).<br><br>With a content management system like WordPress, you can just write your content in an interface that looks a good bit like Microsoft Word:<br><br><h4>What Makes up a Content Management System?</h4><br>On a more technical level, a content management system is made up of two core parts:<br><br>&nbsp;&nbsp;&nbsp; A content management application (CMA) – this is the part that allows you to actually add and manage content on your site (like you saw above).<br>&nbsp;&nbsp;&nbsp; A content delivery application (CDA) – this is the backend, behind-the-scenes process that takes the content you input in the CMA, stores it properly, and makes it visible to your visitors.<br><br><h4>What Are Examples of Popular Content Management Systems?</h4><br>WordPress, which we showed you above, is the best example of a popular content management system. While there are certainly other content management systems in existence, WordPress maintains over a 62.5% market share on websites with a known content management system.<br><br>Note that when we mention “WordPress”, we’re not talking about WordPress.com. Instead, we’re focused on WordPress.org, which is the website where the actual open-source WordPress content management system is stored.<br><br>Beyond the self-hosted WordPress software, other popular content management systems include:<br><br>&nbsp;&nbsp;&nbsp; Joomla<br>&nbsp;&nbsp;&nbsp; Drupal<br>&nbsp;&nbsp;&nbsp; Magento (for eCommerce stores)<br>&nbsp;&nbsp;&nbsp; Squarespace<br>&nbsp;&nbsp;&nbsp; Wix<br>&nbsp;&nbsp;&nbsp; TYPO3<br><br>', 'cms', 0, 'published', 2, 0),
(98, 24, 38, 'The advantages of learning Python', '', 'mahima', '2024-04-18', 'py.png', '<p>Python is a very versatile, high-level programming language. Developed by Dutch mathematician Guido van Rossum, the language is now part of a community development model, managed by the non-profit organization Python Software Foundation. It supports both object-oriented and structured programming.<br><br>Launched in the early 1990s, the language has gained increasing notoriety in recent years, becoming one of the most popular among programmers, especially for its functionality with data, big data, and artificial intelligence.<br><br>With Python, you can access native libraries that provide functionality for developing projects and implementing complex applications. The technology is present in the code of Instagram, Netflix, Spotify, Reddit, Facebook, Google and many others.<br><br></p><h3>Reasons to Learn Python</h3><p><br>From now on I will convince you to learn Python. To do this I will show you the biggest advantages of Python and why it is one of the fastest growing languages in recent years.<br><br>&nbsp;&nbsp;&nbsp; One of the biggest advantages of programming in Python is the ease with which you can learn the language. You can apply programming logic directly to the code, and this is one of the reasons why major US universities have invested in teaching programming in Python.<br>&nbsp;&nbsp;&nbsp; There are not many developers in the market, knowing python is a tie-breaker, after all this knowledge is highly valued by companies. Be different, learn Python.<br>&nbsp;&nbsp;&nbsp; Python requires less code for basic tasks when compared to other programming standards, and can be 3 to 5 times less than Java — and 5 to 10 times less than C++ code. So the less coding, the less chance of making mistakes, especially for those who are just beginners.<br>&nbsp;&nbsp;&nbsp; Python is cross-platform. There are several systems that run Python, some natively and others that require installation. Windows, MacOs, Linux Distributions, Solaris, Unix and even FreeBSD are some of the systems that can run Python programs.</p><p>It is also widely used in Data Science, so let me introduce you to some reasons why it is such a popular language among Data Scientists.</p><p><br></p><h3>Python for Data Science</h3><p><br>This is a polemic theme, other programming languages can be used for the same purpose. So, the Data Scientist is free to choose the one he prefers.<br><br>&nbsp;&nbsp;&nbsp; Python is one of the most used languages among programmers and projects, this makes it a language with a Large Community. This community, can help you find solutions to your coding or even help you get answers from your analysis.<br>&nbsp;&nbsp;&nbsp; One of the reasons Python is the most popular among Data Scientists, is the number of libraries provided, such as Pandas, NumPy, SymPy and Others. Are all dedicated to algorithm development, data collection and analysis.<br>&nbsp;&nbsp;&nbsp; Python also can be used to Scripting and Automation. A python script can automate different tasks that the time spent, saving energy and even money in some cases.<br></p>', 'py', 0, 'published', 8, 0),
(99, 21, 38, 'Node.js Architecture', '', 'mahima', '2024-04-18', 'node1.jpg', '<p>Python is a very versatile, high-level programming language. Developed by Dutch mathematician Guido van Rossum, the language is now part of a community development model, managed by the non-profit organization Python Software Foundation. It supports both object-oriented and structured programming.<br><br>Launched in the early 1990s, the language has gained increasing notoriety in recent years, becoming one of the most popular among programmers, especially for its functionality with data, big data, and artificial intelligence.<br><br>With Python, you can access native libraries that provide functionality for developing projects and implementing complex applications. The technology is present in the code of Instagram, Netflix, Spotify, Reddit, Facebook, Google and many others.<br><br></p><p>Reasons to Learn Python</p><p><br>From now on I will convince you to learn Python. To do this I will show you the biggest advantages of Python and why it is one of the fastest growing languages in recent years.<br><br>&nbsp;&nbsp;&nbsp; One of the biggest advantages of programming in Python is the ease with which you can learn the language. You can apply programming logic directly to the code, and this is one of the reasons why major US universities have invested in teaching programming in Python.<br>&nbsp;&nbsp;&nbsp; There are not many developers in the market, knowing python is a tie-breaker, after all this knowledge is highly valued by companies. Be different, learn Python.<br>&nbsp;&nbsp;&nbsp; Python requires less code for basic tasks when compared to other programming standards, and can be 3 to 5 times less than Java — and 5 to 10 times less than C++ code. So the less coding, the less chance of making mistakes, especially for those who are just beginners.<br>&nbsp;&nbsp;&nbsp; Python is cross-platform. There are several systems that run Python, some natively and others that require installation. Windows, MacOs, Linux Distributions, Solaris, Unix and even FreeBSD are some of the systems that can run Python programs.</p><p>It is also widely used in Data Science, so let me introduce you to some reasons why it is such a popular language among Data Scientists.</p><p><br></p><p>Python for Data Science</p><p><br>This is a polemic theme, other programming languages can be used for the same purpose. So, the Data Scientist is free to choose the one he prefers.<br><br>&nbsp;&nbsp;&nbsp; Python is one of the most used languages among programmers and projects, this makes it a language with a Large Community. This community, can help you find solutions to your coding or even help you get answers from your analysis.<br>&nbsp;&nbsp;&nbsp; One of the reasons Python is the most popular among Data Scientists, is the number of libraries provided, such as Pandas, NumPy, SymPy and Others. Are all dedicated to algorithm development, data collection and analysis.<br>&nbsp;&nbsp;&nbsp; Python also can be used to Scripting and Automation. A python script can automate different tasks that the time spent, saving energy and even money in some cases.<br></p>', 'node', 0, 'published', 5, 0),
(100, 20, 36, 'A quick introduction to JavaScript', '', 'rahul', '2024-04-18', 'js3.png', '<p>What Is a Content Management System (CMS)?</p><p><br>A content management system (CMS) is software that helps users create, manage, and modify content on a website without the need for technical knowledge. In other words, a CMS lets you build a website without needing to write code from scratch (or even know how to code at all).</p><p>How Does a Content Management System Work?</p><p><br>To give you an idea of how a content management system works, we’re going to take a whirlwind tour of the WordPress interface (WordPress is a good example of a content management system).<br>Let’s start with creating a piece of content. Without a content management system, you’d need to write a static HTML file and upload it to your server (sounds complicated, right?).<br>With a content management system like WordPress, you can just write your content in an interface that looks a good bit like Microsoft Word:</p><p>What Makes up a Content Management System?</p><p><br>On a more technical level, a content management system is made up of two core parts:<br>&nbsp;&nbsp;&nbsp; A content management application (CMA) – this is the part that allows you to actually add and manage content on your site (like you saw above).<br>&nbsp;&nbsp;&nbsp; A content delivery application (CDA) – this is the backend, behind-the-scenes process that takes the content you input in the CMA, stores it properly, and makes it visible to your visitors.</p><p>What Are Examples of Popular Content Management Systems?</p><p><br>WordPress, which we showed you above, is the best example of a popular content management system. While there are certainly other content management systems in existence, WordPress maintains over a 62.5% market share on websites with a known content management system.<br>Note that when we mention “WordPress”, we’re not talking about WordPress.com. Instead, we’re focused on WordPress.org, which is the website where the actual open-source WordPress content management system is stored.<br>Beyond the self-hosted WordPress software, other popular content management systems include:<br>&nbsp;&nbsp;&nbsp; Joomla<br>&nbsp;&nbsp;&nbsp; Drupal<br>&nbsp;&nbsp;&nbsp; Magento (for eCommerce stores)<br>&nbsp;&nbsp;&nbsp; Squarespace<br>&nbsp;&nbsp;&nbsp; Wix<br>&nbsp;&nbsp;&nbsp; TYPO3</p>', 'js', 0, 'published', 0, 0),
(101, 18, 37, 'Dev.java', '', 'swati', '2024-04-18', 'java1.png', '<p><br>The web development field is quite vast and chances are you have heard of Bootstrap at some level or the other. And if you’re still struggling what is Bootstrap, then you have come to the right place. Here at the TemplateToaster Bootstrap builder blog, this Bootstrap tutorial for beginners will help you understand the why and how of Bootstrap.<br><br>Since its inception in 2011, it has come a long way with its four versions. In the present scenario, all of us are somewhere dependent on the internet. And the websites we visit needs to be responsive. Now you must be wondering what is responsive web design? Well, responsive design is an approach that defines that the design should be able to respond as per the user’s device. And this intuitive CSS framework plays an important role in achieving a responsive web design.<br><br></p><p>What is Bootstrap?</p><p><br>Bootstrap is a collection of reusable pieces of code written in HTML, CSS, and JavaScript. However, it is a free and open-source front end web development framework to help you create responsive websites and web applications.<br><br>Also, it saves you from having to write lengthy code, since it is intended to create responsive websites. It allows a website to work optimally on varied screen sizes from small screen size as a smartphone to a big screen size of a personal computer. Basically, it sets you free from the burden of building a device-specific site and keeping Bootstrap cheat sheets handy makes it even simpler.<br></p>', 'java', 0, 'published', 1, 0),
(102, 23, 34, 'MERN', '', 'ronita', '2024-04-18', 'mern.png', '<p>React (also known as React.js or ReactJS) is a free and open-source front-end JavaScript library[3][4] for building user interfaces based on components. It is maintained by Meta (formerly Facebook) and a community of individual developers and companies.[5][6][7]<br><br>React can be used to develop single-page, mobile, or server-rendered applications with frameworks like Next.js. Because React is only concerned with the user interface and rendering components to the DOM, React applications often rely on libraries for routing and other client-side functionality.[8][9] A key advantage of React is that it only rerenders those parts of the page that have changed, avoiding unnecessary rerendering of unchanged DOM elements. <br></p>', 'mern', 0, 'published', 0, 0),
(103, 22, 38, 'Trustworthy AI: Should We Trust', '', 'mahima', '2024-04-18', 'ai3.jpg', '<p></p><p></p><p>What Is a Java Developer?</p>A Java developer is someone who develops software, applications, and websites using the Java programming language (not to be confused with JavaScript).<br><br>Since the use and application of Java is incredibly diverse, Java developers can find themselves working on an even greater diversity of projects and technologies. Depending on the scope of the job or the project they’re working on, Java developers often work collaboratively with other developers, software engineers, and business managers to deliver useful products.<br><br>But before we get into the exact role of a Java developer, let’s take a closer look at the language itself. By getting to know the language first, you’ll be better equipped to understand the scope of Java development and the factors that impact a Java developer’s salary.<br><br>First released in 1995, Java is one of the world’s most popular and long-standing programming languages.<br><br>As a result, Java developers enjoy a steady demand and job growth even as programming trends and paradigms continue to change. In fact, Statista reports that a third of all software developers used Java in 2022 — a number that’s expected to remain steady in the coming years.<br><br>But what kind of salary can a Java developer expect?<br><br>In this article, we’ll explore the average Java developer’s salary by seniority, background, and location. We’ll also cover the roles and responsibilities of Java developers, as well as expected career growth and best practices for securing the job (and the hefty paycheck that often follows).<p></p><p>Who Is a Java Developer?</p><p>A Java developer is someone who designs, develops, tests, and manages Java applications.<br><br>That’s only the most general description, of course. Since Java is both general-purpose and extremely flexible, Java developers can work on a broad range of projects. Spotify and Twitter are just some of the many Java applications you might use daily.<br></p><p></p><p></p>', 'ai', 0, 'published', 0, 0),
(104, 19, 36, 'What Is a Content Management System', '', 'rahul', '2024-04-18', 'cms2.png', '<p>Ruby is a pure object-oriented programming language. It was created in 1993 by Yukihiro Matsumoto of Japan.</p><p>You can find the name Yukihiro Matsumoto on the Ruby mailing list at www.ruby-lang.org. Matsumoto is also known as Matz in the Ruby community.</p><p>Ruby has features that are similar to those of Smalltalk, Perl, and Python. Perl, Python, and Smalltalk are scripting languages. Smalltalk is a true object-oriented language. Ruby, like Smalltalk, is a perfect object-oriented language. Using Ruby syntax is much easier than using Smalltalk syntax.</p><p><br></p><p>Features of Ruby</p><p><br>    Ruby is an open-source and is freely available on the Web, but it is subject to a license.<br><br>    Ruby is a general-purpose, interpreted programming language.<br><br>    Ruby is a true object-oriented programming language.<br><br>    Ruby is a server-side scripting language similar to Python and PERL.<br><br>    Ruby can be used to write Common Gateway Interface (CGI) scripts.<br><br>    Ruby can be embedded into Hypertext Markup Language (HTML).<br><br>    Ruby has a clean and easy syntax that allows a new developer to learn very quickly and easily.<br><br>    Ruby has similar syntax to that of many programming languages such as C++ and Perl.<br><br>    Ruby is very much scalable and big programs written in Ruby are easily maintainable.<br><br>    Ruby can be used for developing Internet and intranet applications.<br><br>    Ruby can be installed in Windows and POSIX environments.<br><br>    Ruby support many GUI tools such as Tcl/Tk, GTK, and OpenGL.<br><br>    Ruby can easily be connected to DB2, MySQL, Oracle, and Sybase.<br><br>    Ruby has a rich set of built-in functions, which can be used directly into Ruby scripts.<br><br></p>', 'cms', 0, 'published', 1, 0),
(105, 23, 40, 'Overview of React.js', '', 'rajat', '2024-04-18', 'react1.png', '<p>Generative artificial intelligence (AI) is in a renaissance amid a profusion of new discoveries and a breathless frenzy to keep up with emergent developments. Yet understanding the current state of technology requires understanding its origins. With the state of AI science changing quickly, we should first take a breath and establish proper footings. To help, this article provides a reading list relevant to the form of generative AI that led to natural language processing (NLP) models such as ChatGPT.</p><p><br></p><p>Artificial neural networksFootnote1 have been around for more than sixty years. We can start in 1958, when the perceptron was initially implemented on a computer.Footnote2 For the first time, an algorithm used computing power to ingest labeled sets of data and classify them into categories. Nearly thirty years later, in 1986, backpropagation was introduced as an algorithm for training a neural network to learn from its mistakes.Footnote3 This advancement enabled multilayer perceptron networks to learn in nonlinear ways. In 2017, the Transformer was created as a neural architecture that improves on the memory limitations of past recurrent models.Footnote4 This efficiency gain enables a network to better handle the context and relevance of the information it has been provided. All three of these technologies remain relevant and used today.<br></p><p>There is a deep historical record about practical developments in neural networks,Footnote5 and the theoretical work supporting them includes centuries of rigorous discoveries in math and biology. Interestingly, despite this rich context of empirical and conceptual work, neural networks have not received much popular attention.<br></p>', 'react', 0, 'published', 0, 0),
(106, 18, 40, 'Master Java', '', 'rajat', '2024-04-18', 'java2.png', '<p>If we talk about any application then the part with which the user is interacting is basically the frontend of our website whereas there are many things which happen in the background or in the backend of our website. Basically there are three parts of any application, one is Frontend with which the users are interacting, then comes to the backend server and backend database. For backend servers we can use NodeJS, Java, Python, etc. and for backend databases we use relational or non-relational databases.<br><br></p><p>Now let us first know what NodeJS is.</p><p><br>Whenever a client requests something from the client side of the application what happens is , the request is first sent to the server and then in that server some processing or calculations goes on for the validation of the client side request and after doing all such validation a response is sent to the client side. Basically for doing all such calculations and processing , this NodeJs framework of JavaScript is used.<br><br>For running our web applications outside the client’s browser , NodeJS is basically used as an open-source and cross platform JavaScript runtime environment.For running the server side applications we use this.For building the I/O intensive applications like video streaming sites ,online chatting applications and many other applications , it is used. Many established tech giant companies and newly created start-ups are using NodeJs framework in their company.<br><br>In 2009, NodeJs was developed by a guy called Ryan Dahla and the current version of NodeJs is v16.9.0.<br></p>', 'java', 0, 'published', 0, 0),
(107, 24, 37, 'Python for Business Analytics', '', 'swati', '2024-04-18', 'py1.jpg', '<h3>What is Python? </h3><p>Artificial intelligence, or AI, is technology that enables computers and machines to simulate human intelligence and problem-solving capabilities.</p><p>As a field of computer science, artificial intelligence encompasses (and is often mentioned together with) machine learning and deep learning. These disciplines involve the development of AI algorithms, modeled after the decision-making processes of the human brain, that can ‘learn’ from available data and make increasingly more accurate classifications or predictions over time.<br></p><p>Artificial intelligence has gone through many cycles of hype, but even to skeptics, the release of ChatGPT seems to mark a turning point. The last time generative AI loomed this large, the breakthroughs were in computer vision, but now the leap forward is in natural language processing (NLP). Today, generative AI can learn and synthesize not just human language but other data types including images, video, software code, and even molecular structures.<br></p><p>Applications for AI are growing every day. But as the hype around the use of AI tools in business takes off, conversations around ai ethics and responsible ai become critically important. For more on where IBM stands on these issues, please read Building trust in AI.</p><p><br></p><h3><br></h3>', 'py', 0, 'published', 0, 0),
(108, 20, 37, 'What Is JavaScript Used For?', '', 'swati', '2024-04-18', 'js2.png', '<p><h3>What is JavaScript</h3>JavaScript (js) is a light-weight object-oriented programming language which is used by several websites for scripting the webpages. It is an interpreted, full-fledged programming language that enables dynamic interactivity on websites when applied to an HTML document. It was introduced in the year 1995 for adding programs to the webpages in the Netscape Navigator browser. Since then, it has been adopted by all other graphical web browsers. With JavaScript, users can build modern web applications to interact directly without reloading the page every time. The traditional website uses js to provide several forms of interactivity and simplicity.<br><br>Although, JavaScript has no connectivity with Java programming language. The name was suggested and provided in the times when Java was gaining popularity in the market. In addition to web browsers, databases such as CouchDB and MongoDB uses JavaScript as their scripting and query language.</p><p><br><br></p>', 'js', 0, 'published', 0, 0),
(109, 19, 37, 'What is CMS?', '', 'swati', '2024-04-18', 'cms1.png', '<h3>CMS</h3><p>Bootstrap is a free and open-source web development framework. It’s designed to ease the web development process of responsive, mobile-first websites by providing a collection of syntax for template designs.<br><br>In other words, Bootstrap helps web developers build websites faster as they don’t need to worry about basic commands and functions. It consists of HTML, CSS, and JS-based scripts for various web design-related functions and components.<br><br>This article will cover the benefits of using Bootstrap and explain the different file types it uses. By the end, you will know whether Bootstrap can benefit your workflow.<br><br></p><h3>Basic Functions of CMS</h3><p><br>Bootstrap’s primary objective is to create responsive, mobile-first websites. It ensures all interface elements of a website work optimally on all screen sizes.<br><br>Bootstrap is available in two variants ‒ precompiled and based on a source code version. Experienced developers prefer the latter since it lets them customize the styles to suit their projects.<br><br>For example, the “source code” version of Bootstrap lets you access the Sass port. This means it creates a custom stylesheet that imports Bootstrap, allowing you to modify and extend the tool as needed.<br><br>You can also install Bootstrap with a package manager ‒ a tool that manages and updates frameworks, libraries, and assets.<br><br>Some of the most popular package managers include npm, Composer, and Bower. Npm manages server-side dependencies, while Composer focuses on the front-end. If you work on PHP-based projects, consider using Bower instead.<br><br>Due to its popularity, more and more Bootstrap communities emerge. These are great places for web developers and web designers to share knowledge and discuss the latest versions of Bootstrap patches.<br></p>', 'cms, content management system', 0, 'published', 12, 1),
(111, 16, 38, 'Bootstrap 5 Grid System', '', 'mahima', '2024-04-23', 'bootstrap4.jpg', '<p id=\"how-it-works\">How it works</p>\r\n<p>Breaking it down, here’s how the grid system comes together:</p>\r\n<ul><li><p>\r\n</p><p><strong>Our grid supports <a href=\"https://getbootstrap.com/docs/5.0/layout/breakpoints/\">six responsive breakpoints</a>.</strong>  Breakpoints are based on <code>min-width</code> media queries, meaning they affect that breakpoint and all those above it (e.g., <code>.col-sm-4</code> applies to <code>sm</code>, <code>md</code>, <code>lg</code>, <code>xl</code>, and <code>xxl</code>). This means you can control container and column sizing and behavior by each breakpoint.</p><p>\r\n</p></li><li><p>\r\n</p><p><strong>Containers center and horizontally pad your content.</strong> Use <code>.container</code> for a responsive pixel width, <code>.container-fluid</code> for <code>width: 100%</code> across all viewports and devices, or a responsive container (e.g., <code>.container-md</code>) for a combination of fluid and pixel widths.</p><p>\r\n</p></li><li><p>\r\n</p><p><strong>Rows are wrappers for columns.</strong> Each column has horizontal <code>padding</code> (called a gutter) for controlling the space between them. This <code>padding</code>\r\n is then counteracted on the rows with negative margins to ensure the \r\ncontent in your columns is visually aligned down the left side. Rows \r\nalso support modifier classes to <a href=\"https://getbootstrap.com/docs/5.0/layout/grid/#row-columns\">uniformly apply column sizing</a> and <a href=\"https://getbootstrap.com/docs/5.0/layout/gutters/\">gutter classes</a> to change the spacing of your content.</p><p>\r\n</p></li><li><p>\r\n</p><p><strong>Columns are incredibly flexible.</strong> There are 12 \r\ntemplate columns available per row, allowing you to create different \r\ncombinations of elements that span any number of columns. Column classes\r\n indicate the number of template columns to span (e.g., <code>col-4</code> spans four). <code>width</code>s are set in percentages so you always have the same relative sizing.</p><p>\r\n</p></li><li><p>\r\n</p><p><strong>Gutters are also responsive and customizable.</strong> <a href=\"https://getbootstrap.com/docs/5.0/layout/gutters/\">Gutter classes are available</a> across all breakpoints, with all the same sizes as our <a href=\"https://getbootstrap.com/docs/5.0/utilities/spacing/\">margin and padding spacing</a>. Change horizontal gutters with <code>.gx-*</code> classes, vertical gutters with <code>.gy-*</code>, or all gutters with <code>.g-*</code> classes. <code>.g-0</code> is also available to remove gutters.</p><p>\r\n</p></li><li><p>\r\n</p><p><strong>Sass variables, maps, and mixins power the grid.</strong> If you don’t want to use the predefined grid classes in Bootstrap, you can use our <a href=\"https://getbootstrap.com/docs/5.0/layout/grid/#sass\">grid’s source Sass</a>\r\n to create your own with more semantic markup. We also include some CSS \r\ncustom properties to consume these Sass variables for even greater \r\nflexibility for you.</p><p>\r\n</p></li></ul>\r\n<p>Be aware of the limitations and <a href=\"https://github.com/philipwalton/flexbugs\">bugs around flexbox</a>, like the <a href=\"https://github.com/philipwalton/flexbugs#flexbug-9\">inability to use some HTML elements as flex containers</a>.</p>', 'bootstrap', 0, 'published', 30, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iuseshrinitinstrings22',
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`, `token`) VALUES
(34, 'ronita', '$2y$10$hycImj1NMUzxm8J69mqlIeK4GcQr7l7v8pUlbIR./PnqJ3FPdSbsC', '', '', 'ronita@gmail.com', '', 'subscriber', '$2y$10$iuseshrinitinstrings22', ''),
(35, 'a2', '$2y$10$iuseshrinitinstrings2u6zaLIjwch/Zn2XuupH6YuAHHJspvJOW', '', '', 'a2@gmail.com', '', 'admin', '$2y$10$iuseshrinitinstrings22', ''),
(36, 'rahul', '$2y$10$EgIOEAwK8nodXvkWgXcQEeJ1fIItcL5U3T/dDofAqfUhYXwIzwUC6', '', '', 'rahul@gmail.com', '', 'subscriber', '$2y$10$iuseshrinitinstrings22', ''),
(37, 'swati', '$2y$12$qd2ma/qaAN.dD2A8R9CkCO6U2bO0aOz0JtxVVeE/mgFbyU0qgomki', '', '', 'swati@gmail.com', '', 'subscriber', '$2y$10$iuseshrinitinstrings22', ''),
(38, 'mahima', '$2y$12$.3mahCB9/kCnbF3eRypnS.JMqnScr/m1hlPCmZGOy7sht2bDMhAWC', '', '', 'mahima23323@gmail.com', '', 'subscriber', '$2y$10$iuseshrinitinstrings22', ''),
(39, 'shri_admin', '$2y$10$V9aoqneQOO7PM1Te4nUUi.mHSPZ54szTiozG5/.mdVC3USHPcjk1K', '', '', 'shri@gmail.com', '', 'admin', '$2y$10$iuseshrinitinstrings22', ''),
(40, 'rajat', '$2y$12$4dz0OvRhG/MQ6pRrMVrHMebZMpX638za.LDLvZ2NaCjWPGjOy80JW', '', '', 'rajat34432@gmail.com', '', 'subscriber', '$2y$10$iuseshrinitinstrings22', ''),
(41, 'pankaj', '$2y$12$9Ew4QBU/u2i6AVViOYfx/efa8GhiLKdqb.PkS9QL7pVvfadJ0dQOy', '', '', 'pankaj@gmail.com', '', 'subscriber', '$2y$10$iuseshrinitinstrings22', ''),
(45, 'admin', '$2y$12$md/zKNBwDTQiXWaPPyVgjeOxdNlvka.AwWRDbLjGVfQbU26FHdMUe', '', '', 'admin@gmail.com', '', 'admin', '$2y$10$iuseshrinitinstrings22', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(5, 'f1e0bklbd8pq3mjmnp9b71s4do', 1711472253),
(6, '7qss3c6bs2vjlhkbqdqpn18b9d', 1714240690),
(7, 'uj486jmsjkfr31pdq42srltd5m', 1712644195),
(8, 'iu3p7qvevb7dseopqsnl24b3d2', 1711552434),
(9, 'bbpp6qoa1bghv9ebb4f93vmmo7', 1711552721),
(10, '8vduos8j0b8q49sj59cs9bu8b3', 1712034754),
(11, 's2brdhcg4skgq5o9dsi6qcgq5o', 1713872237);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
