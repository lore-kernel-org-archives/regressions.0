Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459453B9D90
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179270; cv=none; b=L3t6UjWZg80sQ0l8eXLBzwf/SsqNeaGpZQYZOOPh44yly8lFJGHGgpZGJB9V5NN1svWfiHk7QIKpMeZL4JwwNqLZZtrMbvuee4ejrnOhQ5/0GtEywK4N+VB2AdRKHmjbbayQks4DFcUrDsMeAkX0oxhq41gKDrOSLMao6NqbISU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179270; c=relaxed/simple;
	bh=xWyjC/upAI1+c436Rr4CHFnRGtiuozY1aD79YjF2iZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3/AMO3qfhQOb34GQ/JJz2z+KgSnqO0/czBapMDGyr6Kkf1jd63Kv9ZsXZePXp/V0CD9JwvGuaVgpsZ4/gwBoeDkgTr71nJKvphUXYNtqN+uVI1ITCoSiP0Fqd0IUjOXCQzGzT/w6CENLd+iy1Ai5r6CYhSfyN0Pb8HFm7FPz4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODL2pYdz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODL2pYdz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b458ca2296so7985725ad.0
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778179266; x=1778784066; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xWyjC/upAI1+c436Rr4CHFnRGtiuozY1aD79YjF2iZU=;
        b=ODL2pYdzBrWQ0nVJ20359LAsboas8cJr1ES8n2BsevkIUSVMz2lOoHOYr4bhUB/x9r
         xiOuWRzaHCf+AmWyrgQu63EeFJo5/W8dgsCUVG5PSIuP2EfduADzzb7kvSnaYb6rp5Nh
         i1MdeWY94T7YDXH/5heDGEoA/ew1ayWsjxaMNpWBXJq7U4phYeBoF08saCkwuKgG+FSd
         WBfNzjnM9RfUWLCMP0p7YTQMoumNMvYCak9TVmCWVkc3FmPp8V5MwyBobnDhASi+3hoX
         w568abnh1wEDT0pjnxU0bEFTWecbWdvfideDZvH61saDzv3E03GYGXJxLM+RsWkG/bCQ
         Bejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179266; x=1778784066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWyjC/upAI1+c436Rr4CHFnRGtiuozY1aD79YjF2iZU=;
        b=lzzOSl0SXh3VhW5yxwQcIQNd5WSOoxlwXl/vDLON+batC67xSNGjQOamaIHeYMSV29
         YX/i3+w2V6hxOUG1NwiqqlaIH94HgjxTc/57yEk48wBX8tbzdL5AKSeBs2QUkVlNTDtI
         Tgt0bf5SqXXk8au4n/tH6tGswdIb7muLwNAE++gPpicqy/QYVl57P73BSmqTUqPzJu5m
         HxiZnnWNkO//CAifVWHH0Ql8eGYPsnKfpJJ2AQdxNwFTVfmGUkML+cLxzrPOIKl/EvR7
         +E0eghR/UVpTyVCm3wzTfXmVxUxIopT51UXQ4VbPjvnEU8+YKJFKDlXJXMoicyoBeP+y
         83Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9PR/E7xWteFbBqo2hoRGWnsoYIvvCmZlOISLv/jr8eGKxCXGq+G6xC7XLPDStcafn0G30ntnyEoVKQjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKUKHbuwdkWcaJAMB76tTchZlpDTTyDYxQ6VwH74opFoljvVaM
	lwKQHUxX2u3swYP5ni9GJJzyw47GDujEKMLVgNhzliVruG/SDZG/yWQMXPv4eA2T
X-Gm-Gg: Acq92OHN5MwM208bMcdS0onvci+xofSIDndtR8tXB+1wksw+UvvAs742jKl67xpSoXG
	FvtTqqoEW2BDSGsfWfLaeaMP+kpEDFg9CKNrzApFJzDKFFpEMAcpDQU6Ty6VTdM87l1KtO1nKDb
	0onu+5nWklwt2Ooat9qoWKc/WggxvfOs03yzLj5q0lqG/4Av4DdXWmo93TLaXwt36ZhfF6x5+q3
	K8bmvE1euGPhXF0cAcqnX0GdickDfVE6UTwK7UVvobxQyeZWtti4O0Ys4vatR4bnoMZWOSY4Pxs
	3d1D7qizIkvSpaz9RJCA/n2BCzjeLCD5AC9F8tGgls4sn1j3cl/eEBLeTCAuwk96O/nAS/pRn6F
	ic2vJxoQqqJ9CSPKyzCryBnXfNvm4vsg9Z8BO1GaOJ7wEHYTXNrHuepbQhrO8YZUChusts0+X/s
	OSUWHGUl4onbs4ZjJUPXmHGuNQOCW5bTI3bQSRyouWf1TSHlT6q4AuZqxDefV4/qQA5rUawlHah
	K22RhWnejcbvidz+RIKeDxlYHuxGeY=
