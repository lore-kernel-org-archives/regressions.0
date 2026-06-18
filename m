Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE03CC9E9
	for <regressions@lists.linux.dev>; Thu, 18 Jun 2026 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767807; cv=none; b=FGOyvP1CM7SNjtUJgvBYIm/NUvNUVY1Gd0tbhq190BLyTXoM2pZkVOHBmDKmCmBeXz17tKu279jxFnSPkdinLSReBMJ4CYaj+MuzPZcGU/lkRegzi9exOBJK1SN9zOu9pffOtwuubS6fm46okqo/aJP5I62DW35xWpzZ9HgZP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767807; c=relaxed/simple;
	bh=JEnKD1wFAoz9j9E5jUkwUH3p254IwBGXQXfzzoIk2VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKIden8J8sd/S+se4hBm7ffjv9H7IYg7SzojCey+587VSwxYgadfTHq0MyYtWhDdJgWos9HuQndcHchl2MZK1kiSex6n+u6O3Za7bzw+3eiWEf2fEg884fhpEyPLvBElxDdccXeD1C8p4gkZoG/2GNXUTcPpVdWmORA5qKLX19A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGus2fv4; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGus2fv4"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bf854d5feso397153eec.0
        for <regressions@lists.linux.dev>; Thu, 18 Jun 2026 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781767803; x=1782372603; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKjXhnSsBnhZ4F08z0E4PlAmKDbxADWEf7nB5X3WBlw=;
        b=cGus2fv4dn836GkvZOU5OGOF1lPqPKR5OdXe5GA3ErxdFeLqioPvxfaqooMWlYH2ic
         QMKXYxRJQiBi/W0xXwHwEIorQm3XXIEggyBm3mW7yAGwNt37gKZh9fVYJy80lXNHKLy/
         Q0YBFuKFGXvAQ1eSt6V/f8feVa109tjjGDVMqFw+cKb4JfT6n8+LPmvH0kw1RCz7kxbW
         P9PLdkgJeeoMr0EUpd7nc4yOV5LN4EvUs6ymMbDEpd+/73ccRT/QXDAmbjMMtzx55V9t
         +ox/BAlSZm+aroLvdalvqfbYVdahcLHiYAmBE5WLlsfBI4VU+o9P63ZZBaN2AIpoPANH
         VkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767803; x=1782372603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKjXhnSsBnhZ4F08z0E4PlAmKDbxADWEf7nB5X3WBlw=;
        b=gsC7s0gdNDfNLgBjUPSYC3hGbXTlBOGBpc1HOEvBHCHJJ8aAHd9G9TBWZ+joCw+Vj6
         Gw1s4S0ubODtzAvQs4ez7zP/fLP3Jpgkq9xlF37jblGWY4O7dsztUZKCshFCeH3S00m1
         1XboqEC4LIVAFIqJKIp5lADBuKMK3PM3aqecliIQXR1YxTRW64oHO8fagSxA5JR71fTB
         2KGP3SwtQcSm9Zy5oIMrdRI1iZ69wAovP/DPNe/9exrUjRn5pcvKI4r3zwIvjBsBwjWh
         dD05wpZn1qVZFziZJM/7cQkE6a8mCOH2EHUteXSDsv1oQmYROA6WP3CounEzX+2DqHxy
         2Ulg==
X-Forwarded-Encrypted: i=1; AFNElJ+L7k7ncXDl5DGBZEnS7Rsomv0VRHVKCGb02Kco48O7aX8xCR3c3BEqfv64EZlSNBUygnGo6s6w+QU83A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaF3S6Sw5mZo85mUC1sSG6J3qJze109COEtTqBC4TkdntBPp9B
	EP8AipTkJYGc1soJ4qDUMb4TpMk6MHHyyrJ+cClxRjc1niZ+rSBGHess
