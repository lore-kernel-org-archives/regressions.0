Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DF17DFE7
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090208; cv=none; b=ci8DNYZOMP2QnQbzDwl3I0rU4zdcpLir47SS1RemzcKz9TeGxJ6sJoY+x/uatE/vDgTFVFBYUs2/V/Q0Sd50R13V2jMCdowXAStoTkGMmGrgXWN1kZGq78XXROcnRaByb//4OssWl+BQlcIfpekvkJpVoc3sD/IyVRv+emZAiV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090208; c=relaxed/simple;
	bh=MovC6lzwqjBIYUrOC7QBOqcc/WMNFxOnawRcJ7P2/Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hqr6hc43Uw8g5+Ojjuoa9brEvwngsry5Tcs6Nox9KpJN5mJvGvOh566fR4iqJzbspks2nmmsbDhMGVVrL3uBKYwh85vz1sac5kmMxM0IjRaeVZmH3mKhQ97MNe0uOXRYS4NvztY1XcsmkApiYZWPvVDE2cvFOhGxb5iUOuE6/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gc9A8k58; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gc9A8k58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779090205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkz4o1HCLWz8eoAHqvdPjV97uEnFp10w6ezT5caacdg=;
	b=Gc9A8k58vYjivikp6pAsUdHrnD9zgdHlkR40JMyiiFjOusNdTmUQ0NTNA93nAbd5M0P47x
	wjRi7+6mwz4egU7sZFN+eqB8H1eBcJ33uG0F1+pkSF0O3PmdzZ3pUZJ69R83QQHPgU1kHZ
	99YqT0V6vqWxMI7P0y22eyjIfA7ap4M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-FNd6_a9YMyCdQ95dnPJbGg-1; Mon, 18 May 2026 03:43:23 -0400
X-MC-Unique: FNd6_a9YMyCdQ95dnPJbGg-1
X-Mimecast-MFC-AGG-ID: FNd6_a9YMyCdQ95dnPJbGg_1779090203
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fd2b502e2so14481515e9.2
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 00:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090201; x=1779695001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkz4o1HCLWz8eoAHqvdPjV97uEnFp10w6ezT5caacdg=;
        b=Mi5z+1UVUrtvNtoVzXSbFWr6Yz6ic7wXIg0q1bTcF1U/OKhhB6/WVBLnScM1fZQ8NV
         w38zjpd689RVLMpMTnwhugnQ2pdxPuJ+i/EEPhoadOnNomfGAONqcQzMGCRovEeklApB
         JQJMRLgvGyzReeadThHLt0Rpc1c0ZqWZ5Wag1fc+eNhHPfLiHrim9Cla+IVuxI/R4MjM
         yjsZigo8jYDPxkU+LNggC5Qtf6HMLdesncVQ8xJLPgHBQrW5szjQbDkRNjkKZWdu1GSU
         +BGaKHkd0lCnrMTQ3Am4I9MyNbgPpdzP7GunZViNbxFNDFlm8pCmIwqmFhSknBBzDa1k
         Pv1A==
X-Forwarded-Encrypted: i=1; AFNElJ8GV5Tqcu1uviW08F4rC/wKxn0hjZCrWxsWcki5Bms52avW8TRY1LaRb4fy4Dr5Zpw3oz3TZ68XPgLOpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeRR9CHv4j1c9tL7aesYvpNqNASucmqKNRIVVFVZ1zggrQZkPc
	U9BuCT0RwkgPtjKPezfjmbitJWZCk+t87J1ZKKR773/aBM2hK8p9cakj8BMznlPplpKEEdfozCR
	X2/OTfx1sJogBlLUF48LqkfLCoRA+bwsrhBJ5s/8Zi7TYoN631gGsu7dNliVASDl45ZeJ1fdo
X-Gm-Gg: Acq92OGo74qa9dqNIy+kXvDwWZRScUaZhtnUR3XMPcaxqL5gXWDWZDoZGp9UkzZMH7y
	ftmQ6Q8k9l4aQ6MNXgchUNfZhTm+ExMxfOeYFbd7w1h1HRN1RNJpsYyiXNlbXc/0fhKs7oNzs3s
	aHB10n+N0OJenPnHooLXqpV7SB+X6mqOvsTfyTyA1l3XO3BVeaPlXLUyx38xf87mBt29tPO6Jw8
	KL0Q9a/Jx9enYs27d172kP/DFkBN1Oxx2I3gDhds/ccuj6thLI5qHr2ZeZ4TtvLFDD84PwQWiat
	RE/WdWlVcaKufZKUE/or76pqOVMUxjn4Ux6dMlFxLzcUbl/vHcJzo9q0SAoSqCpfhhUP7PU895B
	5t9mncqNQ7k7f1eDHDmy13qbrhEdK6jLdMMT0unrPfgyIo8tLo7L5
