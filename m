Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D218C3A
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="CpsgRoWA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc41afd376so229835ad.1
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 14:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699481152; x=1700085952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EuhJd8KI9ibi62n3usP+MCy33GH9btZ2KOaiX2t5BmY=;
        b=CpsgRoWAVM+jwvCbP7zpUVGYjzWVX66G8GqEathR3yMkCAoxa3DYltzMgVRkN/ddLn
         ERrDe9F4fWN5hnvQLffjg2CsDqMFCXXM3TvB8e2+U+qD8AUZbp0cyrKPt9Osi//1hEZ+
         /0yHpv/JZI9hcoRA51x9pDbNwfBwYy1C/rnvROaGbHeIFrCVgyE8LHgwJ9DH9war4Epr
         4/GwDoRUNSWv4N3kJ+tTY5Bv7h0NqISiG7W3Ac9Nc80DVK2Nm1BFYMr9Zx/79gqAFoad
         M2qRGTiZcXLGyErVSb/uR+Zcspg/R5Yy+WMRxs561KLKmpX5MwMSaHEze5G0wwZu74Kg
         7ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699481152; x=1700085952;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuhJd8KI9ibi62n3usP+MCy33GH9btZ2KOaiX2t5BmY=;
        b=WztNow/Lbko42rifDy0JxwPHsENpdVawylK7KQTvkYGGjjwAjnCYnRgS/YTlPlYPRu
         Y/VMsBGZu+ScggVYMpskTd3Ggb67DN00im4w5YYngW5lwwTIoS9Jx60mJ3XDvHzJLMEP
         cmcEGzQnhKXd1TCV4axeEJHSBwU4G8S3glcaUXwHwp9NJAidt5nvoKhnyxW1LwldBdK1
         94Fg3WW4iLgDahUsQOA/T1EsJ9gGtlAshuy2D+IDBEa4F3/D6jCXqWHNPHyldgKG6FeM
         E0Fp7/AGYHw6x5+CLAIMqcZFgTzC5lMLdl19j4+lGVKo1y2sRph/k56CvIqBFuce8G/C
         WKEg==
X-Gm-Message-State: AOJu0Yxc4Fo/F2XuEYhNPf3ZFThWdWJmPR22GalRNDCEEy19A/ffXIQS
	TxnfkVV7sdVTDKlbPfaExtiBMjr+LIiqNWPWNS0=
X-Google-Smtp-Source: AGHT+IGR8sMUILJorKjcIhNL2TDan7ttAeWLJXOokqHjrdkxbIMWEb1vP8MBMAff8IHubuy55YFUcQ==
X-Received: by 2002:a17:902:e5cc:b0:1cc:e66:f994 with SMTP id u12-20020a170902e5cc00b001cc0e66f994mr3572837plf.1.1699481152029;
        Wed, 08 Nov 2023 14:05:52 -0800 (PST)
Received: from ?IPV6:2600:380:4a53:a4d4:ca17:af52:1427:836a? ([2600:380:4a53:a4d4:ca17:af52:1427:836a])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001b86dd825e7sm2182093plb.108.2023.11.08.14.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 14:05:51 -0800 (PST)
Message-ID: <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
Date: Wed, 8 Nov 2023 15:05:50 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <f1761483-1f59-42bd-b556-ad3dde998dbc@kernel.dk>
 <da7acad5-3297-4d25-95bf-81eb559d5244@kernel.dk>
 <479322567.45813366.1699463423245.JavaMail.zimbra@raptorengineeringinc.com>
 <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
 <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
 <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk>
 <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk>
 <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com>
 <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk>
In-Reply-To: <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 12:06 PM, Jens Axboe wrote:
>> I have been giving some thought to the CPU pinning of the workers, and
>> one thing that may have been overlooked is that this could potentially
>> force-serialize worker operations.  Did you just have to pin the io
>> workers or did the workqueue also need to be pinned for the corruption
>> to disappear?
> 
> Not sure I follow, the workers ARE the workqueue. For the pinning, I
> just made sure that the workers are on the same CPU. I honestly don't
> remember all the details there outside of what I can read back from the
> emails I sent, it's been a while. My suspicion back then was that it was
> some weird ppc cache aliasing effect with the copy into kernel memory
> happening on cpu X, and then we immediately punt it to cpu Y for
> processing.

