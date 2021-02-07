clearScore

You can run xcodegen by creating the project file:
(https://github.com/yonaskolb/XcodeGen)
it can be used for creating new project file, and sorting the file and folder structure. 

I didnt use any third party library, if I do, I will need to create wrapper class on top of the framework, it would ad more complicate and work on this demo. 

I am following some knowledge from VIPER archtecutre for this project. 

project is spliting into 4 moudles 

ClearScore: main module to deploy on the simualtor device 

Domain: business logic module, such as usecase and interactor places

API: server request module, this is using to make server request 

ClearScoreUIKit: reuable ui module, 

each module will have their own unit test. 
