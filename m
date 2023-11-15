Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF63DBA3
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="wxRy9vBc"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-66d31e8d198so4790696d6.1
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 11:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700074856; x=1700679656; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhLnPERWq5tjD7lmJ6ixlZSQlgDV+yEiphjfBiNYI0U=;
        b=wxRy9vBcu6oVx2pqnnriDv51MZDkxh7e/vo/V4vlu0ecX3xpnoPyo2FwIWefrUaR9w
         KZBfReOjrSEwOOmIhte0Jf0+tC33UvSgQhBwSCE0JIzRJzVRN1eRwSepSna5qhPTHbNt
         TmT3EQkQEYZFVvsuR04A2cYpJ5lOXrQo7orPrHqv19CZ/yO62pUqURxyQRQq7ThAQFPR
         EPqP1gNmfi5/BHhZH3kNGyOWn0Xjflo3SRky9Kyqi7e8mFZg84F4naSg+EmDbmoLGZuC
         j8gRdpJjlW92hEUSHCEGV7BAI862l6WCoc5xJE+v10vaMNcs8k8GP46xOlvEMeOpFaoD
         ijOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700074856; x=1700679656;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhLnPERWq5tjD7lmJ6ixlZSQlgDV+yEiphjfBiNYI0U=;
        b=mQibE1Y227H+PiC29LxPg7qlQ2U1oyoGekrZ1OAP9bCrfVE2Hy3sbvswHP8/HadVlr
         +WR8AMyydIIbhnNzGlBGkWiQLIzoGZNnnrFU7Q1POoLci5+S5yuzvL4mrnC5SUG0/OEw
         ZFV7IgZkn3fiSwSAuzUzbWuGtuMcoPhUBRbSTLHJBSOISJcmdgzx0uetIYO99Q9DfEZk
         z6WenUw8Vljl/1eUX6oFzsmoqCTQiP/dLXjLOcJoDd/yNmT9IU1iJTReeiEvCOCW2mJH
         2CXEu6RmIc91mimy5SrU1+AenwmPlq+hIkbYlxUp141PGz08MMnuYr40R2poR8tbZ0Dr
         +d8A==
X-Gm-Message-State: AOJu0YxmwZDPLxfgVK8Hej+ZkRy/uuRuuD/HBfKw/Fl9kb3/0y0H7e1M
	/7HFF9l4Ac4Rtbh953KgAsIh/Q==
X-Google-Smtp-Source: AGHT+IHyO+XqY1OWDtxxmdn13ck8djj+nLv3NMKwWdGn6cL3yTa5AjZUG/aQC8HdDlUtNCNjQV5FYg==
X-Received: by 2002:a05:6214:57cb:b0:66d:b23:a62e with SMTP id lw11-20020a05621457cb00b0066d0b23a62emr6391460qvb.6.1700074856014;
        Wed, 15 Nov 2023 11:00:56 -0800 (PST)
Received: from ?IPV6:2600:380:9174:8ba6:574e:42be:c115:95f1? ([2600:380:9174:8ba6:574e:42be:c115:95f1])
        by smtp.gmail.com with ESMTPSA id cu19-20020a05621417d300b00668eb252523sm738410qvb.63.2023.11.15.11.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 11:00:55 -0800 (PST)
Message-ID: <bba85bd7-6f09-4d78-b33b-caa6a6dcb29c@kernel.dk>
Date: Wed, 15 Nov 2023 12:00:53 -0700
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
 Pavel Begunkov <asml.silence@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <350382475.47299876.1699982492471.JavaMail.zimbra@raptorengineeringinc.com>
 <1454519264.47306517.1699984644120.JavaMail.zimbra@raptorengineeringinc.com>
 <12a87e52-92b7-44c3-886e-63bb7ebe56a6@kernel.dk>
 <1948840273.47309805.1699985546123.JavaMail.zimbra@raptorengineeringinc.com>
 <c35cbe80-1db5-483e-9438-1fb50621a1cc@kernel.dk>
 <280793250.47485917.1700046208883.JavaMail.zimbra@raptorengineeringinc.com>
 <580f9fdb-475b-4b92-8e90-cab2100464ea@kernel.dk>
 <2046281833.47549655.1700067821653.JavaMail.zimbra@raptorengineeringinc.com>
 <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
