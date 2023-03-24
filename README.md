
# Platform Science Software Development Engineer in Test assignment


## Feedback
### Assumptions
- Los comandos deberian ejecutarse en orden.
- No es posible ejecutar instrucciones no reconocidas, esto deberia generar un error 400.
 -----
Apreciaran el apartado de CI/CD, Implementacion de caasos parametrizables y la variedad de funciones utilizadas.
### Detected Issues

 - La implementacion de la API no cuenta con respuestas consistentes. (se sospecha de algun tipo de cache)
 - Parece que las instrucciones no se ejecutan precisamente en orden.
 - El conteo de zonas con tierra es inconsistente, especialmente cuando existen instrucciones iguales consecutivas.
 - La Roomba no deberia poderse colocar fuera del cuarto.
 - Es posible ejecutar comandos invalidos por ejemplo "NSNEXW"
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
Implemente un proceso de CI/CD usando una instancia local de docker, una instalacion local de jenkins y para el reporte utilice AllureJS. Anexo algunas screenshots:
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-1.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-2.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-3.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-4.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-5.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-6.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-7.png)
![App Screenshot](https://github.com/isopropilick/EricPereyra-SDET-PS/raw/develop/Screenshots/CICD-8.png)

