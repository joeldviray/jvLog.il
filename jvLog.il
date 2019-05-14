procedure( jvLog()

x=geGetEditCellView()
;command="test"
time=getCurrentTime()
;pwd
library=x~>libName
cell=x~>cellName
view=x~>viewName

procedure( jvWhoAmI()
system("whoami > myName")
      let(( inPort nextLine)
        inPort = infile( "./myName")
        when( inPort
          while( gets( nextLine inPort)
         printf("%s" nextLine)

	 myName=nextLine	

          )
      close( inPort)
          )
         )
     )

procedure( jvPwd()
system("pwd > myPath")
      let(( inPort nextLine)
        inPort = infile( "./myPath")
        when( inPort
          while( gets( nextLine inPort)
         printf("%s" nextLine)

	 myPath=nextLine	

          )
      close( inPort)
          )
         )
     )
jvWhoAmI()
jvPwd()

newChar=pcreCompile("\n")
colon=pcreCompile(":")
space=pcreCompile(" ")
myName=pcreReplace(newChar myName "" 0) ;remove the newChar
myPath=pcreReplace(newChar myPath "" 0) ;remove the newChar
myTime=pcreReplace(colon time "" 0) ;remove the colon in time
myTime2=pcreReplace(space myTime "" 0) ;remove the spaces in time

myFile = strcat(command "_" myTime2 "_" myName)
myPort = outfile(strcat("/home/jviray/tmp/" myFile))
fprintf(myPort "************************************************************\n\n")
fprintf(myPort strcat(myName "\n"))
fprintf(myPort strcat(myPath "\n"))
fprintf(myPort strcat(time "\n"))
fprintf(myPort strcat(command "\n"))
fprintf(myPort strcat(library "\n"))
fprintf(myPort strcat(cell "\n"))
fprintf(myPort strcat(view "\n"))
fprintf(myPort strcat(" " "\n"))
close(myPort)

)

