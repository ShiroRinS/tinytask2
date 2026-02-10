FROM node:20-alpine

WORKDIR /app

# 1. Install ALL dependencies first to allow building
COPY package*.json ./
RUN npm ci

# 2. Copy the rest of the code
COPY . .

# 3. Build the application (Crucial for TypeScript/Next.js/Vite apps)
RUN npm run build

# 4. Expose the port
EXPOSE 3000

# 5. Start the app
CMD ["npm", "start"]