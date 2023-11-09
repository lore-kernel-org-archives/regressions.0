Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC571DFF0
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Ivtelw3/"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3593f3ef420so1413465ab.1
        for <regressions@lists.linux.dev>; Thu, 09 Nov 2023 07:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699542730; x=1700147530; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y3tF+xbVFEAh0KxH0chR+TxnNRjfrIUTW+/I5k45E+0=;
        b=Ivtelw3/xBClQ7FSF8OFfY/IOMmcY3u7Z5T1yMc4S0BYaxSFI/dXGCBkPs/2kYA1CX
         sWhPSlPUacv0a9M6fDUJpE6uNp3XCn3do2h+TfxOAwlmSOilNn28f1ZA8wTp6q1e+uO8
         62kwOJC/c4Glqj5kMLHSJta+ULiWS6DG8vChUzgvjdp/MLjT5A8XeeVal++ryGoU9k6V
         rnY5U9JSM9yFVjcoFFbkyCvwAMkDvm3tTeLuLXG5tKmuneGBtTPt5q5TrCyLMQaTPSgG
         fP6fHtME0D0+w8jlXRNHmtQ2u0Zu13txh7R5sIMgjMgUKtMbWHxkFQEuAxkCKcOJtu3M
         xuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699542730; x=1700147530;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3tF+xbVFEAh0KxH0chR+TxnNRjfrIUTW+/I5k45E+0=;
        b=hx5FJ/+EhnTVdPfKsYYmapsOo8iRbeuJ89oT5rcF7Ko0AC2ttCdujmSGf0GS01L7P1
         fCyY7OHDwA8RzS2n0NaKcBx0IA7S92fh7ryG+KkrsS/DXfgOLDJkjZQ0lZeKUFyerXKu
         qMJabwr15O6H68xXYOKpC96FHnlr93VH6Ei9Kzf6+Kvo771BArAeiULo7nObW1NtgXdO
         z9RU3zEJUMEnfrNJ0T+psKd9uNyrRcXq7T5FKGVIpS9Joef8/6ZoMPIE5MfRZH7TiR9U
         ytuadVs1DLZXia19E2MuCNw/5PCQZTYaodWspa30jMxA/dZqLXh43D8QhgWYlbFUqQU5
         O4xg==
X-Gm-Message-State: AOJu0YxtBnI3OqaB0n8mNUFn2KWBfdARooIWR1ivF3RbXk8yc0BZsu7W
	kOFPB+cR2St8aQm3k9FIPND/fA==
X-Google-Smtp-Source: AGHT+IEf/1PR7tYAiah51uqsI7fiSCqUNIYx4/LGhfHDI/ntdTByMbCxvTl24iLnckUbLas/mzF9xQ==
X-Received: by 2002:a5d:8716:0:b0:7a9:7aa9:c175 with SMTP id u22-20020a5d8716000000b007a97aa9c175mr4872195iom.1.1699542729976;
        Thu, 09 Nov 2023 07:12:09 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id z60-20020a0293c2000000b00463fb5dd52dsm3268668jah.57.2023.11.09.07.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 07:12:09 -0800 (PST)
Message-ID: <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk>
Date: Thu, 9 Nov 2023 08:12:07 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
From: Jens Axboe <axboe@kernel.dk>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
 <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
 <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk>
 <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk>
 <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com>
 <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk>
 <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
 <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com>
 <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
 <0672220d-1b3a-46b3-811d-0a691e380097@kernel.dk>
Content-Language: en-US
In-Reply-To: <0672220d-1b3a-46b3-811d-0a691e380097@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 4:58 PM, Jens Axboe wrote:
> On 11/8/23 3:18 PM, Jens Axboe wrote:
>> OK, let me actually test this thing and see if I can make it solid
>> first...
> 
> Here's a suitable hack - it just creates a new io worker for each item,
> ensuring that that worker is run on the same CPU.

Turns out I didn't send you the current one, this one was older and
untested. Please try this one instead.

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 522196dfb0ff..41b4e281db8c 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -178,6 +178,8 @@ bool io_wq_worker_stopped(void)
 {
 	struct io_worker *worker = current->worker_private;
 
+	if (current->worker_private == current)
+		return false;
 	if (WARN_ON_ONCE(!io_wq_current_is_worker()))
 		return true;
 
@@ -693,7 +695,7 @@ void io_wq_worker_running(struct task_struct *tsk)
 {
 	struct io_worker *worker = tsk->worker_private;
 
-	if (!worker)
+	if (!worker || tsk->worker_private == tsk)
 		return;
 	if (!(worker->flags & IO_WORKER_F_UP))
 		return;
@@ -711,7 +713,7 @@ void io_wq_worker_sleeping(struct task_struct *tsk)
 {
 	struct io_worker *worker = tsk->worker_private;
 
-	if (!worker)
+	if (!worker || tsk->worker_private == tsk)
 		return;
 	if (!(worker->flags & IO_WORKER_F_UP))
 		return;
@@ -921,6 +923,67 @@ static bool io_wq_work_match_item(struct io_wq_work *work, void *data)
 	return work == data;
 }
 
+struct work_data {
+	struct io_wq_work *work;
+	struct io_wq *wq;
+	int cpu;
+};
+
+static int io_wq_single_worker(void *data)
+{
+	struct work_data *wd = data;
+	struct io_wq_work *work = wd->work;
+	struct io_wq *wq = wd->wq;
+
+	WARN_ON_ONCE(wd->cpu != raw_smp_processor_id());
+	kfree(wd);
+	do {
+		if (test_bit(IO_WQ_BIT_EXIT, &wq->state))
+			work->flags |= IO_WQ_WORK_CANCEL;
+		wq->do_work(work);
+		work = wq->free_work(work);
+	} while (work);
+
+	do_exit(0);
+	return 0;
+}
+
+static int io_wq_create_single(struct io_wq *wq, struct io_wq_work *work)
+{
+	struct task_struct *tsk;
+	struct work_data *wd;
+	cpumask_var_t new_mask;
+
+	wd = kmalloc(sizeof(*wd), GFP_NOIO);
+	if (!wd)
+		return false;
+
+	if (!alloc_cpumask_var(&new_mask, GFP_NOIO)) {
+		kfree(wd);
+		return false;
+	}
+
+	wd->work = work;
+	wd->cpu = raw_smp_processor_id();
+	wd->wq = wq,
+
+	cpumask_clear(new_mask);
+	cpumask_set_cpu(wd->cpu, new_mask);
+
+	tsk = create_io_thread(io_wq_single_worker, wd, NUMA_NO_NODE);
+	if (!IS_ERR(tsk)) {
+		tsk->worker_private = tsk;
+		set_cpus_allowed_ptr(tsk, new_mask);
+		free_cpumask_var(new_mask);
+		wake_up_new_task(tsk);
+		return true;
+	}
+
+	free_cpumask_var(new_mask);
+	kfree(wd);
+	return false;
+}
+
 void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 {
 	struct io_wq_acct *acct = io_work_get_acct(wq, work);
@@ -938,6 +1001,10 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 		return;
 	}
 
+	if (io_wq_create_single(wq, work))
+		return;
+
+	WARN_ON_ONCE(1);
 	raw_spin_lock(&acct->lock);
 	io_wq_insert_work(wq, work);
 	clear_bit(IO_ACCT_STALLED_BIT, &acct->flags);

-- 
Jens Axboe

