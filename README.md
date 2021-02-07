<h1>ClearScore demo</h1>

<h2>How to run the code?</h2>

<p>
You can run 'xcodegen' by creating the project file:
(https://github.com/yonaskolb/XcodeGen)
it can be used for creating new project file, and sorting the file and folder structure. 
</p>
  
<h2>Project folder structure</h2>
 
<p>I am following some knowledge from VIPER archtecutre for this project. There aren't any third party libraries. It will add more complicattion for this project if I include any pods, because I dont recommendate to use pod straight inside the project, we should create wrapper class on top of it

project is spliting into 4 moudles 
<ul>

<li>ClearScore: main module to deploy on the simualtor device </li>

<li>Domain: business logic module, such as usecase and interactor places</li>

<li>API: server request module, this is using to make server request </li>

<li>ClearScoreUIKit: reuable ui module</li>
</ul>

each module will have their own unit test. 
</p>

<h2>Test alert pop up </h2>
<p>
you can test alert pop up by changing this url in the API Module
https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values
</p>
