FROM postgres:11-alpine



# Set environment variables
ENV POSTGRES_DB=user_data
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

COPY starter.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL default port
EXPOSE 5431:5432
