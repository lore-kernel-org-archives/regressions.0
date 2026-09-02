Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7367345ED7
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 03:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319847; cv=none; b=LYTcJ/rt/gBjapV6A0HV1DoYWLBNepvomqfeiJgcNVGGXoo0STwqWlP6l8EhpX5ScPOdprgPcQbXi2K3DTOO8Uon71yVhmrkVu00l0lbn3YYZT708QKrN1d6Zdb2H+quckv2FQScjUOiPmybzWrRwt3Re32ox44dpR5EAxYLnc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319847; c=relaxed/simple;
	bh=JDiIo6AmLoeHaCku9tkhf0FJ/rQnb5by0XJWkhTOruw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arXgN/GIRKzXsmWqEH4BD//E3fyx3q+F1A0jgnz9ay/CsdhK9SA/jImdUrXrzrpdJ0B0X80YcGl5fLq2X+ahTIMUYt26ptd5dP1LtoY7M6QcQOxHEoSgHpC+dUgJjDlIEVuY+nV8hH8AskXvmWTti0k6ADjhD/bavqeHlNHUEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9eTCw6S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9eTCw6S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d9201076b3so6474935ad.0
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 20:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319845; x=1788924645; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GODtbRlK4Wp21PCNPXyrIzdJnHuDBWO22e7/FknLe3w=;
        b=k9eTCw6SCxuzFcmDQm2Z1HB6TvGv0FfyC7NHS5us5c8MBUS4FfC9lhx+9bxwvYdvml
         CF72WUhe2g5pwIHuqozIZdwmQ8GydN5xXT8XeX3vF3NuW08KVr7GlH6q1H+fMDaXS0l9
         P4Tyu/7Dk7e6BsgoYPGaqvwd1xLFBwVXOJbuTd6F+O8tfS6oBvomzzSURIpWrsPb9zQn
         SJGmYwWqgATHkyY9V6XAijcsoFInqCZygYwlo73Nwv8t7mMKpm86Dxk/rcScP2bxYu9f
         Q8DcVMA/UUwbvw2cXJd5gYxOyTafe+WV+KOJrgaq8hd/gH9Rs1G/a8itJ1YwCgTVeHMJ
         EUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319845; x=1788924645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GODtbRlK4Wp21PCNPXyrIzdJnHuDBWO22e7/FknLe3w=;
        b=i3x/F7IETvY+WFh/pqh0NaUV5+fk6/IMGiHnq6PZbLHI+jqRUHR1k0gA/x+1WQgQxi
         t9lCIBVvoYZ/cX3Ekw2w2Ra1UAu8z8BJjzbqu6OKdSgRTQkEzdwatK5g6NsQpqlotVGz
         9IAneVCM1dC+o5KkxThIRdFvsXdg9hN9+6JftqFA1J2wWmrFs5k8K10nz+iit7SuSjFX
         fy1kJTDd88hUU2rBnNw8qVG7WDhhDh1gJ5Ne5tFTNtb4aEI+nFlSJOH9xLVajUf9p1Ol
         PGKZG3YJbSzufOfLvMrWBxSGtAG9zpGOUX0cuUtS5FPbpR+9esrDPxNB6rYY76xZoZR0
         EXNw==
X-Forwarded-Encrypted: i=1; AKwUvByterRstpMmbVTLf+YztPnQdSVk+2Qrhv+ojVhpD0DvECaPJfZIeJecE6y4UwhJr2rNZ7G01GdndynjWw==@lists.linux.dev
X-Gm-Message-State: AFuF++nHD0xOMesTiBwOyjLSaK7cBVcQTwmDqIb6qxAkLySGQrBlbPw5
	9iUD4YM4J6kPApgJAU0CxjhosgF3W+2gYM2HExgBkEDixjgRJYXVSomz
X-Gm-Gg: AR+sD10oab+yy9G1pe+G8Cx7krgW4cJz8I3lgAz8lTH7wDIuUeFL5Sic8RxOUslZEIo
	m9gAAtVE3WVeiZ3uG30SEvLAL7CME1n8sEAeEDneHSFy7nXIeAn2W4ykSaFwDmZH8z5aFFZbLrg
	rtdO7qXNsXv4+d7jTG1UJjQudkQjTBz+6d3Q0ng32zSrqTuNsf/ja4He3XqDuXBmSeumL00ar2R
	J2Vn+q13utb56Y1n1Een7UrC5zBvEwQKjjujpgYSlNMk/cY5L6c4lrsnaRl9QvebodjflPRL3Nv
	IUFqvLbu4FN/sLJ+sVHJV/udT1oWyVzC2fm4nR5nDkgklIMfDQdvyb7ifysOTTE03/muGBwXwpg
	fvadTLyMnJJJ13Qpn66US4vEu8sYCmjqa5bfqeIdYaIyOF5wkH2vGFByKJM9f13cvyHt7xmCEPr
	73ImKlpgB+kUEC52iFS07HjuvSPQSAxtPVZB0xFpYZgO36YdcVWq+qqPVJwcuF3EmUsd/unhG/T
	KHocu6tCKPAsEhG7JAVNgEd/OTG5kKCaaY=