X-Received: by 2002:a05:600c:8189:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-48fe632249dmr217556755e9.16.1779090201292;
        Mon, 18 May 2026 00:43:21 -0700 (PDT)
X-Received: by 2002:a05:600c:8189:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-48fe632249dmr217556445e9.16.1779090200920;
        Mon, 18 May 2026 00:43:20 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.56.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c834besm241779275e9.3.2026.05.18.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:43:19 -0700 (PDT)
Date: Mon, 18 May 2026 09:43:18 +0200
From: "juri.lelli@redhat.com" <juri.lelli@redhat.com>
To: batcain <batcain@protonmail.com>
Cc: "peterz@infradead.org" <peterz@infradead.org>,
	"jstultz@google.com" <jstultz@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] sched/deadline: Hard lockup during CPU offline
 after commit 14a857056466
Message-ID: <agrDFlsPQxzWa9Xs@jlelli-thinkpadt14gen4.remote.csb>
References: <r16mBH1ydY4oK0PInLKwpYR2I5qZBsV5J0JsNLrXAh8OR_QC6z6lABKlcvpzgUiBuarTKtVTP977RLI4mqt64Ydtd2O3yfhRuRJkQ1JL8u8=@protonmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <r16mBH1ydY4oK0PInLKwpYR2I5qZBsV5J0JsNLrXAh8OR_QC6z6lABKlcvpzgUiBuarTKtVTP977RLI4mqt64Ydtd2O3yfhRuRJkQ1JL8u8=@protonmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6nUEexuSmMpZUdGMJ4fwYN8a0Tp1KXZpJiMZlxcNJbU_1779090203
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 16/05/26 03:07, batcain wrote:
> [1.] One line summary of the problem:sched/deadline: Hard lockup
> during CPU offline/migration due to frozen rq_clock loop in
> update_dl_revised_wakeup()
> 
> [2.] Full description of the problem/report: A deterministic hard
> lockup occurs during CPU hotplug (offlining a secondary core) on
> stable kernels containing commit
> 14a857056466be9d3d907a94e92a704ac1be149b.
> 
> When a CPU core is set offline, tasks are migrated within the
> stop_machine() context where local interrupts are fully disabled
> (irqs_disabled()). During task migration, enqueue_task_dl() calls
> update_dl_entity(). Because of the new dl_defer rule introduced for
> implicit dl_servers, the code is forced into the
> update_dl_revised_wakeup() branch.
> 
> Inside update_dl_revised_wakeup(), the logic depends on rq_clock(rq)
> to calculate laxity: u64 laxity = dl_se->deadline - rq_clock(rq);
> 
> However, under the stop_machine() noirq phase, the runqueue clock is
> stale/frozen. Since the clock does not progress across iterations
> within the enqueue loop, the mathematical state stalls. Consequently,
> dl_entity_overflow() continuously evaluates to true, trapping the
> processor core in an infinite loop inside the enqueue path, resulting
> in a system-wide hard lockup.

I cannot immediately see how this issue can affect dl-server(s), as they
cannot migrate and are de-activated on CPUs going offline.

> [3.] Keywords (keywords of the affected subsystem): sched, deadline,
> dl_server, cpuhp, hotplug, hard-lockup, regression
> 
> [4.] Kernel information (output of "uname -a" or version): Linux
> workstation 7.0.7-hardened2-1-hardened #1 SMP PREEMPT_DYNAMIC Fri, 15
> May 2026 00:03:13 +0000 x86_64 GNU/Linux
> 
> [5.] Most recent kernel version which did not have the bug: Any kernel
> release prior to the integration/backport of commit 14a857056466.
> 
> [6.] Output of Oops/Panic/Bug/Objdump: No native kernel oops/panic
> stack trace is written to disk/serial because the freeze occurs inside
> stop_machine() with interrupts masked. NMI watchdog triggers a hard
> lockup panic if aggressively armed.
> 
> [7.] A small program which triggers the problem: # echo 0 >
> /sys/devices/system/cpu/cpu1/online
> 
> [8.] Environment description (Hardware, distribution, etc.): Hardware:
> Confirmed on both AMD Zen 2 (Renoir) and AMD Zen 4 (Phoenix)
> platforms. Distribution: Arch Linux (using official
> extra/linux-hardened kernel package).

Also cannot reproduce at my end.

Thanks,
Juri

