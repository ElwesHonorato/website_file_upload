


# resource "aws_instance" "ec2_back_end" {
#     ami = var.ec2_back_end_ami
#     instance_type = var.ec2_back_end_type
#     # subnet_id = var.tcb_blog_subnet_public_id
#     vpc_security_group_ids = [var.security_group_ec2_back_end]
#     associate_public_ip_address = false
# }


resource "aws_ecs_cluster" "cluster_web_page" {
  name = "${var.project}-cluster_web_page" # Naming the cluster
}


resource "aws_ecs_task_definition" "cluster_web_page_task" {
  family                   = "${var.project}-cluster_web_page_task" # Naming our first task
  container_definitions    = <<DEFINITION
  [
    {
      "name": "${var.project}-cluster_web_page_task",
      "image": "${aws_ecr_repository.images_repository.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 8000,
          "hostPort": 8000
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"] # Stating that we are using ECS Fargate
  network_mode             = "awsvpc"    # Using awsvpc as our network mode as this is required for Fargate
  memory                   = 512         # Specifying the memory our container requires
  cpu                      = 256         # Specifying the CPU our container requires
  execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
}


resource "aws_ecs_service" "cluster_web_page_task" {
  name            = "cluster_web_page_service"                             # Naming our first service
  cluster         = "${aws_ecs_cluster.cluster_web_page.id}"               # Referencing our created Cluster
  task_definition = "${aws_ecs_task_definition.cluster_web_page_task.arn}" # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3


  load_balancer {
    target_group_arn = "${aws_lb_target_group.target_group.arn}" # Referencing our target group
    container_name   = "${aws_ecs_task_definition.cluster_web_page_task.family}"
    container_port   = 3000 # Specifying the container port
  }

# As we are using Fargate, our tasks need to specify that the network mode is awsvpc. As a result, we need to extend our service to include a network configuration. 
# You may have not known it yet, but our cluster was automatically deployed into your account’s default VPC. 
# However, for a service, this needs to be explicitly stated, even if we wish to continue using the default VPC and subnets. 
# First, we need to create reference resources to the default VPC and subnets so that they can be referenced by our other resources:
    network_configuration {
    subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
    assign_public_ip = true # Providing our containers with public IPs
  }
}
