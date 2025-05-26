Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DABE1876
	for <regressions@lists.linux.dev>; Mon, 26 May 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246000; cv=none; b=VsnGnl4p03h1ekgYDdBOccoIGp32U9bMByDAHrQED9hOLxhg6O3+ngT4+nFig9iVtnVxdPcBpk3L9kqKV0l04IwbsmHgtZQIB5rQx3zyMPWywQxqppOKDFexKQAFRtrqaw08siRebJL1XVr9g5HWrHF8IT2sYbBYSmmq9lM+4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246000; c=relaxed/simple;
	bh=8zGG98q9qUYZNS1ImPKzK++WJb03mJOL5AJYgz2KFCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JetWg5VAndjZY53iFtB9cpykTqBMp9GC5E//8ODk21x2ykWJjkOIk62QMQAJtluYHSJjw/0MWnNhV0BTsQLGavjxkY++lStAOlfq6JWSuyaE7du0baD3d9t14Q2QIutKLTXy4dl6l6EyBeVUQSE9tmaNfTgy7tZMmmk19GotSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U91C1WFn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U91C1WFn"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so373585566b.1
        for <regressions@lists.linux.dev>; Mon, 26 May 2025 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748245997; x=1748850797; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AXjdGFDhJ6dNVjl5AY3P4sCfMdaDyI2qz17SglDOYM0=;
        b=U91C1WFnqA01yaQCiyB1RSRF7MHWKpXgeaIjygHDcojMkqLQDA5gJkXDXk7NNEZGk5
         tGHdcQ4Oq7rbJCZjz0zKRxP/i9ah6UOR4QjtxtO0nXFF28s0qlHfwZ5ekusSkkyouysI
         dlPjCJO5z+FeDintBjPHycncVAZWPbniIv59LzLgMD5PHfmkaT8hzt7w1OhdtR7cS1eP
         HfBEEe709x6fWOd1ysCM3tVAnaZLm9LKSrNDhTCPZegM7IDBPx/Ta7rBZ8Ug3JA2QPa1
         X5NPSkNJPCJh1L/U5fEFJXoiYTs5h5gRv4Ca1FWG0JTeeHMfZ0Sfd/ZzkSa2YDNEK9Rq
         JKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245997; x=1748850797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXjdGFDhJ6dNVjl5AY3P4sCfMdaDyI2qz17SglDOYM0=;
        b=JULkzTTbTW0XpeVke3PQzj8KDR0GL1ue6oRRRajwZKgr/rVmv3MV7/1xAD+MGAQB+u
         5gfdVNcKG082Jc6b2E5/5ew0Rw470VcKIg/gz9w8YMLmIkjeKKPlAvFU3TZa5D7IWumY
         k3h2P6LhkKptUbcYmfjAWZS/Uw/jAK69MDsGtrrBJlFNy2CiYg5i6EjIVle76heaAQtJ
         W0gjwcyXf8nW1ufu/fRyw1/3ByATb4qulAiBsO4FREMVe0NLBdjwOJM3z6mDBlZ4AkxP
         OUNivQZRlU9WcTAfKksCA9eqzjPq0mLR2G9ETsbI/lFffLoESPd8xF3POhPnseq80h05
         CX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYvS5d30rjFI85h4ydlQEZrwTbl80IIK+aPQhWYVyjDoSc2z5J6DLpo4IevjEONPIQGTMa6n5kYfr7Ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD9WZJgGQ8OoKNrlA5CI9WUxPUHDa8hAvOoPRXqgVU278wQC3c
	xvCJON2Br93oP4tr7l/84m+a55JdAbzIzP4PA6EQXQdeLAVXHyLbthmH0vQv5gsRHMtPDgkUrLW
	yPfpl7Ac1XsjdLbZLQYNVjoEx3ISi8AIuHswdDjY/vQ==
X-Gm-Gg: ASbGncuGW83N/ECY51zX3YIGxgXgeTweaUFVeT5mqu7WJHxAyhPX+jgE0/QfEdHb1qW
	voRiEq7HpDCki97m5ob/rWy2ZzO7l5H+6oBNRZVOZ9qeDnXloz8tafzUVUexF/WitrF+dAIEZHW
	6YyVLHuRBn0LE+PtAw3GMuVa9jwlAloLrRjIjtHxEAYq4CE6Gl9komFci5xE+3PZOmKAG1NdGG
