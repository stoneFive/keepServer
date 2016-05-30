package com.keep.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import com.keep.entity.note.Note;
import com.keep.sys.service.NoteService;

/**
 * 定时删除过期的笔记
 * 
 * @author lance
 *
 */
//@Component
public class Task implements Runnable {
	private static final Logger log = LoggerFactory.getLogger(Task.class);
	private static ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);

	private static final int INITIALDELAY = 30; // 线程初始化时间

	private static final int PERIOD = 30;

	private static final int SYNC_SIZE = 500;

	private static boolean flag = false;
	@Autowired
	private NoteService noteService;

	public Task() {

		if (!flag) {
			log.debug("检查作业任务是否过期...");
			flag = true;
			scheduled.scheduleWithFixedDelay(this, INITIALDELAY, PERIOD, TimeUnit.SECONDS);
		}
	}

	@Override
	public void run() {

		//doTask();
	}

	private synchronized void doTask() {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("EQI_status", 1);
		List<Note> notes = noteService.search(param, 0, SYNC_SIZE, "DESC", "updateTime").getContent();

		for (Note n : notes) {
			noteService.delete(n.getId());
		}
	}
}
