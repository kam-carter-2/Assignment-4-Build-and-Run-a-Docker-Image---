# Use the Node.js 16 base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package files into the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the application files into the container
COPY . .

# Document the port the application uses
EXPOSE 3000

# Start the application
CMD ["npm", "start"]