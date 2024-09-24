Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B0E178364
	for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174542; cv=none; b=Qxzgae3DPtcor81Os1i/RNHHmto5BsDysjMQQ7iQNEfUwPVppaeMn1yZl2zN449pX0a2oFp6CcLXgYFj2qPP0oG9qense67ZH1ljRcxkyj6U71ybXiIkik1ByRBhPPyO0hLrLfZBOUJ55AlFv/nQD0IvRLsHZL9DKWSynlpnstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174542; c=relaxed/simple;
	bh=gNiD6RLu1udb2gce4oMZpCu+Uu4vn9C8ETKra82Zijc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sj2WL0YyOGRErFGY6tLCYhHGQddwEI34qvnIjxrR3KO1er/J3equpvSVmhYa0MT4BMchl8svwnTHzXTNf2s4ocMGrNPHUJg7sJ6+zquAYxJKEox56ytZB69/6y373GjMQnul9EWX8n+OkNCtCL9GeJ1QSiyUEJXYN5r2pYO1rl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bb3yUMQ+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bb3yUMQ+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so6224019a12.2
        for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727174539; x=1727779339; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YPfsEe5Gz4fZvfLrXom6jdcA+WUr3fEVrXW3twv6Dg=;
        b=bb3yUMQ+AmgOQAOiHROY9VqS6kwzSl5iVveODiIs4b0xwZdZSESX6VYap1MF3+0f2l
         eSuemOrIOX0lj87NoYXdc63WXYzCBsbc0rDuANsbIORb3+PA8TAO0wwazRmbgWX3WbN7
         OZ0lyJD3fhBOtMVJWaW9sFVTxXXrtJ6R0hfYxc1lKPlghgVh7JFZuzv1CEwPW0boHztb
         y2U3CVDAxrqKV5Mzl7LXJ5G5l46By/V18bc9J1UloBYsn4Xz6c3qKY3sE9qz1AY111tF
         ihmI7eOJ0izNeOqeAaFk8c5P3cq1xSxaOTvZy6pKtMhjd+k1vux9z+GCqWk/5t9hBhFR
         QPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727174539; x=1727779339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YPfsEe5Gz4fZvfLrXom6jdcA+WUr3fEVrXW3twv6Dg=;
        b=kYFEHrTKPrE58j2JumjHLd6DFrWTHbTrXUsuVAeereI7iJ9GI5i9tTdPJe1JtaGnwH
         HcyUPipHK0xxLCWy2SEzbGk/+TQUrVkqxjRMBaAj7A9+Ncu3vYEAF5nRaljcs5VutY/a
         ofJN7xS1ie+dLZTvZaQvuhPioQ4zzyQ7ipF3t+YOldx0siIkClDrr9ECmgiGpMMSUssK
         wnCdSPNdQ0kb/F81olyZLYHd1RQ3Ljj0QS+6uVCSHO4Pgo37AULBnCwqxKaJnT8Jx2OZ
         rgYEFC4irRgqVV0tU7Ayg1JQqMr1a6Bdmpi/IHGnErIcq1JHhCA1FSJKi/oIaCbhgEk/
         mTBA==
X-Forwarded-Encrypted: i=1; AJvYcCUhzRfpcfiOOp0yAYYEFDoBs0NX4D+gQEa64x6EOgpZ0gznPx8BqYNmSLbV3/siavFaiZhnGqmMg11mjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YydDE1uNplzS6XNeXW4v4WuIlwCZllfZ+zyXAn2QSbUAbWCw30O
	wLDmwu/5+Huhfvdm7cuk5x7cQi7aVyBziKVhVqe1AY4AHQieQz/I
X-Google-Smtp-Source: AGHT+IGDTNsufgUNEyj6IFdnJ8uN6sQZGuWyKHa5urVmmKCJM+STKaOPFvBlEfsBtkrRMmNozCaZJA==
X-Received: by 2002:a05:6402:510e:b0:5c4:6568:735b with SMTP id 4fb4d7f45d1cf-5c4656873a5mr10559030a12.11.1727174539079;
        Tue, 24 Sep 2024 03:42:19 -0700 (PDT)
