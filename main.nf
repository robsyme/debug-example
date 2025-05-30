params.local = "${projectDir}/data/NO_FILE"
params.remote = "s3://nextflow-summit-2025/pipeline_results/temp/versions.yml"


workflow {
    Channel.of(
        [[name: 'Winne'], [file(params.local), file(params.remote)]]
    )
    | DoSomething
    
}

process DoSomething {
    debug true
    container 'quay.io/nextflow/bash'
    input: 
    tuple val(meta), path(files)

    script:
    "cat *"
}