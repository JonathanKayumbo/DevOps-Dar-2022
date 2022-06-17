#!/usr/bin/env groovy
def COLOR_MAP = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']

//jenkins.io/doc/book/pipeline/shared-libraries

// function : responsible for generating the release info
def releaseTag(){
    def tag = 'MANUALLY ADDED'
    sh """
        echo "${tag}"
    """
}

// function : responsible for generating the artifact
def artifactGen(){
    def artifactName = 'ARTIFACT GENERATED'
    sh """
        echo "${artifactName}"
    """
}

return this
