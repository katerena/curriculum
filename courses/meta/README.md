# Design and Develop Self-Guided Learning Dashboard

Category: Programming

Curriculum: Self

Ping: 26.12.2016

Start: 12.12.2016

## Week 1

Learning Goal: Refine idea and approach for personal "online course" management system

Start: 12.12.2016

End: 12.12.2016

Reflection: Although my initial idea for an MVP used a simple card-based HTML5 layout, it was very fun to use Jupyter Notebook for the current use-cases (**UC1: Get Outstanding Tasks** and **UC2: Celebrate Accomplishments**) and the third major use-case (**UC3: Showcase Project Porfolio**) is just not very pressing. In particular, I thought that using images would be crucial for the MVP, but it seems like that can be done later because the links, in the context of Jupyter's relatively minimal UI, provide amply call to action. Also, the combination of **Learning Goal and Reflection** already feels like a very powerful tool, to the extent that it would perhaps be useful to take a "curriculum" approach to large projects in general, rather than only "online curricula" in particular.

- [X] Explore minimalist, beutiful HTML5 themes; found [Prallelism](https://html5up.net/parallelism) and [Hydrogen](https://freehtml5.co/demos/hydrogen/), prefer Hydrogen but both nice.
- [X] Get a minimal viable product (MVP) running in Jupyter Notebook
- [X] Have at least one visualization of accomplishment in the MVP dash
- [X] Describe in the reflection the use cases and learnings
- [X] Lack of line breaks looks bad in the GH markdown viewer, so need to adjust the rules and the parser before plowing ahead with data migration
- [X] Figure out a way to deal with reading-centered tasks, and with reading notes (related more general probelm: links and relative references, as well as privacy - this repository is public, but book notes may need to stay private or with restricted visibility, such as the MHS text) such as in the art-of-programming self-guided course. Solution: just use google docs or other cloud hosting, using those sharing settings, and the URL and Keyword elements.
- [X] Migrate all the other course data in here

## Week 2

Learning Goal: Explore possibilities and limitations of current set-up, particulalry by identifying some outstanding projects and ideas and articulating them here.

Reflection: Already, one idea has been to just migrate tasks upwards if I get too excited (e.g., some of the tasks marked as completed from last week were actually initially here, but I got over-excited). The core difference between the weeks is off-time, and opportunity to dwell in the subsconscious on the various ideas, and allow them to germinate/rise/insert-cooking-metaphor here.

- [X] Implement a Jupyter Notebook that updates the today.txt, which is then included in the output
- [X] MVP script to combine the header+(items)+footer HTML to make a landing page
- [ ] Support for writing files out; MVP should prevent overwriting if not all lines successfully ingensted and the two following features.
- [ ] First, support changing metadata through iPyInteract: eg, be able to search through by metadata, and update it, such as Sategory, etc. 
- [ ] Second, support renaming a magic word into another magic word, such as "Curriculum" into "Author" or "Photo-Credit" into "Photo Credit." Note that this would also involve savign as a python file the current enum, and making another enum, and then defining which one is used. Another field in courseDesc could be _interpreter_, which would involve [dynamic module loading](http://stackoverflow.com/questions/951124/dynamic-loading-of-python-modules).
- [ ] MVP for recording and storing portfolio project information
- [ ] As examples of portfolio projects, use the music-text song and the game design characters

## Week 3

Learning Goal: Investigate different integrations and identify (1) possible uses and (2) necessary, desirable, and nice-to-have features

- [ ] Landing pages for courses: focusing on projects and reflections
- [ ] Write up comparison agains straight README rendering in GH markdown
- [ ] Begin to migrate masterlists; content-ful Pinterest pages
- [ ] Follow up on Coursera API
- [ ] [Pinterest API](https://developers.pinterest.com/apps/4872901797745801441)
- [ ] Old stuff: masterlists, diigo, [GistNote](https://gistnote.com/), Day one

## Week 4

Learning Goal: Investigate integrations into broader task and life management approaches

- [ ] Reflect on [procrastination patterns](http://www.studygs.net/attmot3.htm)
- [ ] Reflect on data-centric tools, such as Flat Tomato, Beeminder, and RescueTime
- [ ] Reflect on the ideas from prior well-used tools, such as TeuxDeux or today.txt or Chrome Momentum application
- [ ] Implement [today.txt](http://johnhenrymuller.com/today) perhaps with [Wunderlist integration](https://developer.wunderlist.com/documentation) or [todo.txt](http://todotxt.com/)

## Week 5

Learning Goal: understand this personal effort in the context of existing topics in educational technology and self-guided learning

- [ ] Look at some of the audit-only courses (such as Songwriting) and reflect on integrating own milestones with coursera lectures
- [ ] Reading: [Self-directed learning: 4 step process](https://uwaterloo.ca/centre-for-teaching-excellence/teaching-resources/teaching-tips/tips-students/self-directed-learning/self-directed-learning-four-step-process)
- [ ] Explore other platforms and tools: worldscienceu; [Khan Academy](https://www.khanacademy.org/); [Quora](https://www.quora.com/about) for both gaining and testing knowledge; [InstaGrok](http://www.instagrok.com/)

## Week 6

Learning Goal: Investigate and try out some minimal (in time and cost) stacks for a database-backed application, and decide whether the next stage with remain in markdown-world, or whether a fully featured web app would be worth it

- [ ] Cloud DB options: [A](http://www.htmlgoodies.com/html5/client/activity-so-you-want-to-build-and-deploy-a-web-app-to-the-cloud-at-low-to-no-cost.html#fbid=Bm_bDZAh1yL), [B](http://rdbhost.blogspot.de/2011/05/host-your-database-backed-site-on.html) and [B'](https://www.rdbhost.com/github_hosting.html)
- [ ] The alternative is to use files locally: [web example](https://github.com/bicarbon8/todoTxtWebUi) and [another web example](https://github.com/infews/bulldog); [chrome app example](https://chrome.google.com/webstore/detail/todotxt-for-chrome-simple/mndijfcodpjlhgjcpcbhncjakaboedbl) and [another one](https://chrome.google.com/webstore/detail/todotxt-lean-fast-task-ma/ohjgbfjncbnecbnijmpgjhodnhbhnjgk)