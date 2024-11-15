Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117D2AE77
	for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731672384; cv=none; b=bUA4lXW7YmO4+PtP4a4LnD+010VDW+RsTDgNENqsj86a7eW2yypPRrm/m5rlAcgzxj0irhjn1TR34d7J35V1M2RFpN+fggQZleo4GmKKAB0cD1H3spVoLSG7Ha6iDpNPNSnUfcGkFC7L5Nk6GoAvZh5WLw6CehZDnSGnyi2u6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731672384; c=relaxed/simple;
	bh=9cLYF5Y9N14G0jya0Gw2sFofAVNisnbAW2MEgFStvNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bfzZiWcUEjqQ7MAWhY4VzeDUxJloi2UlQKYfM3qe6IYEv3ShwQQrblZWKrdMPzUvof146p3SjuRRKVeznJ4H8Bj//POZ3vapdcguW3YBuxOum3D0F7f1BU80b4ti+ub0muPHLEZW+aMEOk0oWnE5YkOPMTNJCH8jsp82Tst6xUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLYd1njX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLYd1njX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731672381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXKYfFH14d/tQ6qy22rrt9FvVPPlJ7Javhwa5aga5ck=;
	b=WLYd1njXLUxByHQAmCtQ+OWv7t0e0tqQAVRZDFvCF1KMqFksmI01ck/yoaJ9Z4vDYD4B8v
	uTgM/sAt8HAHOqLmuCyPrzHCb/17MtXYfZkWlzykMmiqiFtp+0nL49QBRv2S13rw6y4EYM
	zFWy74SgfYSRDAa/XEh9H3CyP6YfOpQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-r3higaDGO3G4G2605fPnzQ-1; Fri, 15 Nov 2024 07:06:20 -0500
X-MC-Unique: r3higaDGO3G4G2605fPnzQ-1
X-Mimecast-MFC-AGG-ID: r3higaDGO3G4G2605fPnzQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d5016d21eso934152f8f.3
        for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 04:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731672379; x=1732277179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXKYfFH14d/tQ6qy22rrt9FvVPPlJ7Javhwa5aga5ck=;
        b=p848do28KngwF+R0q2I2M6mEtEu+X2Sz+IVQKmUJyqgLTE5S6NkqRg9c8djzar7VtJ
         itmToEGTuFmxEjZhCXKUJSVp90yXeRFdtHPeaOiS53/2ZZyUc5/mniIzNvvC5pmhGJFn
         thKNvGaGmBDZYLV7FaB9SMgcKwVz/9XBSgAE3K0QW5DXp7+0DWfZlCl8GGf8FIODBqsZ
         omomBKCZAJY1EHimC0Em5euLQcWVTwHwEDsRYN48WpdiNk2xMiA+bITLu3r7ouaA9IJI
         rlC7WWJ849S6UUIk7MRD2bm891ZGnkCqUXlUpNFgbg5cG/GFWwKeCLGhSfqxlZBY1ZnY
         23zw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Srl5oQCDNH8A26oDwNojzpdUyL0+EBD6YvuWYwfTH5jEXhVWUlcIcA5AcovUMso985f3RRIMUp2SFw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfn6O2rYTC0kIFOqCc7FKsvCgWmz8AZInsqqP7Us39o4tv1is8
	nb1iqadQD2lG+dLtDUVAWyJkJyq2Err2mmH4OV9vy6n1T/e4OpNl5BXYAPecdbRnhp1G4RImTyn
	UWOZmbR/wjWIYEfr5ucSszps7vS0U8K3PUjeBhu35gYYT3tAN078xAHmg/0I3
X-Received: by 2002:a05:6000:156b:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3822590476cmr1855822f8f.13.1731672379000;
        Fri, 15 Nov 2024 04:06:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwGqn46v0gzfjomgwxM1BVXDUVHtJOb+t3C3YKWqeIhVYhUok1C59X+0aqnseP1q/9ZYQp3A==
X-Received: by 2002:a05:6000:156b:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3822590476cmr1855796f8f.13.1731672378603;
        Fri, 15 Nov 2024 04:06:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-80-47-4-194.as13285.net. [80.47.4.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada408dsm4169808f8f.10.2024.11.15.04.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 04:06:17 -0800 (PST)
Date: Fri, 15 Nov 2024 12:06:15 +0000
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Joel Fernandes <joelaf@google.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Benjamin Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-team@android.com,
	Davidlohr Bueso <dave@stgolabs.net>, regressions@lists.linux.dev,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] locking: rtmutex: Fix wake_q logic in
 task_blocks_on_rt_mutex
Message-ID: <Zzc5N_3jxOZ3ng3m@jlelli-thinkpadt14gen4.remote.csb>
References: <20241114190051.552665-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241114190051.552665-1-jstultz@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xA3xy1_s4yr5mjoR0mJe21juTmy95tSGf1nK3XYhIwM_1731672379
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

On 14/11/24 11:00, John Stultz wrote:
> Anders had bisected a crash using PREEMPT_RT with linux-next and
> isolated it down to commit 894d1b3db41c ("locking/mutex: Remove
> wakeups from under mutex::wait_lock"), where it seemed the
> wake_q structure was somehow getting corrupted causing a null
> pointer traversal.
> 
> I was able to easily repoduce this with PREEMPT_RT and managed
> to isolate down that through various call stacks we were
> actually calling wake_up_q() twice on the same wake_q.
> 
> I found that in the problematic commit, I had added the
> wake_up_q() call in task_blocks_on_rt_mutex() around
> __ww_mutex_add_waiter(), following a similar pattern in
> __mutex_lock_common().
> 
> However, its just wrong. We haven't dropped the lock->wait_lock,
> so its contrary to the point of the original patch. And it
> didn't match the __mutex_lock_common() logic of re-initializing
> the wake_q after calling it midway in the stack.
> 
> Looking at it now, the wake_up_q() call is incorrect and should
> just be removed. So drop the erronious logic I had added.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Joel Fernandes <joelaf@google.com>
> Cc: Qais Yousef <qyousef@layalina.io>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Benjamin Segall <bsegall@google.com>
> Cc: Zimuzo Ezeozue <zezeozue@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Metin Kaya <Metin.Kaya@arm.com>
> Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: kernel-team@android.com
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: regressions@lists.linux.dev
> Cc: Thorsten Leemhuis <linux@leemhuis.info>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Fixes: 894d1b3db41c ("locking/mutex: Remove wakeups from under mutex::wait_lock")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: https://lore.kernel.org/lkml/6afb936f-17c7-43fa-90e0-b9e780866097@app.fastmail.com/
> Tested-by: Anders Roxell <anders.roxell@linaro.org>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

LGTM.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

