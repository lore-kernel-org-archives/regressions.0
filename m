Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D61684BE
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 03:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469211; cv=none; b=uijwINMTGsCaH5slnkxWcBVxVEroeLmF3WJWBEIhWjPv8wN3XanGubyhPiLmcdL+yOQ0Ky/szqMOwncQwikRsAN5M4iLnwLZvp9CWdxs9R3ls7GHjp8k9IQo9hMQjm9TJeDew4o2qXrfwetUd6AfSegn4MASKIZ6UHJE7g//VEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469211; c=relaxed/simple;
	bh=rwTOmXellP2APmptdgYM7+fMuOZcObO44+euSbxxuGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgsOAH+fYn8p+v5XiZ0ktX4Z49r2YsuohabgR+NjNgmvD3qOu8vEMODkcvtZ7lW7o5oodRDMzWYeaRdbckGZCF1N56zMcQ+ZYJbjImTcrubIvEaOkq57uVs57OIqcpBBIRKE1FgJiSyMoVMZtKr6XWpEf6eBCmRWMJ0vS0V/XgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKeOevXf; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKeOevXf"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12e332315a8so8434777c88.0
        for <regressions@lists.linux.dev>; Sun, 10 May 2026 20:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469209; x=1779074009; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3PmEHf9UYRUqeCliUmozp/Gh5y1lEYZdEX3NcIRmss=;
        b=pKeOevXfxvUTSj6Uo1tR6p47cpu3PuufwsC0b+sBfK5EWJC456yX7bFNfkot/uIb63
         QgqWUryHoFN3oMqu6AAMsumiX3pUA4l/ofW6ztai91vSLen2//ZP9HoFJdIbF6FuE7kP
         ghv40OUwA0X7lG2LrB4KnhQ+zcmDeWJfaosvcgalx5O70b21CTHSMqa5QSyrRui2w6wd
         1QXCuy96A3wcq4NiDtKKfBO8Q23hvazyxI3XZDY7OaIiZFEQtjnGDJ/NpZLrsmqSf4E8
         nKyKZLCx3pop8V1wetZ6VxA0+zIoxRYbsOsrThUYDyB7MDO6c+nsymD5KpgEoMANARam
         P1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469209; x=1779074009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3PmEHf9UYRUqeCliUmozp/Gh5y1lEYZdEX3NcIRmss=;
        b=GAN9sOiebteqCwm0t+RLjWXLLpyh4VkYwMKYv/L1CiTGxP7rDncLw2wCEfZPNl/26A
         6dRe8u4dxHQN+F1WzjKN0af9V2du2NFcHyXbbcfu/+p/LSu/sqmDlhVhm0G1bj6LdRxb
         N+fi/gFxJT2Lpw4mie5VsBgpA6Nol+AUtg3wVn2lZQJbNBS+zBBKeXsCFeiLw0ecwf/0
         3mmp/u5U4abha/0TXlzVFPHEP18Ck0vBboOyfj7LydaIcZaulg8DekhTwjmrnsGRvX3E
         LWfFJ2ov6ngXLnVQ90edm2zfgMxAXUbLpF2DD3dKska+2wtXJ6qnSUbMWd5mMyzVOZR5
         kjXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/8/jkfpM9L3PFgnnSQVvWpLxEDCav5ASBeBorj+ZWuRvLbDetXxVLi+6jt/WldqRFFjhZm9tHgT+EoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB3Fl1plpG+32/SjM8MBy2uHeJWgqhpyeWJ6fCocSZ4cZn9atD
	o6FqRWPYm/WXJugEWKAcnLnEbbF9fTCiL67b03PL2Qx6IilQVERPzk36lrAxU6W1