Received: from [192.168.1.64] ([91.231.32.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d7926sm601482a12.93.2024.09.24.03.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 03:42:18 -0700 (PDT)
Message-ID: <a0c34406-3bb3-4880-9513-0876aacd4de6@gmail.com>
Date: Tue, 24 Sep 2024 12:42:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libahci driver and power switching HDD on newer kernels
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-ide@vger.kernel.org, Niklas Cassel <cassel@kernel.org>
References: <7882faa8-d5ec-4868-b158-0b942b669cc0@gmail.com>
 <c4f1c690-6e97-44de-985f-dc9eadd18d23@leemhuis.info>
 <c7880a6f-04d4-4572-9255-1575f6668b4e@kernel.org>
From: W <linuxcdeveloper@gmail.com>
In-Reply-To: <c7880a6f-04d4-4572-9255-1575f6668b4e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 24.09.2024 o 9:31 AM, Damien Le Moal pisze:
> On 2024/09/24 7:20, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi!

Hi
>> On 15.09.24 14:44, W wrote:
>>>
>>> I've got some problems with newer kernels during hibernation and
>>> waking up from hibernation.
>>> The symptom of the issue is that there is HDD power switching executed
>>> after I run pm-hibernate command and the same HDD power switching
>>> during the wake up process from hibernation.
>>
>> Thx for the report. I CCed Damien and Niklas (and the regressions list),
>> maybe they have an idea. If they do not reply you most likely need to
>> perform a bisection to raise interest in your report.
> 
> Thanks for that. Niklas and I will look at this (I thought we already had fixed
> that issue...). However, this week may be difficult as Niklas and I are
> attending a conference and we may not have time to do much. But this will be our
> highest priority next week.
> 
>>
>> And FWIW, there is one important info that afaics is missing from your
>> report: If the latest mainline kernel (e.g. 6.11) still affected?
> 
> Yes, please check that.

I've already reported the issue here:
https://bugzilla.kernel.org/show_bug.cgi?id=219296
and unfortunately the issue exists also on 6.11.

>>> 4. system is ready to use and working fine
>>>
>>> So to sum up - in both processes described above the problematic step
>>> is the step 3.
>>>
>>> I noticed this issue when I switched kernel 6.4.12 to 6.7.5. So far I
>>> haven't used git bisect yet to find the exact offending commit so the
>>> change might be introduced somewhere between 6.4.12 and 6.7.5.
> 
> It would really be helpful if you could bisect this !

I did it and placed the log from bisect in my bugzilla report: 
https://bugzilla.kernel.org/show_bug.cgi?id=219296

>>> In 6.4.12 I have not such an issues with HDD power switching. The
>>> issues exist in 6.7.5 and newer ones and probably somewhere between
>>> 6.4.12 and 6.7.5.
>>>
>>> I noticed some errors in dmesg coming from ahci driver like these:
>>> Sep 11 15:49:30 localhost kernel: ahci 0000:00:17.0: port does not
>>> support device sleep
> 
> This is relevant. This is not really an error but rather a statement that your
> device does not support sleep. This could be the reason for the behavior. (hence
> my request that if you could test with a different device, it would be help).
> 
>>> and ACPI BIOS errors like these:
>>> Sep 11 15:49:30 localhost kernel: ACPI BIOS Error (bug): Could not
>>> resolve symbol [\_SB.PCI0.SAT0.PRT0._GTF.DSSP], AE_NOT_FOUND
>>> (20240322/psargs-330)
> 
> Yeah... I see these all the time on different machines. That comes from the BIOS
> not being great :) Not sure if that one relates to SATA though ?

I was trying to report this issue to American Megatrends Inc. as the 
BIOS maintainer but their website form didn't accept any of my emails :) 
So eventually I couldn't let them know about these issues.

>>> Please take a look at included dmesg in the attachment.
>>>
>>> The mainboard I use is: Gigabyte Z370 HD3P with the newest available
>>> BIOS update.
>>>
>>> I'd like to ask if this is known issue and if yes how could I fix it?
>>> I'm not quite sure where exactly is the issue: in kernel or in my
>>> Gigabyte BIOS?
> 
> Given that you had 6.4.12 working OK, it is likely some commit that introduced a
> regression. If you can git bisect it, we will have a better idea how to remove
> the regression.

Please take a look at bugzilla report: 
https://bugzilla.kernel.org/show_bug.cgi?id=219296 - there are the details.

I'm wondering what is the better way for communication - here on mailing 
list or put the comments in bugzilla ticket?
Probably here will be better idea...

W

