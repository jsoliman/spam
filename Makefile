PACKAGE_PATH=com/drin/java
PACKAGE_PRFX=com.drin.java
JAVADOC=documentation

SPAM_MAIN=com.drin.java.ClusterInterface
SPAM_GUI_MAIN=com.drin.java.gui.SpamGUI

CC = javac
ENGINE = java
JFLAGS = -deprecation -Xlint

compile: clean spam

spam: ClusterInterface.java
	@echo "-------------------------------"
	find $(PACKAGE_PATH) -name $^ | xargs $(CC) $(JFLAGS) $(CLASSES)
	@echo "-------------------------------"

runSpam:
	@echo "running..."
	$(ENGINE) $(SPAM_MAIN)
	@echo "finished running."

spamGUI: SpamGUI.java ClusterInterface.java
	@echo "-------------------------------"
	find $(PACKAGE_PATH) -name $^ | xargs $(CC) $(JFLAGS) $(CLASSES)
	@echo "-------------------------------"

runGUI:
	@echo "running..."
	$(ENGINE) $(SPAM_GUI_MAIN)
	@echo "finished running."

document: docSpam

docSpam:
	javadoc -d ${JAVADOC} spam/dataParser/XMLParser/PyroMarkParser/PyroMarkParser.java -link http://download.oracle.com/javase/6/docs/api

#################################
############ Drivers ############
#################################

SpamGUI.java:

ClusterInterface.java:

cleanDocs:
	rm -rf ${JAVADOC}/*

clean:
	@echo "-------------------------------"
	@echo "*** Cleaning Files..."
	find $(PACKAGE_PATH) -name *.class | xargs rm -f
	@echo "-------------------------------"
