const Redis = require('ioredis');
const nodes = [
	{
		port: 6379,
		host: "redis-node-0"
	},
	{
		port: 6379,
		host: "redis-node-1"
	},
	{
		port: 6379,
		host: "redis-node-2"
	},
	{
		port: 6379,
		host: "redis-node-3"
	},
	{
		port: 6379,
		host: "redis-node-4"
	},
	{
		port: 6379,
		host: "redis-node-5"
	},
]

const sub = new Redis.Cluster(nodes, {
	redisOptions:{
		scaleReads: "slave",
  },
});

sub.on('message', (channel, message) => {
    console.log(`Received the following message from ${channel}: ${message}`);
});

const channel = 'Count';

sub.subscribe(channel, (error, count) => {
    if (error) {
        throw new Error(error);
    }
    console.log(`Subscribed to ${count} channel. Listening for updates on the ${channel} channel.`);
});
