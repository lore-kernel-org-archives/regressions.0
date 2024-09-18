Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9134C158219
	for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726641428; cv=none; b=tav+e0TIEAFdccdT/nxjnwkScDvWxXWR0zskYl3EMy80FGtgrSCa2zdj8duAI0nD0epmcL4jvPpbLBmVqhHkwJOllsKG3wUSBMrGcjEvU659MR9lz//pNnCnxzjCmYZQAE+6B42acWH7GiuCdpdzlhdUvRUmnXsfVIxnIe1pFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726641428; c=relaxed/simple;
	bh=04wFRTmhaMNLEIfkaR4jRwa5fJu4Gu8BgBWpgBSxiTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/jVskTtm1/dHPOltKEuSPmrniRkjmHLOEKCECrHBRATwwoEVz8hnjI3/oABPAqoyNwTCigbACypUdeJpZxmXC34EMpMRrmiKj2vr71HmuVx2ASQA+u4C8aWyeJ2BzC+D8PkX7oyz+LO8bPuTLwBIK1hZ/kFJOQx04ik48/6SKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=HK6ntfck; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HK6ntfck"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so53749175e9.0
        for <regressions@lists.linux.dev>; Tue, 17 Sep 2024 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726641424; x=1727246224; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONBa+excFFO7rQj3mSGSspHjsKaP6ICID9dssfbxrK8=;
        b=HK6ntfcksDwu6dxNrddQPLeaS3FxyFQS/+aNRGzaQJR0qMopEZAPjbVQVuL8XOLypX
         a7ue9OkJajZnw+fMcFDSkWaf1+WYTiIxXYVr88sM5pShC2jWd9Rq+n1JXG1+xnKseA/I
         0rB3mAr0l04rpWIoiGvfAVuqT5MyF5bugdeeAIxIidv6P1wN9ik44iJSPCMc6Dgpv7lH
         y/Q8MxT0Q+6AR4tvcIyc/NgZ4odUOX/B0sB4KW8RGh5ha9c3tkN5UtPa7YVB7HAZ59HU
         I8To2q0cPhqygNsOsfk9XTvO/8nOsVzogywSE8Kk0HjN8lX3srCKQ6OZWAAwaovGCRAV
         j4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726641424; x=1727246224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONBa+excFFO7rQj3mSGSspHjsKaP6ICID9dssfbxrK8=;
        b=L13o+ZnC6L8ObZ+UHmBLUHVZ4waW0BgydCLaWFioLgnBAbrem86dF0GxBThKmQOKGs
         yrY5ipe0rZHx9Vz5r/pDpeTK1FspmNXu9il81d+8ksBJd/Bj+psCiAmQZJ3tyQS09KFu
         dXT7QAopiN4M3FSHKsBbhjpCzWSB/8+fwiUvta21MEqBPWj3mgFy1+iicO6Rgg+TveHG
         HEC0akt9w/w5HyACBtYCuuVaym3/h/rowAhIEivQ9VsnSSHFSVMbTdMU80Qg3S26MM76
         wXZdfMbH9U+xITq+LbisArmyrLX7T5E6zzSmEzObDSFHjSGqZW7JB+CBJ3FEbkR4reUM
         HG3A==
X-Forwarded-Encrypted: i=1; AJvYcCW3NA7OxmxoobrTq7XOOWp/OkOmZ0Bjw3StPNY2TGG4AlqXiO/Mv5OdhxjmU2nqTequMKVNgnQMpWNdaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlSgRKiIxjx7DrtAe1x2ftP1H9ZqPh956tn/QbzXjf3huLWFHE
	CKgri5tdTEHR7XyKH92WqqSj7Hsx7IGXvq91nAi+uphJZlPg2dos0bqzEb17Nqk=
X-Google-Smtp-Source: AGHT+IFuyOiC/XvUY4Wd1OtS/NrMuj2AqikvELaUO76m0bhp4vCBZtJUmcPgp8JUIdbzh/H1w+GxiA==
X-Received: by 2002:a05:600c:1e0f:b0:42c:bc04:58a5 with SMTP id 5b1f17b1804b1-42cdb58e4b1mr140112675e9.33.1726641423740;
        Tue, 17 Sep 2024 23:37:03 -0700 (PDT)
