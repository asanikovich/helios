FROM rust:1.87-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev pkg-config build-essential curl git \
 && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Clone Helios repo
RUN git clone https://github.com/a16z/helios.git .

# Build Helios
RUN cargo build --release

# Use a minimal base image to reduce size
FROM debian:bookworm-slim

# Install necessary runtime dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates libssl-dev \
 && rm -rf /var/lib/apt/lists/*

# Copy compiled binary
COPY --from=0 /app/target/release/helios /usr/local/bin/helios

EXPOSE 8545

ENTRYPOINT ["/usr/local/bin/helios"]
