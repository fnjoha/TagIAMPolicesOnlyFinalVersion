# Provide the path to your CSV file
$CSV_FILE = "C:\Users\fnjoh\AWS CSV files And Scripts\IAMNottagged2024Folder\IAMRoleUntaggedSamplequotesMode.txt"

# Read the CSV file and add tags to IAM policies
Get-Content $CSV_FILE | ForEach-Object {
    # Split CSV columns into variables
    $policyArn, $tags = $_ -split ','

    # Print the tags for debugging
    Write-Host "Policy ARN: $policyArn, Tags: $tags"

    # Add tags to IAM policy
    aws iam tag-policy --policy-arn $policyArn --tags Key=zotec:team,Value="Revenue Cycle Cloud" --profile Prod
}