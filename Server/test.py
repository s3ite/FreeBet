from apscheduler.schedulers.blocking import BlockingScheduler
def todo():
    print("Hello")

if __name__ == '__main__':
    #Start the todo function every minutes
    scheduler = BlockingScheduler()
    scheduler.add_job(todo, 'interval', minutes=1)
    scheduler.start()