In-Reply-To: <4e171c09-bb9a-422f-b92c-230bb1238b22@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/23 11:30 AM, Jens Axboe wrote:
> On 11/15/23 10:03 AM, Timothy Pearson wrote:
>>
>>
>> ----- Original Message -----
>>> From: "Jens Axboe" <axboe@kernel.dk>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>, "Michael Ellerman"
>>> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>
>>> Sent: Wednesday, November 15, 2023 10:46:58 AM
>>> Subject: Re: Regression in io_uring, leading to data corruption
>>
>>> On 11/15/23 4:03 AM, Timothy Pearson wrote:
>>>> I haven't had much success in getting the IPI path to work properly,
>>>> but by leaving task_work_add() in TWA_SIGNAL_NO_IPI mode I was at
>>>> least able to narrow down one of the areas that's going wrong.  Bear
>>>> in mind that as soon as I reenable IPI the corruption returns with a
>>>> vengeance, so this is not the correct fix yet by any means -- I am
>>>> currently soliciting feedback on what else might be going wrong at
>>>> this point since I've already spent a couple of weeks on this and am
>>>> not sure how much more time I can spend before we just have to shut
>>>> io_uring down on ppc64 for the forseeable future.
>>>>
>>>> Whatever the root cause actually is, something is *very* sensitive to
>>>> timing in both the worker thread creation path and the io_queue_sqe()
>>>> / io_queue_async() paths.  I can make the corruption disappear by
>>>> adding a udelay(1000) before io_queue_async() in the io_queue_sqe()
>>>> function, however no amount of memory barriers in the io_queue_async()
>>>> path (including in the kbuf recycling code) will fully resolve the
>>>> problem.
>>>>
>>>> Jens, would a small delay like that in io_queue_sqe() reduce the
>>>> amount of workers being created overall?  I know with some of the
>>>> other delay locations worker allocation was changing, from what I see
>>>> this one wouldn't seem to have much effect, but I'm still looking for
>>>> a sanity check.  If we're needing to wait for a millisecond for some
>>>> other thread to complete before moving on that might be valuable
>>>> information -- would also potentially tie in to the IPI path still
>>>> malfunctioning as the worker would immediately start executing.
>>>
>>> If io_queue_sqe() ultimately ends up punting to io-wq for this request,
>>> then yes doing a 1ms delay in there would ultimately then need to a 1ms
>>> delay before we either pass to an existing worker or create a new one.
>>>
>>>> On a related note, how is inter-thread safety of the io_kiocb buffer
>>>> list guaranteed, especially on weak memory model systems?  As I
>>>> understand it, different workers running on different cores could
>>>> potentially be interacting with the same kiocb request and the same
>>>> buffer list, and that does dovetail with the fact that punting to a
>>>> different I/O worker (usually on another core) seems to provoke the
>>>> problem.  I tried adding memory barriers to some of the basic recycle
>>>> functions without too much success -- it seemed to help somewhat, but
>>>> nowhere near complete resolution, and the buffers are used in a number
>>>> of other places I didn't even try to poke at.  I wanted to get some
>>>> feedback on this concept before going down yet another rabbit hole...
>>>
>>> This relies on the fact that we grab the wq lock before inserting this
>>> work, and the unlocking will be a barrier. It's important to note that
>>> this isn't any different than from before io-wq was using native
>>> workers, the only difference is that it used to be kthreads before, and
>>> now it's native threads to the application. The kthreads did a bunch of
>>> work to assume the necessary identity to do the read or write operation
>>> (which is ultimately why that approach went away, as it was just
>>> inherently unsafe), whereas the native threads do not as they already
>>> have what they need.
>>>
>>> I had a patch that just punted to a kthread and did the necessary
>>> kthread_use_mm(), perform op, kthread_unuse_mm() and it works fine at
>>> that point. Within the existing code...
>>
>> Would you happen to have that patch still?  It would provide a
>> possible starting point for figuring out the exact difference.  If not
>> I guess I could hack something similar up.
> 
> Let me see if I can find it, and make sure it applies on the current
> tree. I'll send you one in a bit.

Wrote a new one. This one has two different ways it can work:

