ami_id = "ami-08962a4068733a2b6"
instance_type = "t2.large"
tags = {Name="practica1",Enviroment="Dev"}
sg_name = "test_rules"
ingress_rules = [
    {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
]