X-Gm-Gg: AfdE7cn4dSAdEUKw+LAckVek+KMB9g9e7+4Ae0SZuMlCbjP2VHUfZ8sA1w//JbKRWfZ
	cBH53D02fB/nOmZEPIrZjxLPAao5+FUcEhJc1n7cO2XzUDFokEq5FOJrkilzk/bcGu33UlkTB5H
	C15dmZ9lfqlmMQjmzOU5FLCdw0tHJ0sIf+nmyNp2folf4nAJk4McSNgRsWSyMnYH2qv8hKRQ6G4
	gKeFPO7k8TPeow3OXpTgWh9VI6dCn9Dzyr9OcnpZkYh2BYquyyvxE0OBV5l4qcQJH3HhrRhJA6f
	BOF0HDV/w1sxKPxb+wfd73o8/r/wxNGTJ2xB+GkiaO2oCKUz225gvNgdZaA4jlwFf8BMWbzUHYi
	glL/4XyE+VKYltfr7KKbmbtlZ4qbLogSeKs5ue0CwDJcfe4vhv27LRJoxauY4Dheijw1TVLBk3B
	tC4Jv9wxT6GWjUu8Tu
X-Received: by 2002:a05:7300:e68b:b0:30b:e540:4260 with SMTP id 5a478bee46e88-30bf0948038mr1654274eec.19.1781767802774;
        Thu, 18 Jun 2026 00:30:02 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bcbb684absm5195050eec.1.2026.06.18.00.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:30:02 -0700 (PDT)
Message-ID: <d58e1648-65b9-479e-97f4-1bbe4cf44799@gmail.com>
Date: Thu, 18 Jun 2026 00:29:59 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 1/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Content-Language: en-US
To: Andreas Larsson <andreas@gaisler.com>,
 David Laight <david.laight.linux@gmail.com>,
 Andreas Larsson <andreas.larsson@gaisler.com>
Cc: davem@davemloft.net, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, thuth@redhat.com, regressions@lists.linux.dev,
 glaubitz@physik.fu-berlin.de
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260519075809.8993-2-unixpro1970@gmail.com>
 <03111ac5-0055-425f-a7f2-54d4f2bb4988@gaisler.com>
 <20260616205851.428ca70c@pumpkin>
 <d634e2f2-daf0-4328-bf16-7f5bff6fe851@gaisler.com>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <d634e2f2-daf0-4328-bf16-7f5bff6fe851@gaisler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/17/26 10:53 PM, Andreas Larsson wrote:
