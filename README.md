# Breeder Buddy

Breeder Buddy is a platform designed to help dog breeders manage their breeding activities and information. The app provides a convenient and accessible tool for breeders to streamline their operations and better connect with potential customers.

With Breeder Buddy, breeders can:

* Keep track of mating plans
* Manage whelping schedules
* Register puppies
* Keep track of sales
* Upload photos of puppies and classify their breeds using AWS Rekognition

The app is hosted on an EC2 instance and uses RDS for data storage. The RDS credentials are securely stored in the AWS Systems Manager Parameter Store to ensure the security of the data.

The app is written using the Flask framework and is comprised of several Python scripts. The scripts interact with the RDS database and the AWS Rekognition service to provide the desired functionality.

## Getting Started
To use Breeder Buddy, you will need to have an AWS account and access to the AWS Management Console. Follow these steps to get started:

1. Clone the Breeder Buddy repository to your local machine
2. Create an EC2 instance and an RDS database
3. Store the RDS credentials in the AWS Systems Manager Parameter Store
4. Deploy the app to the EC2 instance
5. Access the app from any device with internet access

For more information on how to use Breeder Buddy, refer to the comprehensive user manual included in the repository.

## Contributions
If you would like to contribute to the development of Breeder Buddy, please feel free to submit a pull request. We welcome all contributions, no matter how big or small.

## License
Breeder Buddy is licensed under the MIT License.

## Contact
If you have any questions or concerns about Breeder Buddy, please don't hesitate to contact us.
