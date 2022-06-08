#!/bin/bash

# functions
bsTemplate(){
echo "
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>

"
}

expressTemplate(){
echo "
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Hello World!')
})

app.listen(port, () => {
    console.log('App is running on port 3000')
})
"
}

twTemplate(){
echo "
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="/dist/output.css" rel="stylesheet">
</head>
<body>
  <h1 class="text-3xl font-bold underline">
    Hello world!
  </h1>
</body>
</html>
"
}

# main 

echo "PROJECT GENERATOR StingakEduOS V1.0"
echo "===================================="

echo "1. Laravel 9 via Composer"
echo "2. React"
echo "3. Express"
echo "4. Next JS"
echo "5. TailwindCSS Starter Project"
echo "6. BootstrapCSS Starter Project"

echo "===================================="
read -p "Pilih Project: " PILIH_PROJECT 
clear
read -p "Nama Project: " NAMA_PROJECT
clear

echo "Daftar Directory tersedia: "
ls -d */
printf "\n"  
read -p "Pilih Directory Tempat Project Tersimpan: " NAMA_DIRECTORY


if (($PILIH_PROJECT == 1));
then 

    cd $NAMA_DIRECTORY

    composer create-project laravel/laravel $NAMA_PROJECT

    cd $NAMA_PROJECT

    code .
    clear
    echo "Happy Coding! Silahkan baca dokumentasi lengkap di https://laravel.com/docs/9.x"
elif (($PILIH_PROJECT == 2)); 
then 
    cd $NAMA_DIRECTORY

    npx create-react-app@latest $NAMA_PROJECT
    
    cd $NAMA_PROJECT

    code .
    clear
    echo "Happy Coding! Silahkan baca dokumentasi lengkap di https://reactjs.org/docs/getting-started.html"
elif (($PILIH_PROJECT == 3));
then 
    cd $NAMA_DIRECTORY

    read -p "Buat Project dengan Express Generator?(y/n)" IS_GENERATOR

    if [[ $IS_GENERATOR == "y" || $IS_GENERATOR == "Y" ]];
    then 
        express --view=ejs $NAMA_PROJECT

        cd $NAMA_PROJECT

        npm install

        code .
    elif [[ $IS_GENERATOR == "N" || $IS_GENERATOR == "n" ]];
    then 
        mkdir $NAMA_PROJECT
        cd $NAMA_PROJECT

        touch index.js
        expressTemplate > index.js

        npm init -y

        npm install express

        code .
        
    fi
    clear
    echo "Happy Coding! Silahkan baca dokumentasi lengkap di https://expressjs.com/"
elif (($PILIH_PROJECT == 4));
then 
    cd $NAMA_DIRECTORY

    npx create-next-app@latest $NAMA_PROJECT

    cd $NAMA_PROJECT

    code .
    clear
    echo "Happy Coding! Silahkan baca dokumentasi lengkap di https://nextjs.org/"
elif (($PILIH_PROJECT == 5));
then 
    cd $NAMA_DIRECTORY

    mkdir $NAMA_PROJECT
    cd $NAMA_PROJECT

    npm init -y 
    npm install -D tailwindcss
    npx tailwindcss init


    # starter dir
    mkdir public src

    # starter file
    touch index.html 
    touch src/input.css

    # add this to input.css
echo "
@tailwind base;
@tailwind components;
@tailwind utilities;
" > src/input.css

    # add starter to index.html
    twTemplate > index.html

    clear

    code .
    clear
    echo "Happy Coding! Silahkan baca dokumentasi lengkap di https://tailwindcss.com/"

elif (($PILIH_PROJECT == 6));
then 
    cd $NAMA_DIRECTORY

    mkdir $NAMA_PROJECT
    cd $NAMA_PROJECT
    touch index.html


    bsTemplate > index.html

    code .
    clear
    echo "Happy Coding! Silahkan baca dokumentasi lengkap di https://getbootstrap.com/docs/5.0/getting-started/introduction/"
fi