X-Received: by 2002:a17:902:ce8e:b0:2d9:4871:393d with SMTP id d9443c01a7336-2daec79d31amr22255655ad.21.1788319845120;
        Tue, 01 Sep 2026 20:30:45 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm2402381eec.18.2026.09.01.20.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 20:30:44 -0700 (PDT)
Message-ID: <5b920b1d-a32b-494e-b97c-8672a8371dd3@gmail.com>
Date: Tue, 1 Sep 2026 20:30:41 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] sparc64: increase kernel thread stack size to 32K
To: Stian Halseth <stian@itx.no>, andreas@gaisler.com, davem@davemloft.net,
 sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, thuth@redhat.com, regressions@lists.linux.dev,
 nroach44@nroach44.id.au
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260831172928.3082853-1-stian@itx.no>
 <afaa8ced-0717-4d62-8ea6-4ecdbf489694@gmail.com>
 <680606d594645568c21afcc552558882c4f59a96.camel@itx.no>
 <b46209d5-e518-4289-9b3a-5854a2512278@gmail.com>
 <18d7ea80efbb5dd3d81acbae926da4e027ebfed9.camel@itx.no>
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <18d7ea80efbb5dd3d81acbae926da4e027ebfed9.camel@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks again for the details, but I already had those CONFIG and 
stacktrace options defined based on previous debugging sessions.

32K should be fine based on the output (see the link below), and I have 
not noticed any crashes with a 32K stack).  These results are against 
kernel v7.1.0-rc3 using my original patches on the S7-2.

https://github.com/unixpro1970/Sparc64-Kernel-Debugging-Dumps/blob/main/kernel-v7.1.0-rc3-depth-stack-trace-sparc64-s7-2.txt


Should I try your revised 32k stack and timer patches on the S7-2 and 
T7-1?  If so, which kernel version did you validate against 7.2 or 7.3?


Regards,

Tony

On 8/31/26 2:05 PM, Stian Halseth wrote:
> Hi Tony,
>
> On Mon, 2026-08-31 at 13:18 -0700, Tony Rodriguez wrote:
>> Hi Stian,
>>
>> Just please continue to give me a
>> mention in any patches related to this work, since I spent a
>> considerable amount of time debugging, researching, and validating
>> the fixes.
> Sure. For now, no real changes have been made to your patches, so as
> far as I'm concerned, this is entirely your work.
> Will try help with the last mile, alongside some other patches I've
> submitted.
> And yes, the debugging, researching and validation is the hard part.
> Writing a fix is often _relatively_ easy, when you have all the facts.
>> When I last tested on 7.0 and 7.1, both of my patches worked:
>>
>> A)    sparc64: increase kernel thread stack size to 32K
>>
>> B)    sparc64: Fix comparator problem with timer interrupts
>>
>> I was able to debug and validate these issues on S7‑2 and T7‑1
>> hardware.
> Yes, and that's a very important data point. My analyzis is based on
> the change itself, _and_ your validation/testing.
>> I’m not sure if others have reported similar problems on T4 or T5
>> systems.
> Not that I'm aware of, and I haven't seen it on my T4-1.
>> If you have a quicker or better methodology for reviewing stack
>> usage—or
>> any general suggestions—I’m definitely open to seeing them, along
>> with
>> your config and exact procedure. And if you need help validating
>> against
>> S7‑2 and T7‑1 hardware, I can try to allocate some time to assist.
> I think that would be very helpful. Let's try to settle the 32K-vs-64K
> question with more data.
>
> The kernel has stack measurement built in.
>
> The in-kernel method:
>    CONFIG_STACK_TRACER=y
>    CONFIG_DEBUG_STACK_USAGE=y
>    CONFIG_SCHED_STACK_END_CHECK=y
>
> Boot with "stacktrace" on the kernel command line (arms the tracer
> before built-in drivers probe). Then:
>
>    cat /sys/kernel/tracing/stack_max_size   # worst case seen, bytes
>    cat /sys/kernel/tracing/stack_trace      # that path, frame by frame
>
> Reset with "echo 0 > stack_max_size" before a workload to isolate it.
>
> For the 32K-vs-64K question, the most valuable data you could gather
> is a stack_trace snapshot on the S7-2/T7-1 under your real workload
> with mlx5 active, on a 32K kernel.
>
> On our T4-1 the worst case is 12616 bytes, but doesn't have mlx5. If
> your machines stay well under 32K, we have comfortable margin. But if
> something approaches the limit, the trace will name the exact frames,
> and we can judge whether the right answer is 64K or a targeted fix in
> that driver.
> Thanks!
>