X-Google-Smtp-Source: AGHT+IEHR623wBlrfv2bAwYHebBHB/uVZnyri8NclAhYoOaAPShxgc2ECJIYwH4Jo6EBzAfQkeCfgUHu9q3L/BOSO8s=
X-Received: by 2002:a17:907:9803:b0:ad4:8ec1:8fc9 with SMTP id
 a640c23a62f3a-ad85b20aca2mr724880666b.42.1748245996928; Mon, 26 May 2025
 00:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AA29CA6A-EC92-4B45-85F5-A9DE760F0A92@ateme.com>
 <4c0f13ab-c9cd-42c4-84bd-244365b450e2@amd.com> <996ca8cb-3ac8-4f1b-93f1-415f43922d7a@ateme.com>
 <3daac950-3656-4ec4-bbee-7a3bbad6d631@amd.com> <CAKfTPtBovA700=_0BajnzkdDP6MkdgLU=E3M0GTq4zoLW=RGhA@mail.gmail.com>
 <de22462b-cda6-400f-b28c-4d1b9b244eec@amd.com> <CAKfTPtC6siPqX=vBweKz+dt2zoGiSQEGo32yh+MGhxNLSSW1_w@mail.gmail.com>
 <c0e87c08-f863-47f3-8016-c44e3dce2811@amd.com> <db7b5ad7-3dad-4e7c-a323-d0128ae818eb@ateme.com>
 <CAKfTPtDkmsFD=1uG+dGOrYfdaap4SWupc8kVV8LanwaXSbxruA@mail.gmail.com> <fea6da1d-85d6-459d-9ac3-661d5909420b@ateme.com>
In-Reply-To: <fea6da1d-85d6-459d-9ac3-661d5909420b@ateme.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 26 May 2025 09:53:05 +0200
X-Gm-Features: AX0GCFuROGCSyLoX-AVhsYdFkI6e9UYLuZkd2WamYF2gufcPj-7lR5ZaPUa4N-s
Message-ID: <CAKfTPtAPPG2Xa1P9r+NQZv_VkYRic+e-qxG1ODJodPUqdry7BQ@mail.gmail.com>
Subject: Re: IPC drop down on AMD epyc 7702P
To: Jean-Baptiste Roquefere <jb.roquefere@ateme.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Peter Zijlstra <peterz@infradead.org>, 
	"mingo@kernel.org" <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Valentin Schneider <vschneid@redhat.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 14:24, Jean-Baptiste Roquefere
<jb.roquefere@ateme.com> wrote:
>
> Hello Vincent,
>
> > As said previously, I don't see an obvious connection between commit
> > 16b0a7a1a0af  ("sched/fair: Ensure tasks spreading in LLC during LB")
> > which mainly ensures a better usage of CPUs inside a LLC. Do you have
> > cpufreq and freq scaling enabled ? The only link that I could think
> > of, is that the spread of task inside a llc favors inter LLC newly
> > idle load balance
> # lsmod | grep cpufreq
> cpufreq_userspace      16384  0
> cpufreq_conservative    16384  0
> cpufreq_powersave      16384  0
>
>
> but I'm not sure cpufreq is well loaded :
>
> # cpupower frequency-info
> analyzing CPU 0:
>    no or unknown cpufreq driver is active on this CPU
>    CPUs which run at the same hardware frequency: Not Available
>    CPUs which need to have their frequency coordinated by software: Not
> Available
>    maximum transition latency:  Cannot determine or is not supported.
> Not Available
>    available cpufreq governors: Not Available
>    Unable to determine current policy
>    current CPU frequency: Unable to call hardware
>    current CPU frequency:  Unable to call to kernel
>    boost state support:
>      Supported: yes
>      Active: yes
>      Boost States: 0
>      Total States: 3
>      Pstate-P0:  2000MHz
>      Pstate-P1:  1800MHz
>      Pstate-P2:  1500MHz
>
> And I cant find cpufreq/ under /sys/devices/system/cpu/cpu*/

Looks like you don't have cpufreq driver so we can forget a perf drop
because of a lower avg freq
Thanks

>
>
> Thanks for your help,
>
> jb
>
