Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF2199935
	for <regressions@lists.linux.dev>; Thu, 14 Nov 2024 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731609653; cv=none; b=B04zB43XFzDJMqxsAjXK0GFN6BpTaWvF+VDmjJZT3QdeehV0nnSZTQ0yRbkKxODfWs6nJRE8EEA0MVrCMpHL7dIokpBNoH6wycbL1BI8ejFh/kOPhwX3vsOmXjBtgX3p56WKUZI+IjLmwI7R2zi6SG14WAreUseeddAEHa8ydAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731609653; c=relaxed/simple;
	bh=oEk7BZ8L5KOfLVEi91rmtmNKS5T0Fm6ByTo0N0BCCWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5MwsOhQ6ZrN8Oaq7jfI0TZnDhc7MnhD96j3KUs3uftzuMd5L7ivVruqU88HoBsFwrVUW6eWqCGoT0lW/arQ7eg9lMYoXqH8xVU79JomVV/QSxJHmNN/RZTHPpwFNKGPFv+95BNPE9xfqgfM07q6n1C3T7N5QN6K7HDJ21foU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZsI9Qr/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZsI9Qr/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a4031f69fso155802066b.0
        for <regressions@lists.linux.dev>; Thu, 14 Nov 2024 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731609650; x=1732214450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEk7BZ8L5KOfLVEi91rmtmNKS5T0Fm6ByTo0N0BCCWw=;
        b=SZsI9Qr/oy8ib8tAcqVXCAdKR9dJkH9dENVQdl4+qsZTVeYVHmgNsiBREhQabxsABr
         8DPRGJn3FtPemc9pl1AzMpPw9g7BS+4nHaY/ljtpFfkezVpRgvmgUFXvrCP6Zh/lNzFJ
         DmmrWmeWPA5UWzidFpWht684ZEFEmpoYerl6mhI3IMXwJUd8ZuKiTzJHg03yraNwIUKc
         fDKVtfFH1fxmbzdMxWglHX5qK8neNXLXekhCnJCGaHbF5CiLo8sbUQuKiXRbsiM3132B
         ONlrDCQK0PzkAMPPcDoLMFbsuiF05b+3YfC50Cs+n/rJv4C/D3isuTySYwWcO1rM13qw
         3D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731609650; x=1732214450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEk7BZ8L5KOfLVEi91rmtmNKS5T0Fm6ByTo0N0BCCWw=;
        b=fi6UusQ+fTqwqpp3DufzIr+ttqkPdCiNuyH+vfIjjdbP+hSQ6AA8jdgjhJE9LxoKJc
         qdvlnIhxSc5w/mzSie6XfZ0RHtqVsTlxHnpcwKthxnjXfqfaZozKJfwuJYo1D+A4qgot
         WN6l0gl3WUzROV6aShCUSGn/tJiRWcNu+y4CxhsrX22lkebNWzk2hPzbkIAsWYkMILVu
         0Oc/z3tfZ0NQbH2Y0wyoBeWbCLYaDEEdjr+q7UNHBwzUOqpeIGylp0XOhdQ+5Li/uIwM
         iAhvG9g+kYpQtqE+sPsiJB8cIFAy4mh41f/ssnnO0DPvkLTdgaMWV1DIlq/JeqPJxYzx
         YmIw==
X-Forwarded-Encrypted: i=1; AJvYcCXE9H+U+csWPwYwJ/4+sMyNeWiIYfZaWHXEUwG0wPTDt2divLPJMQM8ldDIR/4pPVy29tkazeIdSMxAQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyZmtKqKrRwLIHY5WGRFWne/Ps5IGyZCDq5Gucp1JX1ECCjwOP
	e0CXbXWd7snZ+8GQPku+Oz1umE5h0ywa5BsniQUTSG0gLjgPkyo/ND5oH3i9hI+O4GzPFr0ldwa
	hUFlTKRUjjE2LW/yzdTLxWU+S2t5eA2CJp8M=
X-Google-Smtp-Source: AGHT+IE6B3oQcO5YzzGjxaKAskCM/mQFBoS4nrImpcvJVjwUqyLRcM6D1MKn+EAI33uAy64uNg76StiD/5f1/A8N1mI=
X-Received: by 2002:a17:906:c007:b0:aa1:f73b:be43 with SMTP id
 a640c23a62f3a-aa1f73bbf94mr637529866b.32.1731609649877; Thu, 14 Nov 2024
 10:40:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6afb936f-17c7-43fa-90e0-b9e780866097@app.fastmail.com>
 <20241113215252.3977066-1-jstultz@google.com> <f6dc7b18-e9af-de0f-7871-6ceb24e24459@amd.com>
In-Reply-To: <f6dc7b18-e9af-de0f-7871-6ceb24e24459@amd.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 14 Nov 2024 10:40:38 -0800
Message-ID: <CANDhNCqDJ1MTmvgZBtu0tOJJFyZXUTGbv+mKc8_jjkq5Ky0VgQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] locking: rtmutex: Fix wake_q logic in task_blocks_on_rt_mutex
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-team@android.com, 
	Davidlohr Bueso <dave@stgolabs.net>, regressions@lists.linux.dev, 
	Thorsten Leemhuis <linux@leemhuis.info>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 10:37=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
> On 11/14/2024 3:22 AM, John Stultz wrote:
> > Anders had bisected a crash using PREEMPT_RT with linux-next and
> > isolated it down to commit 894d1b3db41c ("locking/mutex: Remove
> > wakeups from under mutex::wait_lock"), where it seemed the
> > wake_q structure was somehow getting corrupted causing a null
> > pointer traversal.
> >
> > I was able to easily repoduce this with PREEMPT_RT and managed
> > to isolate down that through various call stacks we were
> > actually calling wake_up_q() twice on the same wake_q.
> >
> > I found that in the problematic commit, I had added the
> > wake_up_q() call in task_blocks_on_rt_mutex() around
> > __ww_mutex_add_waiter(), following a similar pattern in
> > __mutex_lock_common().
> >
> > However, its just wrong. We haven't dropped the lock->wait_lock,
> > so its contrary to the point of the original patch. And it
> > didn't match the __mutex_lock_common() logic of re-initializing
> > the wake_q after calling it midway in the stack.
> >
> > Looking at it now, the wake_up_q() call is incorrect and should
> > just be removed. So drop the erronious logic I had added.
> >
...
>
> I've been running rtmutex_lock torture test in addition to a few
> standard micro-benchmarks with the fix on my system on top of
> tip:sched/core and I haven't encountered any splats there. Feel free to
> add:
>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
>

Thank you so much for testing! I really appreciate it!
I'll resend with the provided tags and without the RFC here soon.
-john
