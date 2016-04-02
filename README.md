__NAVIGUS CHALLENGE__
===========================================


UI for a website that deals with stock prices
===========================================
The data ,available at most of the stock prices, is very abstruse and is too
complex to apply any statistical programming language such as __R__. As the old adage says "a picture is worth a thousand worth" my assignment was to draw out some graphs for a statistical data.


What it does :
--------------------------------------------
*   The application provides with a user dashboard where the user can log into to find the proceedings of the work.



Requirements :
--------------------------------------------
*   NodeJS 
*   Meteor
*   Bootstrap
*   jQuery


How to run :
--------------------------------------------
*   curl the meteor source by running `curl https://install.meteor.com/ | sh`
*   Extract the contents of the zipped folder _navigus_ 
*   Run the `meteor` command and open the localhost:3000 on the browser.

File Structure
--------------------------------------------

*   The file structure complies to the structure of meteor apps. The static contents of the file are inside the `client` folder and are written in `jade`. I have taken the help of `http://html2jade.org/` to convert my html logic to jade. 
*   I have taken the examples of d3 js from mbostock's  github page and unfortunately I couldn't export the contents of csv file from an external file location. However, the data visualization works good for static data.
*   As per the requirement , I have not used any external framework, however I have used `metIsMenu` for providing menu option. Because of the constraint in time I coulnd't unfortunately convert it into a notification tray.
