# Azure OpenAI

Microsoft provides a production-ready version of the original OpenAI API.
To use Azure OpenAI, you need to set the `OPENAI_API_BASE` and `OPENAI_API_KEY`
environment variables.

```bash
export OPENAI_API_BASE=https://{your-resource-name}.openai.azure.com/
export OPENAI_API_KEY=<your-api-key-goes-here>
```

SGPT will recognize that the user wish to use Azure OpenAI looking at the
`OPENAI_API_BASE` environment variable and will
automatically switch to the Azure OpenAI API mode.

## Notes

The Azure OpenAI service does not let us use all of the OpenAI models.
We need to deploy necessary models to Azure OpenAI.
See Azure OpenAI Metrics Dashboard for deploying models.