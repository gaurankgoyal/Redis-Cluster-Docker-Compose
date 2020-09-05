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

const pub = new Redis.Cluster(nodes, {
	redisOptions:{
		scaleReads: "slave",
  },
});

var msg = 1;

const channel = 'Count';

const sleep = sec => new Promise(resolve => setTimeout(resolve, sec * 1000));

async function main() {
    console.log('Started publisher...')
    // Sleep 4 seconds and then publish garage door "opened" event.
		while (true){
    	await sleep(2);
    	pub.publish(channel, msg, (error, count) => {
			    if (error) {
			        throw new Error(error);
			    }});
			console.log(`Message Published ${msg} on channel ${channel}`);
			msg++;
		}
}

main();
