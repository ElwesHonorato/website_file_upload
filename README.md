I needed a website to upload files flat files and now I present the path I took to achieve it.

At first glance, this simple title may look like a trivial project to technology outsiders and also trivial to Jedi´s technology but I believe that for a big part of data engineering students to see a complete project end to end it´s not so common to find and can be helpful quickstart to better understand how these technologies are interconnected.
I used Terraform, CI/CD, Docker, GitHub, Flask, and AWS solutions like AWS Bucket, Auto Scaling Group, ECR, Lambda Function, ECS Cluster and Amazon Event Bridge in this project. 
My intention with this project is to give you a glance at how all of them can work together and who does what. Later on, I may write about the specificities and good practices of each part of this project but for now, I´ll  stick to the working of the solution at a high level and share the GitHub repository.
As you´ll find below this is not a finished project, there are a few more features that I plan to add, but after a reflection, I may never finish it due to new ideas and technologies that I may wanna apply. So, I´m writing this post, the first of a series, as an extended part of the documentation and learning I´m obtaining in this journey.
And to the ones who are afraid of cloud costs and are willing to replicate this solution, I can assure you that I didn´t spend more than 5 dollars with this.

A website to upload files, but why?
Ok, we are talking about some cool tools to work with data engineering but imagine, some of you won´t have much trouble with that, that you have an Excel file where the business team keeps track of hundreds of rows that must be often manually updated in the CRM.
With that said, how could we develop a solution that would enable the business team to mass upload their updates that later on would be processed by the data engineering team to the CRM? The solution also must be hefty enough to keep track of the submissions, check data schema before moving the file to the processing stage, and also be scalable and cost-effective.
