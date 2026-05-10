Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6666A1A08A3;
	Sun, 10 May 2026 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778448600; cv=none; b=r1jrAtN5m+4brJFmokj5jyQ0ymWoNK4kQu2Om2cHokxhImoCWVgpUkYkIqNMM9xSakKsPsgCqeQ3vWVEgZVPtefrlbHmxb3uuXQxoVWfW2A7mHaHe6WBrFLtjzMyaVD2u31i4l9McO1QSxB+VzFBInztCY1Rfo0yq4DXATT9QjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778448600; c=relaxed/simple;
	bh=FdrNVSg7fcizkvWshXjVrtUyPWJCSG7U2/JCVvT97No=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LZVQBHKzT/vFHU0EiNKB8S4Wc8CjJXbjoWu+EgmJg1H8Tiv46IDDqsdrJqy4uo8SN0x4CCr+Yjb21ypfYphKPPvEeJgWRKphntu3O1bmJAnGcsY2KSdvmoHPBUUdSNNG/x72J6e343dqInWvbNT9z5CNxnzSl8vOHNvwMmrwgSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejoI4I14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejoI4I14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228CDC2BCB8;
	Sun, 10 May 2026 21:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778448599;
	bh=FdrNVSg7fcizkvWshXjVrtUyPWJCSG7U2/JCVvT97No=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ejoI4I14NrtnRWAkEZ4yk9FJ48xAnLIt28n1X8Evqzf47GKnvaKSobRrk6ZWwa3nc
	 Jod9XdY3eNSJfuWK0UKar4BX9mFR4U/TYzmdu7ETR8i6a2D9mlKEsO/zuElgirho4F
	 FE+3X8wf/l09OGCJRxPNLhClYxbaqyIsfsZEfemTMCE+Vz7jZGNQ9rWgsQPLXWQQL6
	 0iv7vqYAuZ/JScqgzN4qaE3fNjz9aC9wv5m+APWIfEgZC+XRVvu9e65zQhRxKOAHFh
	 9b93GcOyu9c7jqv4w37TV81l87ievCroVNeZxBh/huiB8faGp6GCp/cK/EXZus7NdK
	 fNpEOdVtd6wtw==
From: Thomas Gleixner <tglx@kernel.org>
To: Tony Rodriguez <unixpro1970@gmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Greg KH
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux kernel regressions list
 <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
In-Reply-To: <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com>
References: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
 <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
 <1c165caf-36b4-4673-97fd-ed86bef17b88@leemhuis.info>
 <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com>
Date: Sun, 10 May 2026 23:29:56 +0200
Message-ID: <871pfj9cmj.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 08 2026 at 13:15, Tony Rodriguez wrote:
> Just confirmed on my end today.=C2=A0 This regression also impacts both=20
> SPARC64 S7-2 and SPARC64 T7-1 on v7.0.4 and v7.1-rc2 as well. Different=20
> systems using the same exact kernels.
>
> ** Please see points (A1) (A2) (B1) (B2)
>
> Once again, I am not experiencing such issues when "my patch" (link=20
> below) is added to address this regression.
>
> https://github.com/sparclinux/issues/issues/79#issuecomment-4362173884

Github issues are really not helpful.

> PS - On May 2nd 2026 at 9:42 PM: I also sent an email to Thomas Gleixner=
=20
> regarding this issue.=C2=A0 Will be happy to validate any patches from yo=
ur=20
> end regarding this issue, as time permits me to do so.

Sorry, that mail got lost as it was in reply to a random other archived
thread which has absolutely nothing to do with the problem at hand.

I just looked at your github thing. Despite your changelog claiming
otherwise your "fix" breaks the DoS protection completely. It's a
polished version of a revert.

It also lacks a proper root cause analysis. This list:

    - skipped programming events when delta <=3D min_delta_ns
    - changed force semantics for overdue events
    - introduced a sticky next_event_forced state
    - returned success even when no event was programmed

does not qualify and is actually wrong.

The code does not unconditionally skip the programming of events when
delta <=3D min_delta_ns. It only does so conditionally when the previous
force programmed min_delta_ns event has not been delivered to the kernel
yet, i.e. dev->next_event_forced is still set.

