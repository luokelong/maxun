FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY maxun-core ./maxun-core

# Install dependencies
#aliyun: https://registry.npmmirror.com/
#ustc: https://npmreg.proxy.ustclug.org/
RUN npm install --registry=https://registry.npmmirror.com/ --verbose

# Copy frontend source code and config
COPY src ./src
COPY index.html ./
COPY vite.config.js ./
COPY tsconfig.json ./

# Expose the frontend port
EXPOSE 5173

# Start the frontend using the client script
CMD ["npm", "run", "client", "--", "--host"]