X-Gm-Gg: Acq92OFmAGNocbhNVwAlnpnWHh3HOrI2VojdVGudh4cTUJR3iZyziEKglatTaKNYsIc
	pAXR1As9zYkwtwA5lGa8S8lYtfMslTfXKR10Wuq3kfybIQjVPS8N4W5wzThva2tR313MB72jVRn
	FTtiG7qqD3x0o6X2eJnJG0aE1cM7fXs6nIrliyLwnNpRqVtlm+CbqNajBDDC9ih1ncv0+AZanH4
	txmyTTTrvu9oLYr7XcgNC4+Gf7usuEAfqGkTrke/60bE5rcin3mJv35+nypF4TIihF02cEtIrck
	ooKhsax4wBZKlHMjmmeRellxA2YhjllmgiJPkcSuA5jWH62oMMEOICW+xvEOzbP7KcGr9ex4jC4
	mJUzWXPSXmF37TyDiZB8xM6guv0jn2F1NicDmJQfRT19kPgdhx90y8CgJUyVlos3Yw3OEOOJqwe
	yzAiswqGWMCoLaGsJ8z0YhxPuneUFu9Oys4uydd8QfZPf3yAIA2t8=
X-Received: by 2002:a05:7022:ea21:b0:130:6904:e817 with SMTP id a92af1059eb24-132a83eeb71mr3817495c88.39.1778469209120;
        Sun, 10 May 2026 20:13:29 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b820sm11702661eec.20.2026.05.10.20.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 20:13:28 -0700 (PDT)
Message-ID: <a7a0d78b-435e-43c8-b436-5e7f4dd39dee@gmail.com>
Date: Sun, 10 May 2026 20:13:26 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
References: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
 <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
 <1c165caf-36b4-4673-97fd-ed86bef17b88@leemhuis.info>
 <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com> <871pfj9cmj.ffs@tglx>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <871pfj9cmj.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thank you for the detailed analysis — this helps clarify the situation 
on the SPARC side.

You are correct that my earlier explanation focused too much on the core 
changes and not enough on the SPARC clockevents behaviour under the new 
forced-min-delta semantics. However, having a stable system is equally 
important and is the main reason that I developed the test patch (to 
help). However, your explanation makes sense.

I will apply your debug patch and capture the trace as requested.  If 
the system becomes unresponsive, I will enable ftrace_dump_on_oops so 
the trace is emitted when the hung task detector triggers.

Once I have the trace, I’ll send another email.

Thanks again for the guidance — I’ll follow up with trace results 
sometime tomorrow.

Tony