That flag is only set when the minimal value has been successfully
programmed and it _is_ cleared on the next timer interrupt, which should
obviously happen due to this minimal delta programming. It is also
cleared when a new event > min_delta_ns is successfully programmed
_before_ the previous one was delivered.

IOW, the core code programmed the hardware with the min_delta_ns
(min_delta_ticks) timeout and the SPARC clockevents driver returned
success (0). Now the core code refuses to do further reprogramming with
the min_delta_ns timeout as that would shift the expiry (interrupt)
further out until the interrupt actually is delivered or some other
event which is not below the min_delta_ns threshold is programmed.

So let's assume that this logic is causing the problem, then the only
explanation for the observed behaviour is that the expected interrupt
due to a forced min_delta_ns programming is never delivered.=20

That made me look into the SPARC specific set_next_event() functions. I
don't know which variant your machines are using, but all of them have
the same underlying problem. The interrupt is based on a equal
comparator, so the programming logic for each of the tick variants is:

$variant_add_compare(delta)
{
      cmp =3D read_timer() + delta;
      write_comparator(cmp);
      now =3D read_timer();
      return (now - cmp) > 0;
}

and the actual set_next_event() function which is invoked from the core
code does:

   return tick_operations.add_compare(delta) ? -ETIME : 0;

IOW, when the timer read _after_ writing the comparator value is ahead
of the comparator value the operation failed. Looks about right in
theory.

But then there is the reality of hardware which ruins everything. I've
banged my head against the wall many years ago when debugging a similar
issue with the x86 HPET which has the same hardware design failure of
using a compare equal comparator instead of having a compare less than
equal one. See the lengthy comment in hpet_clkevt_set_next_event() for
further information.

Can you apply the debug patch below, which will disable tracing once it
hits the hung task detector and then retrieve the trace?

If that's not possible as the system is unresponsive, then please add
'ftrace_dump_on_oops' on the kernel command line or enable it after boot
in /proc/sys/kernel and let the kernel panic when it hits the hung task
detector fail.

Thanks,

        tglx
---
--- a/arch/sparc/kernel/time_64.c
+++ b/arch/sparc/kernel/time_64.c
@@ -732,8 +732,10 @@ void __irq_entry timer_interrupt(int irq
 	if (unlikely(!evt->event_handler)) {
 		printk(KERN_WARNING
 		       "Spurious SPARC64 timer interrupt on cpu %d\n", cpu);
-	} else
+	} else {
+		trace_printk("Invoking handler %pS\n", evt->event_handler);
 		evt->event_handler(evt);
+	}
=20
 	irq_exit();
=20
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -248,6 +248,7 @@ static void hung_task_info(struct task_s
 	 * accordingly
 	 */
 	if (sysctl_hung_task_warnings || hung_task_call_panic) {
+		tracing_off();
 		if (sysctl_hung_task_warnings > 0)
 			sysctl_hung_task_warnings--;
 		pr_err("INFO: task %s:%d blocked%s for more than %ld seconds.\n",
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -370,18 +370,22 @@ int clockevents_program_event(struct clo
 		delta =3D min(delta, (int64_t) dev->max_delta_ns);
 		cycles =3D ((u64)delta * dev->mult) >> dev->shift;
 		if (!dev->set_next_event((unsigned long) cycles, dev)) {
+			trace_printk("Successfully programmed %lld %lld\n", expires, delta);
 			dev->next_event_forced =3D 0;
 			return 0;
 		}
 	}
=20
-	if (dev->next_event_forced)
+	if (dev->next_event_forced) {
+		trace_printk("Skipping %lld %lld\n", expires, delta);
 		return 0;
+	}
=20
 	if (dev->set_next_event(dev->min_delta_ticks, dev)) {
 		if (!force || clockevents_program_min_delta(dev))
 			return -ETIME;
 	}
+	trace_printk("Force programmed min delta %lld %lld\n", expires, delta);
 	dev->next_event_forced =3D 1;
 	return 0;
 }
