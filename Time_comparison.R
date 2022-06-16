# Producing plots for Chapter 3 and Chapter 4 from Tables in the Appendix
library(ggplot2)
# For Chapter 3 ----------------------------------------------------

  # Multiple mu and Single nu for log lambda --------------------------------
  
  data_1 = data.frame(time_seconds=c(1.09,0.75,1.84,1.08,0.8,1.87,1.08,0.66,1.73,1.12,0.82,1.95,1.7,0.6,2.31),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.05,0.05,0.04,0.08,0.05,0.08,0.08,0.06,0.04,0.07,0.06,0.03,0.10,0.06,0.09),
                      Method_used=rep(c('Method 1','Method 2','Method 3','Method 4','mpcmp'),each=3,times=1))
  
  a1 = ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression("Computation Speed For Multiple "*mu*" and Single "*nu*" with Standard Deviation")) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[9]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) # compare label = "mu*' \\''==T[6]"
  a1
  
  
  # Multiple mu and Multiple nu progressively becomes harder to evaluate for log lambda ------------------------------
  data_1 = data.frame(time_seconds=c(1.24,0.55,1.78,1.15,0.61,1.77,1.16,0.61,1.77,1.11,0.66,1.76,5.19,0.57,5.75),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.05,0.05,0.03,0.07,0.07,0.05,0.08,0.07,0.02,0.04,0.04,0.03,0.09,0.08,0.08),
                      Method_used=rep(c('Method 1','Method 2','Method 3','Method 4','mpcmp'),each=3,times=1))
  #data_1
  a2 = ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" and Multiple "*nu*" with Standard Deviation",paste("Progressively Becomes Harder to Evaluate")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds") +
    ylim(min(data_1$time_seconds-data_1$std),max(data_1$time_seconds+data_1$std))+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[6]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) # compare label = "mu*' \\''==T[6]"
  a2
  # Multiple mu getting bigger and Multiple nu getting smaller for log lambda --------
  data_1 = data.frame(time_seconds=c(1.38,0.47,1.83,1.36,0.47,1.83,1.14,0.63,1.76,1.10,0.61,1.71,4.75,0.52,5.27),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.09,0.06,0.06,0.07,0.06,0.06,0.06,0.06,0.03,0.07,0.05,0.04,0.09,0.08,0.05),
                      Method_used=rep(c('Method 1','Method 2','Method 3','Method 4','mpcmp'),each=3,times=1))
  #data_1
  a3 =ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" getting bigger and Multiple "*nu*" getting smaller",paste("with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds") +
    ylim(min(data_1$time_seconds-data_1$std),max(data_1$time_seconds+data_1$std))+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[7]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) # compare label = "mu*' \\''==T[6]"
  a3
  
  
  
  # Multiple mu and Single nu for log Z --------------------------------
  
  data_1 = data.frame(time_seconds=c(1.13,0.76,1.89,1.12,0.67,1.80,1.09,0.77,1.86,0.97,0.98,1.95,1.03,0.92,1.95),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.11,0.05,0.09,0.08,0.07,0.06,0.07,0.08,0.03,0.10,0.08,0.04,0.08,0.07,0.05),
                      Method_used=rep(c('Method 1','Method 2','Method 3','Method 4','mpcmp'),each=3,times=1))
  #data_1
  
  a4 = ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression("Computation Speed For Multiple "*mu*" and Single "*nu*" with Standard Deviation")) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[9]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) # compare label = "mu*' \\''==T[6]"
  a4
  
  
  # Multiple mu and Multiple nu progressively becomes harder to evaluate for log Z ------------------------------
  data_1 = data.frame(time_seconds=c(1.25,0.55,1.80,1.17,0.57,1.74,1.12,0.66,1.77,1.06,0.73,1.79,1.16,0.63,1.79),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.08,0.05,0.07,0.09,0.08,0.02,0.07,0.05,0.03,0.09,0.05,0.08,0.08,0.08,0.08),
                      Method_used=rep(c('Method 1','Method 2','Method 3','Method 4','mpcmp'),each=3,times=1))
  #data_1
  a5 = ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" and Multiple "*nu*" with Standard Deviation",paste("Progressively Becomes Harder to Evaluate")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds") +
    ylim(min(data_1$time_seconds-data_1$std),max(data_1$time_seconds+data_1$std))+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[6]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) # compare label = "mu*' \\''==T[6]"
  a5
  # Multiple mu getting bigger and Multiple nu getting smaller for log Z --------
  data_1 = data.frame(time_seconds=c(1.25,0.53,1.78,1.11,0.65,1.76,1.01,0.78,1.80,1.19,0.59,1.79,1.19,0.61,1.79),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.10,0.06,0.04,0.06,0.06,0.05,0.05,0.08,0.05,0.04,0.03,0.03,0.06,0.02,0.05),
                      Method_used=rep(c('Method 1','Method 2','Method 3','Method 4','mpcmp'),each=3,times=1))
  #data_1
  a6=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" getting bigger and Multiple "*nu*" getting smaller",paste("with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds") +
    ylim(min(data_1$time_seconds-data_1$std),max(data_1$time_seconds+data_1$std))+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[7]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) # compare label = "mu*' \\''==T[6]"
  a6
  
  
  
  # Multiple mu and Single nu for Overdispersed Case for pmf -----------------------------------------------------------------------
  data_1 = data.frame(time_seconds=c(1.42,0.70,2.12,1.38,0.68,2.06,1.27,0.84,2.11,1.30,0.95,2.25,1.36,0.57,1.92),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.05,0.05,0.05,0.08,0.08,0.03,0.07,0.07,0.05,0.10,0.07,0.05,0.05,0.05,0.03),
                      Method_used=rep(c('Method a','Method b','Method c','Method d','mpcmp'),each=3,times=1))
  #data_1
  
  
  b1=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" and Single "*nu*" for Overdispersed Case",paste("with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[10]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) +
    annotate("text",  x=Inf, y = Inf, label = "x* ''==T[6]", hjust=1,vjust=4,parse = TRUE,fontface = "bold",color="blue",size=5) #  # compare label = "mu*' \\''==T[6]"
  b1
  # Multiple mu and Single nu for Underdispersed Case for pmf -----------------------
  data_1 = data.frame(time_seconds=c(1.07,0.86,1.92,1.05,0.92,1.97,1.03,0.92,1.96,1.22,0.67,1.89,1.38,0.75,2.13),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.09,0.06,0.05,0.07,0.08,0.02,0.08,0.08,0.05,0.09,0.08,0.04,0.10,0.09,0.06),
                      Method_used=rep(c('Method a','Method b','Method c','Method d','mpcmp'),each=3,times=1))
  #data_1
  
  
  b2=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" and Single "*nu*" for Underdispersed Case",paste("with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[9]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) +
    annotate("text",  x=Inf, y = Inf, label = "x* ''==T[6]", hjust=1,vjust=4,parse = TRUE,fontface = "bold",color="blue",size=5) #  # compare label = "mu*' \\''==T[6]"
  b2
  
  
  
  # Multiple mu and Multiple nu progressively becomes harder to eval for pmf --------
  data_1 = data.frame(time_seconds=c(1.02,0.88,1.89,1.09,0.62,1.72,1.14,0.68,1.81,1.03,0.93,1.95,2.42,0.64,3.06),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.07,0.05,0.04,0.03,0.05,0.05,0.07,0.07,0.06,0.05,0.04,0.03,0.05,0.05,0.02),
                      Method_used=rep(c('Method a','Method b','Method c','Method d','mpcmp'),each=3,times=1))
  #data_1
  
  
  b3=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" and Multiple "*nu*" with Standard Deviation",paste("Progressively Becomes Harder to Evaluate")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[6]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) +
    annotate("text",  x=Inf, y = Inf, label = "x* ''==T[6]", hjust=1,vjust=4,parse = TRUE,fontface = "bold",color="blue",size=5) #  # compare label = "mu*' \\''==T[6]"
  b3
  
  
  # Multiple mu getting bigger and Multiple nu getting smaller for pmf --------------
  
  data_1 = data.frame(time_seconds=c(1.01,0.97,2.00,1.06,0.97,2.03,1.19,0.62,1.81,1.13,0.72,1.84,3.37,0.58,3.95),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=5),
                      std = c(0.05,0.07,0.08,0.06,0.06,0.04,0.06,0.06,0.04,0.09,0.07,0.05,0.11,0.07,0.07),
                      Method_used=rep(c('Method a','Method b','Method c','Method d','mpcmp'),each=3,times=1))
  #data_1
  
  
  b4=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed For Multiple "*mu*" getting bigger and Multiple "*nu*" getting smaller",paste("with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")+
    annotate("text",  x=Inf, y = Inf, label = "mu* ''==T[6]", hjust=1,vjust=1,parse = TRUE,fontface = "bold",color="blue",size=5)+
    annotate("text",  x=Inf, y = Inf, label = "nu* ''==T[7]", hjust=1,vjust=2.5,parse = TRUE,fontface = "bold",color="blue",size=5) +
    annotate("text",  x=Inf, y = Inf, label = "x* ''==T[6]", hjust=1,vjust=4,parse = TRUE,fontface = "bold",color="blue",size=5) #  # compare label = "mu*' \\''==T[6]"
  b4
  
  
  # Save the plots ----------------------------------------------------------
  
  # par(mfrow=c(2,2))
  # par(mfrow=c(3,1))
  
  # require(gridExtra)
  # 
  # grid.arrange(b1,b2,b3,b4,ncol=2,nrow=2)
  # grid.arrange(a1,a2,a3,ncol=3)
  # grid.arrange(a4,a5,a6,ncol=3)
  
  
