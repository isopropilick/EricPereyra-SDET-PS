
# Platform Science Software Development Engineer in Test assignment


## Feedback
### Assumptions
- Commands should be executed in order.
- It is not possible to execute unrecognized instructions, this should generate a 400 error.

You will appreciate the section on CI/CD, Implementation of parameterizable cases and the variety of functions used.

:)
### Detected Issues

- The implementation of the API does not have consistent responses. (some kind of cache is suspected)
- It seems that the instructions are not executed precisely in order.
- The count of dirt patches is inconsistent, especially when there are consecutive equal instructions.
- The Roomba should not be able to be placed outside the room.
- It is possible to execute invalid commands for example "NSNEXW"
## Running Tests

To run tests, run the following commands: (for MacOS and Linux)
```bash
sudo chmod +x service/run.sh
docker build -t pltsci-sdet-assignment service
docker run -d -p 8080:8080 --name pltsci-sdet-assignment pltsci-sdet-assignment
cd test
npm install
npm test
```


## CI/CD & reporte
I implemented a CI/CD process using a local docker instance, a local jenkins installation and for the report I used AllureJS. Annex some screenshots:
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-1.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-2.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-3.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-4.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-5.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-6.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-7.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/master/Screenshots/CICD-8.png)