On 5/10/26 2:29 PM, Thomas Gleixner wrote:
> On Fri, May 08 2026 at 13:15, Tony Rodriguez wrote:
>> Just confirmed on my end today.  This regression also impacts both
>> SPARC64 S7-2 and SPARC64 T7-1 on v7.0.4 and v7.1-rc2 as well. Different
>> systems using the same exact kernels.
>>
>> ** Please see points (A1) (A2) (B1) (B2)
>>
>> Once again, I am not experiencing such issues when "my patch" (link
>> below) is added to address this regression.
>>
>> https://github.com/sparclinux/issues/issues/79#issuecomment-4362173884
> Github issues are really not helpful.
>
>> PS - On May 2nd 2026 at 9:42 PM: I also sent an email to Thomas Gleixner
>> regarding this issue.  Will be happy to validate any patches from your
>> end regarding this issue, as time permits me to do so.
> Sorry, that mail got lost as it was in reply to a random other archived
> thread which has absolutely nothing to do with the problem at hand.
>
> I just looked at your github thing. Despite your changelog claiming
> otherwise your "fix" breaks the DoS protection completely. It's a
> polished version of a revert.
>
> It also lacks a proper root cause analysis. This list:
>
>      - skipped programming events when delta <= min_delta_ns
>      - changed force semantics for overdue events
>      - introduced a sticky next_event_forced state
>      - returned success even when no event was programmed
>
> does not qualify and is actually wrong.
>
> The code does not unconditionally skip the programming of events when
> delta <= min_delta_ns. It only does so conditionally when the previous
> force programmed min_delta_ns event has not been delivered to the kernel
> yet, i.e. dev->next_event_forced is still set.
>
> That flag is only set when the minimal value has been successfully
> programmed and it _is_ cleared on the next timer interrupt, which should
> obviously happen due to this minimal delta programming. It is also
> cleared when a new event > min_delta_ns is successfully programmed
> _before_ the previous one was delivered.
>
> IOW, the core code programmed the hardware with the min_delta_ns
> (min_delta_ticks) timeout and the SPARC clockevents driver returned
> success (0). Now the core code refuses to do further reprogramming with
> the min_delta_ns timeout as that would shift the expiry (interrupt)
> further out until the interrupt actually is delivered or some other
> event which is not below the min_delta_ns threshold is programmed.
>
> So let's assume that this logic is causing the problem, then the only
> explanation for the observed behaviour is that the expected interrupt
> due to a forced min_delta_ns programming is never delivered.
>
> That made me look into the SPARC specific set_next_event() functions. I
> don't know which variant your machines are using, but all of them have
> the same underlying problem. The interrupt is based on a equal
> comparator, so the programming logic for each of the tick variants is:
>
> $variant_add_compare(delta)
> {
>        cmp = read_timer() + delta;
>        write_comparator(cmp);
>        now = read_timer();
>        return (now - cmp) > 0;
> }
>
> and the actual set_next_event() function which is invoked from the core
> code does:
>
>     return tick_operations.add_compare(delta) ? -ETIME : 0;
>
> IOW, when the timer read _after_ writing the comparator value is ahead
> of the comparator value the operation failed. Looks about right in
> theory.
>
> But then there is the reality of hardware which ruins everything. I've
> banged my head against the wall many years ago when debugging a similar
> issue with the x86 HPET which has the same hardware design failure of
> using a compare equal comparator instead of having a compare less than
> equal one. See the lengthy comment in hpet_clkevt_set_next_event() for
> further information.
>
> Can you apply the debug patch below, which will disable tracing once it
> hits the hung task detector and then retrieve the trace?
>
> If that's not possible as the system is unresponsive, then please add
> 'ftrace_dump_on_oops' on the kernel command line or enable it after boot
> in /proc/sys/kernel and let the kernel panic when it hits the hung task
> detector fail.
>
> Thanks,
>
>          tglx
> ---
> --- a/arch/sparc/kernel/time_64.c
> +++ b/arch/sparc/kernel/time_64.c
> @@ -732,8 +732,10 @@ void __irq_entry timer_interrupt(int irq
>   	if (unlikely(!evt->event_handler)) {
>   		printk(KERN_WARNING
>   		       "Spurious SPARC64 timer interrupt on cpu %d\n", cpu);
> -	} else
> +	} else {
> +		trace_printk("Invoking handler %pS\n", evt->event_handler);
>   		evt->event_handler(evt);
> +	}
>   
>   	irq_exit();
>   
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -248,6 +248,7 @@ static void hung_task_info(struct task_s
>   	 * accordingly
>   	 */
>   	if (sysctl_hung_task_warnings || hung_task_call_panic) {
> +		tracing_off();
>   		if (sysctl_hung_task_warnings > 0)
>   			sysctl_hung_task_warnings--;
>   		pr_err("INFO: task %s:%d blocked%s for more than %ld seconds.\n",
> --- a/kernel/time/clockevents.c
> +++ b/kernel/time/clockevents.c
> @@ -370,18 +370,22 @@ int clockevents_program_event(struct clo
>   		delta = min(delta, (int64_t) dev->max_delta_ns);
>   		cycles = ((u64)delta * dev->mult) >> dev->shift;
>   		if (!dev->set_next_event((unsigned long) cycles, dev)) {
> +			trace_printk("Successfully programmed %lld %lld\n", expires, delta);
>   			dev->next_event_forced = 0;
>   			return 0;
>   		}
>   	}
>   
> -	if (dev->next_event_forced)
> +	if (dev->next_event_forced) {
> +		trace_printk("Skipping %lld %lld\n", expires, delta);
>   		return 0;
> +	}
>   
>   	if (dev->set_next_event(dev->min_delta_ticks, dev)) {
>   		if (!force || clockevents_program_min_delta(dev))
>   			return -ETIME;
>   	}
> +	trace_printk("Force programmed min delta %lld %lld\n", expires, delta);
>   	dev->next_event_forced = 1;
>   	return 0;
>   }
