https://www.waveshare.com/w/upload/7/76/Cortex-M3-Definitive-Guide-EN.pdf

      page 52
      In the Cortex-M3, the instructions for accessing stack memory are PUSH and POP. The
      assembly language syntax is as follows (text after each semicolon [ ; ] is a comment):
      PUSH {R0} ; R13=R13-4, then Memory[R13] = R0
      POP {R0} ; R0 = Memory[R13], then R13 = R13 + 4
      
      chapter 10 (page 180)
      Cortex-M3 Programming