X-Received: by 2002:a17:903:b4b:b0:2b0:b41e:c5c3 with SMTP id d9443c01a7336-2ba7a34601amr91271385ad.29.1778179265783;
        Thu, 07 May 2026 11:41:05 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7560c67sm4577375ad.26.2026.05.07.11.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:41:05 -0700 (PDT)
Date: Fri, 8 May 2026 00:11:01 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	yue li <mc.root.ly@gmail.com>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
Message-ID: <afzbmLgsW0HBJ7-C@archlinux>
References: <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>
 <afb0f9gaS5z_SmRX@archlinux>
 <38bef028-d574-4e7a-b857-f10ab6796833@leemhuis.info>
 <553a4232-f4cb-4d67-bdee-067b5f038f64@leemhuis.info>
 <6d97e48a-be18-b99f-f4d5-aae50220ac53@linux.intel.com>
 <7b8293d0-7811-4def-bc96-56c0422f0ee7@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b8293d0-7811-4def-bc96-56c0422f0ee7@leemhuis.info>

On Thu, May 07, 2026 at 12:59:41PM +0200, Thorsten Leemhuis wrote:
>On 5/7/26 11:55, Ilpo Järvinen wrote:
>> On Thu, 7 May 2026, Thorsten Leemhuis wrote:
>>> On 5/4/26 09:22, Thorsten Leemhuis wrote:
>>>> On 5/3/26 09:26, Krishna Chomal wrote:
>>>>> On Thu, Apr 30, 2026 at 12:59:58PM +0800, yue li wrote:
>>>>>> [...]
>>>>>> Regression:
>>>>>> The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
>>>>>> but fails to probe on 7.0.2-zen1-1-zen with error -22.
>>>>>>
>>>>>> Issue:
>>>>>> On the affected kernel, loading the module fails:
>>>>> [...]
>>>>> Thanks for reporting. This is a known issue [1]. There are 2 failures in
>>>>> your dmesg output:
>>>>> 1. Unknown EC layout: The fix for this has been sent recently.
>>>>>    Currently, it is in the review-ilpo-fixes branch [2].
>>>
>>> It[1] afaics is sitting there for a week already afaics.
>>
>> I'm sorry to be a disappointment here, but I don't find a week a
>> particularly long time.
>
>For a normal patch, I fully agree. But for a regression fix, it is a
>long time[1]. And to me it looked like the patch "platform/x86: hp-wmi:
>silence unknown board warning for 8D41"[2] was a the second and
>necessary part of a fix for the regression Yue Li reported at the start
>of this thread[3] -- without making it obvious in the patch description
>that it was one, so you couldn't know, which is why I CCed you here.
>
>But from looking at Krishna's earlier reply in this thread again, it now
>seems to me like I misinterpreted the "applying the above mentioned 2
>patch" statement, as 9d317a54e46d3b ("platform/x86: hp-wmi: fix fan
>table parsing") [already in v7.1-rc1 and hopefully backported soon]
>seems to be the main fix and the other one ("platform/x86: hp-wmi:
>silence unknown board warning for 8D41"[2] just silences a warning that
>is not causing trouble.
>

Yes that's right. The fan table fix allows the driver to be loaded and
fixes the regression, while the follow-up patch is only to silence the
dmesg warning. I will be more explicit from next time, sorry for any
confusion that I might have created.

>Sorry, my deepest apologies for causing trouble.
>
>Ciao, Thorsten
>
>[1]https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
>[2]https://lore.kernel.org/all/20260429180953.129885-1-krishna.chomal108@gmail.com/
>
>[3]https://lore.kernel.org/all/CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com/