> On 2026-06-16 21:58, David Laight wrote:
>> On Tue, 16 Jun 2026 16:18:33 +0200
>> Andreas Larsson <andreas.larsson@gaisler.com> wrote:
>>
>>> On 2026-05-19 09:57, Tony Rodriguez wrote:
>>>> This patch restructures the thread‑stack sizing logic into a single
>>>> if / elif / else chain and introduces an explicit 32KB kernel stack
>>>> for SPARC64. The previous implementation relied on nested conditionals
>>>> and PAGE_SHIFT‑dependent behavior, which produced 8KB or 16KB stacks
>>>> depending on configuration. SPARC64 requires a larger,
>>>> architecture‑specific stack due to its trapframe size, register‑window
>>>> behavior, and deeper call paths.
>>>>
>>>> A reproducible failure case occurs when usbcore is enabled: USB hub
>>>> enumeration (usb_new_device(), hub_port_connect(), PM/QoS helpers)
>>>> allocates large on‑stack structures and recurses through several
>>>> layers of device‑model code. Combined with SPARC64’s trapframe and
>>>> register‑window overhead, this reliably exhausts a 16KB stack and
>>>> results in early‑boot panics.  A 32KB stack eliminates these failures.
>>>>
>>>> The new logic is:
>>>>      SPARC64:
>>>>          THREAD_SIZE = 4 * PAGE_SIZE (32KB)
>>>>          THREAD_SHIFT = PAGE_SHIFT + 2 (log₂(32KB))
>>>>          THREAD_SIZE_ORDER = 2 (4 contiguous pages)
>>> Yes
>>>
>>>>      Non‑SPARC64 with PAGE_SHIFT == 13:
>>>>          Retains the existing 16KB stack behavior
>>>>      Fallback:
>>>>          Retains the existing 8KB stack behavior
>>> No, not to my understanding, see comments below.
>>>
>>>> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
>>>> ---
>>>>   arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
>>>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
>>>> index c8a73dff27f8..6b12a2b66385 100644
>>>> --- a/arch/sparc/include/asm/thread_info_64.h
>>>> +++ b/arch/sparc/include/asm/thread_info_64.h
>>>> @@ -99,13 +99,20 @@ struct thread_info {
>>>>   #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_page */
>>>>   #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */
>>>>
>>>> -#if PAGE_SHIFT == 13
>>>> -#define THREAD_SIZE (2*PAGE_SIZE)
>>>> -#define THREAD_SHIFT (PAGE_SHIFT + 1)
>>>> -#else /* PAGE_SHIFT == 13 */
>>>> -#define THREAD_SIZE PAGE_SIZE
>>>> -#define THREAD_SHIFT PAGE_SHIFT
>>>> -#endif /* PAGE_SHIFT == 13 */
>>>> +/* thread information allocation */
>>>> +#ifdef CONFIG_SPARC64
>>>> +	#define THREAD_SIZE (4 * PAGE_SIZE)
>>>> +	#define THREAD_SHIFT (PAGE_SHIFT + 2)
>>>> +	#define THREAD_SIZE_ORDER 2
>>> As far as I can see, given that this header is included by
>>>
>>> #if defined(__sparc__) && defined(__arch64__)
>>> #include <asm/thread_info_64.h>
>>> #else
>>> #include <asm/thread_info_32.h>
>>> #endif
>>>
>>> the code above is the only code that will ever be compiled, while leaving...
>>>
>>>> +#elif PAGE_SHIFT == 13
>>>> +	#define THREAD_SIZE (2 * PAGE_SIZE)
>>>> +	#define THREAD_SHIFT (PAGE_SHIFT + 1)
>>>> +	#define THREAD_SIZE_ORDER 1
>>>> +#else
>>>> +	#define THREAD_SIZE PAGE_SIZE
>>>> +	#define THREAD_SHIFT PAGE_SHIFT
>>>> +	#define THREAD_SIZE_ORDER 0
>>>> +#endif
>>> ...this code dead, where the else branch code already was dead (but then
>>> in two separate else braches).
>>>
>>> I'd rather see the else branch here and the else branch below cleaned up
>>> by a separate patch with a fixup tag for commit 15b9350a177b ("sparc64:
>>> Only support 4MB huge pages and 8KB base pages.") that as far as I can
>>> see should have removed the else branch. The else branches was to use
>>> only one page when the page size was _larger_ than 8 KiB when that was
>>> an option.
>> That whole logic is impenetrable.
>> Why not set the 'desired thread size' in kB, then work out how many
>> pages that ends up being based on the page size, and finally get the actual
>> stack size.
>> I'm not sure, but with vmalloc()ed stacks and 8k pages can't you have 24kB?
> No, the next step up is 32 KiB as the stack allocation is sized by
> THREAD_SIZE_ORDER.
>
> Cheers,
> Andreas
>

After additional testing and debugging on a SPARC64 S7-2 system running 
kernel v7.1-mainline, I've made several important observations regarding 
the USB core stack overflow issue.

1. The Stack Overflow is Real and Consistent

My initial patch (increasing kernel stack to 32KB) appears to work with 
v7.1-mainline as well. However, the underlying problem remains: the USB 
core's stack usage consistently exceeds the default 16KB limit during 
hub enumeration.

2. The "Static Analysis vs. Runtime Reality" Contradiction

When I compile the kernel with -fstack-usage to generate .su files, the 
static analysis shows small stack frames for all USB core functions.

  For example:

hub_event:      2457 bytes  (static)
hub_activate:   1892 bytes  (static)
usb_control_msg: 1248 bytes (static)

However, my runtime stack tracing shows a dramatically different picture:

STACKTRACE: hub_event():entry: 31856 bytes used
STACKTRACE: hub_activate():entry: 31680 bytes used
STACKTRACE: usb_control_msg():entry: 30768 bytes used

Please see:

https://github.com/unixpro1970/Sparc64-Kernel-Debugging-Dumps/blob/main/usbcore-stacktrace.txt

Perhaps the issue is the accumulation of register window spills across 
multiple nested function calls?

3. The 32KB Limit is Also at Risk

I've observed that stack usage can approach the 32K limit as well.

4. Testing:

TO DO: I will try adding a stack flush at the entry and exit of 
hub_event() .  Hopefully it will prevent the accumulation of register 
windows. The theory is that flushing register windows between work items 
may prevent the stack growth from carrying over from one event to the next.

If the flush helps, I may also look into "stack_trace_flush" David 
Miller's stack_trace_flush() implementation. Unsure if stack_trace_flush 
is supported with v7.1.


Regards,

Tony