Received: from [192.168.0.216] ([185.44.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7054c580sm7966815e9.45.2024.09.17.23.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 23:37:02 -0700 (PDT)
Message-ID: <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk>
Date: Wed, 18 Sep 2024 00:37:02 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>, Christian Theune <ct@flyingcircus.io>,
 linux-mm@kvack.org, "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Dao <dqminh@cloudflare.com>, regressions@lists.linux.dev,
 regressions@leemhuis.info
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org>
 <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <Zud1EhTnoWIRFPa/@dread.disaster.area>
 <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com>
 <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com>
 <ZumDPU7RDg5wV0Re@casper.infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZumDPU7RDg5wV0Re@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/24 7:25 AM, Matthew Wilcox wrote:
> On Tue, Sep 17, 2024 at 01:13:05PM +0200, Chris Mason wrote:
>> On 9/17/24 5:32 AM, Matthew Wilcox wrote:
>>> On Mon, Sep 16, 2024 at 10:47:10AM +0200, Chris Mason wrote:
>>>> I've got a bunch of assertions around incorrect folio->mapping and I'm
>>>> trying to bash on the ENOMEM for readahead case.  There's a GFP_NOWARN
>>>> on those, and our systems do run pretty short on ram, so it feels right
>>>> at least.  We'll see.
>>>
>>> I've been running with some variant of this patch the whole way across
>>> the Atlantic, and not hit any problems.  But maybe with the right
>>> workload ...?
>>>
>>> There are two things being tested here.  One is whether we have a
>>> cross-linked node (ie a node that's in two trees at the same time).
>>> The other is whether the slab allocator is giving us a node that already
>>> contains non-NULL entries.
>>>
>>> If you could throw this on top of your kernel, we might stand a chance
>>> of catching the problem sooner.  If it is one of these problems and not
>>> something weirder.
>>>
>>
>> This fires in roughly 10 seconds for me on top of v6.11.  Since array seems
>> to always be 1, I'm not sure if the assertion is right, but hopefully you
>> can trigger yourself.
> 
> Whoops.
> 
> $ git grep XA_RCU_FREE
> lib/xarray.c:#define XA_RCU_FREE        ((struct xarray *)1)
> lib/xarray.c:   node->array = XA_RCU_FREE;
> 
> so you walked into a node which is currently being freed by RCU.  Which
> isn't a problem, of course.  I don't know why I do that; it doesn't seem
> like anyone tests it.  The jetlag is seriously kicking in right now,
> so I'm going to refrain from saying anything more because it probably
> won't be coherent.

Based on a modified reproducer from Chris (N threads reading from a
file, M threads dropping pages), I can pretty quickly reproduce the
xas_descend() spin on 6.9 in a vm with 128 cpus. Here's some debugging
output with a modified version of your patch too, that ignores
XA_RCU_FREE:

node ffff8e838a01f788 max 59 parent 0000000000000000 shift 0 count 0 values 0 array ffff8e839dfa86a0 list ffff8e838a01f7a0 ffff8e838a01f7a0 marks 0 0 0
WARNING: CPU: 106 PID: 1554 at lib/xarray.c:405 xas_alloc.cold+0x26/0x4b

which is:

XA_NODE_BUG_ON(node, memchr_inv(&node->slots, 0, sizeof(void *) * XA_CHUN  K_SIZE));

and:

node ffff8e838a01f788 offset 59 parent ffff8e838b0419c8 shift 0 count 252 values 0 array ffff8e839dfa86a0 list ffff8e838a01f7a0 ffff8e838a01f7a0 marks 0 0 0

which is:

XA_NODE_BUG_ON(node, node->count > XA_CHUNK_SIZE);

and for this particular run, 2 threads spinning:

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-1 rcu_node (CPUs 16-31): P1555
rcu: 	Tasks blocked on level-1 rcu_node (CPUs 64-79): P1556
rcu: 	(detected by 97, t=2102 jiffies, g=7821, q=293800 ncpus=128)
task:reader          state:R  running task     stack:0     pid:1555  tgid:1551  ppid:1      flags:0x00004006
Call Trace:
 <TASK>
 ? __schedule+0x37f/0xaa0
 ? sysvec_apic_timer_interrupt+0x96/0xb0
 ? asm_sysvec_apic_timer_interrupt+0x16/0x20
 ? xas_load+0x74/0xe0
 ? xas_load+0x10/0xe0
 ? xas_find+0x162/0x1b0
 ? find_lock_entries+0x1ac/0x360
 ? find_lock_entries+0x76/0x360
 ? mapping_try_invalidate+0x5d/0x130
 ? generic_fadvise+0x110/0x240
 ? xfd_validate_state+0x1e/0x70
 ? ksys_fadvise64_64+0x50/0x90
 ? __x64_sys_fadvise64+0x18/0x20
 ? do_syscall_64+0x5d/0x180
 ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
 </TASK>
task:reader          state:R  running task     stack:0     pid:1556  tgid:1551  ppid:1      flags:0x00004006

The reproducer takes ~30 seconds, and will lead to anywhere from 1..N
threads spinning here.

Now for the kicker - this doesn't reproduce in 6.10 and onwards. There
are only a few changes here that are relevant, seemingly, and the prime
candidates are:

commit a4864671ca0bf51c8e78242951741df52c06766f
Author: Kairui Song <kasong@tencent.com>
Date:   Tue Apr 16 01:18:55 2024 +0800

    lib/xarray: introduce a new helper xas_get_order

and the followup filemap change:

commit 6758c1128ceb45d1a35298912b974eb4895b7dd9
Author: Kairui Song <kasong@tencent.com>
Date:   Tue Apr 16 01:18:56 2024 +0800

    mm/filemap: optimize filemap folio adding

and reverting those two on 6.10 hits it again almost immediately. Didn't
look into these commit, but looks like they inadvertently also fixed
this corruption issue.

-- 
Jens Axboe