You could try something like this, though I still need to verify that we
never end up running it on the wrong CPU. But may be worth a shot, for
debug purposes.

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index d3009d56af0b..3fc9912f6306 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -21,6 +21,7 @@ struct io_wq_work {
 	unsigned flags;
 	/* place it here instead of io_kiocb as it fills padding and saves 4B */
 	int cancel_seq;
+	int cpu;
 };
 
 struct io_fixed_file {
diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 522196dfb0ff..bdaae56c6517 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -59,6 +59,7 @@ struct io_worker {
 	unsigned long create_state;
 	struct callback_head create_work;
 	int create_index;
+	int last_cpu;
 
 	union {
 		struct rcu_head rcu;
@@ -286,6 +287,10 @@ static bool io_wq_activate_free_worker(struct io_wq *wq,
 			io_worker_release(worker);
 			continue;
 		}
+		if (worker->last_cpu != raw_smp_processor_id()) {
+			io_worker_release(worker);
+			continue;
+		}
 		/*
 		 * If the worker is already running, it's either already
 		 * starting work or finishing work. In either case, if it does
@@ -581,6 +586,8 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 		} else {
 			break;
 		}
+		if (work->cpu != worker->last_cpu)
+			printk("work cpu %d, me %d\n", work->cpu, worker->last_cpu);
 		io_assign_current_work(worker, work);
 		__set_current_state(TASK_RUNNING);
 
@@ -639,6 +646,7 @@ static int io_wq_worker(void *data)
 	while (!test_bit(IO_WQ_BIT_EXIT, &wq->state)) {
 		long ret;
 
+		worker->last_cpu = raw_smp_processor_id();
 		set_current_state(TASK_INTERRUPTIBLE);
 
 		/*
@@ -664,7 +672,10 @@ static int io_wq_worker(void *data)
 		raw_spin_unlock(&wq->lock);
 		if (io_run_task_work())
 			continue;
+		worker->last_cpu = raw_smp_processor_id();
 		ret = schedule_timeout(WORKER_IDLE_TIMEOUT);
+		if (worker->last_cpu != raw_smp_processor_id())
+			printk("was on %d, now %d\n", worker->last_cpu, raw_smp_processor_id());
 		if (signal_pending(current)) {
 			struct ksignal ksig;
 
@@ -725,9 +736,17 @@ void io_wq_worker_sleeping(struct task_struct *tsk)
 static void io_init_new_worker(struct io_wq *wq, struct io_worker *worker,
 			       struct task_struct *tsk)
 {
+	cpumask_var_t new_mask;
+
 	tsk->worker_private = worker;
 	worker->task = tsk;
-	set_cpus_allowed_ptr(tsk, wq->cpu_mask);
+
+	if (alloc_cpumask_var(&new_mask, GFP_NOIO)) {
+		cpumask_clear(new_mask);
+		cpumask_set_cpu(worker->last_cpu, new_mask);
+		set_cpus_allowed_ptr(tsk, new_mask);
+		free_cpumask_var(new_mask);
+	}
 
 	raw_spin_lock(&wq->lock);
 	hlist_nulls_add_head_rcu(&worker->nulls_node, &wq->free_list);
@@ -835,6 +854,7 @@ static bool create_io_worker(struct io_wq *wq, int index)
 	refcount_set(&worker->ref, 1);
 	worker->wq = wq;
 	raw_spin_lock_init(&worker->lock);
+	worker->last_cpu = raw_smp_processor_id();
 	init_completion(&worker->ref_done);
 
 	if (index == IO_WQ_ACCT_BOUND)
@@ -928,6 +948,8 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 	unsigned work_flags = work->flags;
 	bool do_create;
 
+	work->cpu = raw_smp_processor_id();
+
 	/*
 	 * If io-wq is exiting for this task, or if the request has explicitly
 	 * been marked as one that should not get executed, cancel it here.

-- 
Jens Axboe