# For Chapter 4 ----------------------------------------------------
  #takeoverbids dataset -------------------------------------------------------------------------
    data_1 = data.frame(time_seconds=c(352.67,0.56,353.25,236.85,0.51,237.35,992.12,0.08,992.27),
                        types_time=rep(c('user_time','system_time','elapsed_time'),times=3),
                        std = c(8.59,0.09,8.59,1.67,0.09,1.68,13.73,0.15,13.70),
                        Method_used=rep(c('Method c','Method d','mpcmp'),each=3,times=1))
    b5=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
      geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
      geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
      ggtitle(expression(atop("Computation Speed Posterior of "*beta*" and "*nu*" ",paste(" for Underdispersed Takeoverbids with Standard Deviation")))) +
      theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")
    
  
  b5
  
  # cottonbolls dataset -------------------------------------------------------------------------
  
  
  data_1 = data.frame(time_seconds=c(136.78,0.01,136.8,4440.81,0.346,4441.29),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=2),
                      std = c(2.86,0.01,2.84,85.55,0.18,85.70),
                      Method_used=rep(c('Method d','mpcmp'),each=3,times=1))
  
  b6=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed Posterior of "*beta*" and "*nu*" ",paste(" for Underdispersed Cottonbolls with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")
  
  b6
  
  # class attendance dataset --------------------------------------------------------
  
  data_1 = data.frame(time_seconds=c(12903.36,3.85,12908.29,12859.89,2.66,12881.08,12752.53,0.14,12753.16),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=3),
                      std = c(31.77,0.45,31.88,217.99,0.44,211.56,116.38,2.36,117.77),
                      Method_used=rep(c('Method c','Method d','mpcmp'),each=3,times=1))
  b7=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed Posterior of "*beta*" and "*nu*" ",paste(" for Overdispersed Class Attendance with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")
  
  b7
  
  # fish dataset ------------------------------------------------------------
  
  
  data_1 = data.frame(time_seconds=c(10723.05,1.81,10725.24,10716.73,1.26,10718.92,13006.37,6.11,13013.54),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=3),
                      std = c(120.97,0.85,121.37,124.48,1.23,124.79,118.44,4.83,122.17),
                      Method_used=rep(c('Method c','Method d','mpcmp'),each=3,times=1))
  
  b9=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed Posterior of "*beta*" and "*nu*" ",paste(" for Overdispersed Fish Dataset with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")
  
  b9
  
  
  
  # sitophilus dataset ------------------------------------------------------
  
  
  #
  data_1 = data.frame(time_seconds=c(282.24,0.32,282.56,191.44,0.216,191.74,1497.24,1.36,1498.95),
                      types_time=rep(c('user_time','system_time','elapsed_time'),times=3),
                      std = c(7.44,0.09,7.48,5.26,0.07,5.31,57.53,0.34,57.89),
                      Method_used=rep(c('Method c','Method d','mpcmp'),each=3,times=1))
  
  b8=ggplot(data_1, aes(x=types_time, y=time_seconds,fill=Method_used)) +
    geom_point(aes(fill=Method_used,color=Method_used),stat="identity", alpha=0.7,position=position_dodge(0.9))+
    geom_errorbar(aes(x=types_time,ymin=time_seconds-std,ymax=time_seconds+std,color=Method_used), width=0.3,position=position_dodge(0.9)) +
    ggtitle(expression(atop("Computation Speed Posterior of "*beta*" and "*nu*" ",paste(" for Sitophilus with Standard Deviation")))) +
    theme(plot.title = element_text(hjust = 0.5)) + xlab("Time Types") + ylab("Seconds")
  
  b8
  
  
  