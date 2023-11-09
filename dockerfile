# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json to the container
COPY package.json .

# Install project dependencies using Yarn
RUN yarn install

# Copy the entire application code to the container
COPY . .

# Build the React application (you can customize this as needed)
RUN yarn build

# Expose a port, if needed (for development server or custom server)
EXPOSE 80

# Start the application (this is just an example, adjust as needed)
CMD ["yarn", "start"]

