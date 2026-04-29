FROM astrocrpublic.azurecr.io/runtime:3.2-2

USER root

# Install git
RUN apt-get update && apt-get install -y git

# Fix protobuf conflict + install dbt
RUN pip install protobuf==4.25.3
RUN pip install dbt-core==1.7.9 dbt-snowflake==1.7.1

USER astro