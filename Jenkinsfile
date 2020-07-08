node {
    
   stage('Connect to Github') {
       git branch: 'master', url: 'https://github.com/pedro-solorzano/test-pipeline.git'
   }
   stage('Test commands') {
       dir('tests/api/') {
           withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
               sh 'ls'
               
               withEnv(['PATH+EXTRA=/node_modules/.bin/']) {
                   sh 'dredd'
              }
           }
       }
   }
   stage('Running Test') {
       withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
           dir('tests/api/') {
               sh 'ls -l'
               sh 'npm -v'
               sh 'node -v'
               withEnv(['PATH+EXTRA=/node_modules/.bin/']) {
                sh "dredd"
               }
           }
       }
   }
}