1) By default, it uses the native io workers still, but rather than add
it to a list of pending items, it creates a new worker for each work
item. This means all writes that would've gone to io-wq will now just
fork a native worker and perform the write in a blocking fashion.

2) The fallback path for the above is that we punt it to a kthread,
which does the mm dance. This is similar to what we did before the
native workers. The fallback path is only hit if the worker creation
fails, but you can make it happen every time by just uncommenting that
return 1 in io_rewrite_io_thread().

The interesting thing about approach 1 is that while it still uses the
native workers, it will not need to be processing task_work and hence
signaling with TWA_SIGNAL or TWA_SIGNAL_NO_IPI to get it done. It simply
forks off a new worker every time, which does the work, then exits.

First try it as-is and see if that reproduces the issue. If it does,
then try uncommenting that return 1 mentioned in #2 above.


diff --git a/io_uring/rw.c b/io_uring/rw.c
index 64390d4e20c1..77e408bdb169 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -968,6 +968,8 @@ int io_read_mshot(struct io_kiocb *req, unsigned int issue_flags)
 	return IOU_OK;
 }
 
+static int io_rewrite_queue(struct io_kiocb *req);
+
 int io_write(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
@@ -1071,7 +1073,9 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 
 			if (kiocb->ki_flags & IOCB_WRITE)
 				io_req_end_write(req);
-			return ret ? ret : -EAGAIN;
+			if (io_rewrite_queue(req))
+				return -EAGAIN;
+			return IOU_ISSUE_SKIP_COMPLETE;
 		}
 done:
 		ret = kiocb_done(req, ret2, issue_flags);
@@ -1082,7 +1086,9 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 		if (!ret) {
 			if (kiocb->ki_flags & IOCB_WRITE)
 				io_req_end_write(req);
-			return -EAGAIN;
+			if (io_rewrite_queue(req))
+				return -EAGAIN;
+			return IOU_ISSUE_SKIP_COMPLETE;
 		}
 		return ret;
 	}
@@ -1092,6 +1098,79 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 	return ret;
 }
 
+struct koffload {
+	struct work_struct work;
+	struct io_kiocb *req;
+	struct mm_struct *mm;
+};
+
+static void io_rewrite(struct work_struct *work)
+{
+	struct koffload *k = container_of(work, struct koffload, work);
+	unsigned issue_flags = IO_URING_F_UNLOCKED;
+	int ret;
+
+	kthread_use_mm(k->mm);
+	ret = io_write(k->req, issue_flags);
+	kthread_unuse_mm(k->mm);
+	mmput(k->mm);
+
+	if (ret != IOU_ISSUE_SKIP_COMPLETE)
+		io_req_complete_post(k->req, issue_flags);
+	kfree(k);
+}
+
+static int io_write_io_thread(void *data)
+{
+	struct io_kiocb *req = data;
+	unsigned issue_flags = IO_URING_F_UNLOCKED;
+	int ret;
+
+	ret = io_write(req, issue_flags);
+	if (ret != IOU_ISSUE_SKIP_COMPLETE)
+		io_req_complete_post(req, issue_flags);
+
+	do_exit(0);
+}
+
+static int io_rewrite_io_thread(struct io_kiocb *req)
+{
+	struct task_struct *tsk;
+
+	/*
+	 * Uncomment this one to ALWAYS punt to a kthread
+	 */
+	// return 1;
+
+	tsk = create_io_thread(io_write_io_thread, req, NUMA_NO_NODE);
+	if (!IS_ERR(tsk)) {
+		wake_up_new_task(tsk);
+		return 0;
+	}
+
+	printk("%s: err=%ld\n", __FUNCTION__, PTR_ERR(tsk));
+	return 1;
+}
+
+static int io_rewrite_queue(struct io_kiocb *req)
+{
+	struct koffload *k;
+
+	if (!io_rewrite_io_thread(req))
+		return 0;
+
+	k = kmalloc(sizeof(*k), GFP_NOIO);
+	if (!k)
+		return 1;
+
+	INIT_WORK(&k->work, io_rewrite);
+	k->req = req;
+	mmget(current->mm);
+	k->mm = current->mm;
+	queue_work(system_wq, &k->work);
+	return 0;
+}
+
 void io_rw_fail(struct io_kiocb *req)
 {
 	int res;

-- 
Jens Axboe

