Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF71667DA
	for <regressions@lists.linux.dev>; Wed, 13 Nov 2024 22:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538188; cv=none; b=YsrhrcDGjwDqFs8xSPmUR2GZO/Rxc/0nZED5QnQTEFsJk0TDDA7SMJG/rVMi0bOpJJy7H6+bCDB3vFQxdtGMKN7lsUf2qEwQdClMBi8AYais5YDJlHezSwrLNmDwBnCddTR3yDtfHoam5qKhzvS9QKqStT/0YL/F9MvoSKRnwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538188; c=relaxed/simple;
	bh=ykcg8Fef1iKHGipEC0cGCA1oJ4uYT/CtTbCPaquxCb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVGxqXmwmhngyRUm4XQCLpuATlrJNHddjG/q2lH+cKl01bHEHf9EKvqBzL9Gi+2hOTP9fSA/bjHskCDlS8JWiDYwGNfvoKG4S2T5O58YLaqlzxKpAjlBhqB+OUKyg4Vo5w3kDDYz56+N1evGQFXDklARvRclWyUDJ9Ls1D59lbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YWZogl7r; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YWZogl7r"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cbf113dc8dso3735036d6.0
        for <regressions@lists.linux.dev>; Wed, 13 Nov 2024 14:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731538185; x=1732142985; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y/y0P4OqeeWZF74x2AMQJ4Ih3vxd26UzW3OzjwMKNw=;
        b=YWZogl7rKpG15YqgOHNLgmy0So59q4k5ATPPUnBANfxYMvXJHhWPId8LOMVLzFgIhc
         tia+6BWq33whl1P9xrwhXhyUUW/9x4n3KOSvlYZPwhGY5KNtU0+V6uuP2FMEfWKZPg4a
         6oGk8sAflaDgLV8QUIkH6TfD007lNrWSucSECj2pElsCSbZASILfKlAW4Y0v8m0wgRVZ
         G0f/WvK8VLOHRjqdljdYKLTluS44UciNHf32XXTVJFSk9FuVRr6MBtFQ1hm9DKKSkVNw
         hHktwLMR3ZDXcHN6M0zwnXYOmVt856p6et/rbzPYZpsKNKw5PkXjB51DKt5ORECCVpCt
         t6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731538185; x=1732142985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y/y0P4OqeeWZF74x2AMQJ4Ih3vxd26UzW3OzjwMKNw=;
        b=mjlQ+JOJbSDAlAd5HpcPH5a9qblq/gn3t7g4+rQ/fUQ9TcKaRukB6S7HZUGl+LNsUq
         qy7IXWVr6PAr6XN/uQ4NdqUmZV8xyPLtm5JQxSwJDwEHKfsgQGj8ZNQ8ubXhoGl4kIut
         TFaH0aVvSuXJvyuUMujY3hQPH+EBpQEYQsMlYqRaSQnv8iIxS7n8AzBRj8d8XCEoOFav
         bhThTo52K9yKqpRZ9fR7+BI8w/Xe+K96nWL2KWmmYwjAXWSqlqbr0KW5a3FoSi1rVhrz
         piIi37ibCu1Vo/wRz2BrvX6KQ90qIH7jrFiQJCT5VCsK92hqkYfGeoKjOu9RM0eIBlR6
         XgOg==
X-Forwarded-Encrypted: i=1; AJvYcCXAQkPILOYMLupk7GT80PsRC/ibRoPEmRap8/kjgVFrg07h2iccqR4eC0oD/V/OyJZ5dp18ppX1Zu5F0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrG0dEAip7K8PK4GMsFSNo54zv5JeOxMyjp9b0uhxDM7tGENOB
	tmn3A2Z8+Hf+6swOHYEToDn9zmHI5F3MvZ+n0pRmQC4xKnijMd8WIQnRuumZpIhWknwiPC3uYUb
	vTk8ie1CgE6hZYeEVe0u17EOamA8+1GoDnAIQfA==
X-Google-Smtp-Source: AGHT+IEVBkG+Vt0df6B4aIQ1qk8n7CToRwVSEBBWWEQATjd00M09LrjqoT5DZj8Ova9jzgvmF/Hidi0/5UP8wRPD5T4=
X-Received: by 2002:a05:6214:2aab:b0:6cb:4a88:8cf5 with SMTP id
 6a1803df08f44-6d39e101afemr119742786d6.2.1731538184672; Wed, 13 Nov 2024
 14:49:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6afb936f-17c7-43fa-90e0-b9e780866097@app.fastmail.com> <20241113215252.3977066-1-jstultz@google.com>
In-Reply-To: <20241113215252.3977066-1-jstultz@google.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 13 Nov 2024 23:49:33 +0100
Message-ID: <CADYN=9+mRq1Z3nR42-CR8CkmS1Oq456_vfKey0QnOg9nrfZuHA@mail.gmail.com>
Subject: Re: [RFC][PATCH] locking: rtmutex: Fix wake_q logic in task_blocks_on_rt_mutex
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-team@android.com, 
	Davidlohr Bueso <dave@stgolabs.net>, regressions@lists.linux.dev, 
	Thorsten Leemhuis <linux@leemhuis.info>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Nov 2024 at 22:53, John Stultz <jstultz@google.com> wrote:
>
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
> Anders: Can you double check this resolves the issue for you?

Thank you John for looking into the issue
It booted just fine on the rockpi4 now, ontop of tag next-2024111.

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

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
> Link: https://lore.kernel.org/lkml/6afb936f-17c7-43fa-90e0-b9e780866097@app.fastmail.com/
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>  kernel/locking/rtmutex.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index c7de80ee1f9d..a01e81179df0 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -1248,10 +1248,7 @@ static int __sched task_blocks_on_rt_mutex(struct rt_mutex_base *lock,
>
>                 /* Check whether the waiter should back out immediately */
>                 rtm = container_of(lock, struct rt_mutex, rtmutex);
> -               preempt_disable();
>                 res = __ww_mutex_add_waiter(waiter, rtm, ww_ctx, wake_q);
> -               wake_up_q(wake_q);
> -               preempt_enable();
>                 if (res) {
>                         raw_spin_lock(&task->pi_lock);
>                         rt_mutex_dequeue(lock, waiter);
> --
> 2.47.0.277.g8800431eea-goog
>
