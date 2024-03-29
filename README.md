AMC 10 Helper
============
A program to help train for AMC 10. Whenever one gets an answer and wants to check if it's correct, the answer has to be given away if you only have the answer key, which takes away the opportunity to try again.
This program solves the problem by retrieving the answer key and, after the answer is inputted, tells if it is correct or not.

### Setup
1. Create and```cd``` to a directory of your choice
2. Clone the repository into the directory:
    ```
    $ git clone https://github.com/s7a19t4r/amc10helper
    ```
3. Install cURL:

    Debian/WSL2:
    ```
    $ sudo apt install curl
    ```
    macOS:
    ```
    $ brew install curl
    ```
4. Set up dependencies by running 
    ```
    $ ./setup.sh
    ```
    If permission to run file is denied, run
    ```
    $ chmod +x ./setup.sh
    ```
    then run script again

