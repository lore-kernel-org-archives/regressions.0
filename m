Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862D374E1
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="dZLZnIpl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cc28719cb0so497545ad.0
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 15:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699487940; x=1700092740; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTTNdjX6EtMSKakiEYfW6PgDYdTre6g6BEczOH+kZ1w=;
        b=dZLZnIplAv3PcNXKzaTnM6zlhfZ1kODTUORayodzsEKIBHmZyPMZboWiMoL6mjEfab
         3qHYS27tx7yc1ISfQsQeSlWkUkPsOS483M9T1ZSRS2f4SfmkoaATbz8ylNqmzgNyggAl
         CbIrZJlxyB6uYh7yh339xMB4oUDkguQj/7F4u8Tt7d+lxIFJ5dj2TNUEedrhJCwnkJOJ
         4RHwrsjP5M0NGrrKMcs+UE54ONFmwC+PXNpRW0oRtf0gWA/chNw1s44+IR591afSKpkq
         ZXEwTsqs5XZB5OVDYmMSbpVPiOYXtAoSipJcGLeDgYA2mGNEevzsQJX37nr/TVTBQ1js
         ETrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699487940; x=1700092740;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTTNdjX6EtMSKakiEYfW6PgDYdTre6g6BEczOH+kZ1w=;
        b=bOjDk0rPEpII8fSwS18qnyR8qttHkWl/PZImX2/6+RT9y9hYyFEXorVTPTZLQTi3tO
         V0ztAcKkA9aAqr4H2OEcbR0VfKv35/sh+gWERZZ2lHikdc2uhi23oZ0qqHNTkOJOpbPL
         IL7QPnJQKavA6XFFhHNM+82jQ/0cSNM0qK0zbkX3/Vuj2xHwj8NDVcY87rkT0+12DyZa
         WQPW7kLjEp+Y3fO4g971svcR3QWvAjGci7lWypJvpRAGTlEobq2MWnEGUKXascQmiRFM
         dVq1yI9NABup/AtGaeekHusDc90SJ+u+HFMb+W5LtL7GUmOdgn4hWA8ucr7Krupp9AYZ
         3jgQ==
X-Gm-Message-State: AOJu0YyL2gIzdAff9X9KUAZC7049d02vlhKrEvXCxgb9114BVta+wVgR
	+3MMyv0uVEYDSTObUVFpm8hY+d9MgWtu/k+2HRxjUQ==
X-Google-Smtp-Source: AGHT+IH/MWKemw4UQDRBJXjezbSExHdKc+PaJ0uFLMMqohRAvfZxgoFjdJ+dq8bI7tqU4H9kuByRrQ==
X-Received: by 2002:a17:902:dac6:b0:1c6:9312:187 with SMTP id q6-20020a170902dac600b001c693120187mr3735679plx.3.1699487939883;
        Wed, 08 Nov 2023 15:58:59 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id h21-20020a170902eed500b001bf846dd2d0sm2244919plb.13.2023.11.08.15.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 15:58:59 -0800 (PST)
Message-ID: <0672220d-1b3a-46b3-811d-0a691e380097@kernel.dk>
Date: Wed, 8 Nov 2023 16:58:58 -0700
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
 <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
 <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
 <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk>
 <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk>
 <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com>
 <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk>
 <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
 <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com>
 <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
In-Reply-To: <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 3:18 PM, Jens Axboe wrote:
> OK, let me actually test this thing and see if I can make it solid
> first...

Here's a suitable hack - it just creates a new io worker for each item,
ensuring that that worker is run on the same CPU.

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 522196dfb0ff..3a14bc35f9ba 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -921,6 +921,67 @@ static bool io_wq_work_match_item(struct io_wq_work *work, void *data)
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
@@ -938,6 +999,10 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
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

