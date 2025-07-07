Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B12B9BA
	for <regressions@lists.linux.dev>; Mon,  7 Jul 2025 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751852616; cv=none; b=T7dXMb1hoPTqlHkjr3jmnR2obKoBWNARZIZukWAQYAl3LXgivtJni0snE6/PSn6FCfEeuMhn/VCx8s3Tu9p1wTzsg4I2SIud8+JQ7a2uqqGUpq5iIq6kec4hj4/6LzD07xsgH70+HQ2cCLXYBrDngcZKUtmxRMSwz+4lljW860I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751852616; c=relaxed/simple;
	bh=0oOh/SwrR1nKgo/W50Un2nD8VEntfSd5IdyL5HAHjWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcLyvSB9cdY3Pw5Jwt/AL8GmvmlSIXH36715/jkAUZCTq20/PVirCUeJyqbTXDQY139xT31GIzAte0S+OL6gXybY105xphiW5dj0FC/YYqhC5F9EvJTzYk8LHD8Wx2X1d7IXpwDxYFeYXM5+Zi49V0F4hjaLo0U1slg7/ii9o68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO/QkfKN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO/QkfKN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235ea292956so21934285ad.1
        for <regressions@lists.linux.dev>; Sun, 06 Jul 2025 18:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751852614; x=1752457414; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ0QVfcPqBxlG+BwXU72MLxNR3PM6YaC0rXqHjP+Erg=;
        b=BO/QkfKNzn87Paog2DDucJrRCuoNAzRka4pq5HOzApIR6AuQNbl+5nFJ0o5GtchBOW
         YpuLz0OWyva5c2H20d5lymdDv5poC9Y0LH56zAyQK7fweShXqRE6G778RDxKr046Kp1F
         S3IGQXGTC/zwBbcaZzkHhXT7wAqp7nDlnxTOf3Oa+uHfV3qxtDYQ/Q69pc8Zi5FSdt0c
         j/vAEmgaEMHF4ZSiRZQGP5lzSLCeHYXMidGNN1U0vfv+Z8e1AqjeHwpkUugIf8w3MvXg
         Jr0XS9Gg00iyLyzQIy4PbUThrXMxR2WRkkUGWfWMB7AtDv64r1eHItwc78lhmqSBbhYR
         Xipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751852614; x=1752457414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQ0QVfcPqBxlG+BwXU72MLxNR3PM6YaC0rXqHjP+Erg=;
        b=qgS8auroM4UijRg5O/Sw1UTsZD1q5/oWwPpPKvdIxEQHUTTuWjhJjrr46egBD6yJMN
         xf9bH+Mc+Sr4kADTUzMo2Aq3RcYJGa6fCcT1AFkW5Dex15/LtUjwWAiJ/450I9hZQ6na
         UBVXfZz0J0S4ahngapybLh9XjCb5Npb3s48OdJfV3HpY/7qPtvsuhbxgzj/m3uUoMW3q
         wJfBaR42vqOtw3K74z6x6GzzK8uQUbrau8gNMTjOXg+4CITeCgqJcKcviqGkXTeDWKvJ
         WTZmgA4a2A0DScvzTLJVBUAbAbMpCyIQRuKaDTssmqXmvYf2+qjegaRQOGZM2GuY/c8C
         GSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU5gzVlH2wXpT5+9EFmg2zLkqzrh4fkhs7kvotM0zcK2cRtGfC6ypmlCZHTnJxmNAMzXgHj79zzHtyYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJmIiiYGrttSsHuNXBWkdd/7ja6r8UTw+2mfar6SbBbH2jtmh1
	ag9HV70m1ZhyjeJVLMWq7utkJ6o6CXNS6gzWRoOc1L2do7n5Qfv3uXHa
X-Gm-Gg: ASbGncsIWVnbSCglVEpI0kWHo82ck2qWRrWBk1g2wIp63yJfJEFNMleVIHZS/EG+d5Y
	nOOOmch5LG8kPdj5VLD1dyQr8HwPQsHwQBcJpy3s7VMhhx3BMgvbyW36SOkxOQCQc9UDku7sm+S
	hszmY3Db2ngLT2awsfvyU5kYgLp3P94PvGq6/PZjnK88ih2WHsDYRkVSBAg69aQhjIRiavIg1O/
	0ytgt1whV5V3ukXRJFKsaVIkxeT4JXo0xWLFPFczj0KNoegb1KavdgN67ADU+C0XdSOcxGVOgu6
	QOEYnYyKklCGvqSslP+mCmybE5vX2X7R084qIy49quelAMxXqi21X5NSXcVb9KyfR9/mQhBNd7s
	u6nM=
X-Google-Smtp-Source: AGHT+IHNt7WBHbqYkIjNosgrP7JpZnQJUROnNvYMUGxq5civC/rNorosebcQakFdz4ycPFVURZ8NHQ==
X-Received: by 2002:a17:903:244d:b0:235:2375:7eaa with SMTP id d9443c01a7336-23c8747eb6cmr172434375ad.22.1751852613869;
        Sun, 06 Jul 2025 18:43:33 -0700 (PDT)
Received: from [30.221.128.189] ([47.246.101.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457bea4sm77287425ad.146.2025.07.06.18.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 18:43:33 -0700 (PDT)
Message-ID: <5db1e0c2-a192-4883-9535-dd269efdff74@gmail.com>
Date: Mon, 7 Jul 2025 09:43:29 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250626: WARNING fs jbd2 transaction.c start_this_handle
 with ARM64_64K_PAGES
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4 <linux-ext4@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 LTP List <ltp@lists.linux.it>, Theodore Ts'o <tytso@mit.edu>,
 Jan Kara <jack@suse.cz>, Anders Roxell <anders.roxell@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
References: <CA+G9fYsyYQ3ZL4xaSg1-Tt5Evto7Zd+hgNWZEa9cQLbahA1+xg@mail.gmail.com>
 <2dbc199b-ef22-4c22-9dbd-5e5876e9f9b4@huaweicloud.com>
 <CA+G9fYv5zpLxeVLqYbDLLUOxmAzuXDbaZobvpCBBBuZJKLMpPQ@mail.gmail.com>
 <2ee5547a-fa11-49fb-98b7-898d20457d7e@gmail.com>
 <094a1420-9060-4dcf-9398-8873193f5f7b@huaweicloud.com>
From: Joseph Qi <jiangqi903@gmail.com>
In-Reply-To: <094a1420-9060-4dcf-9398-8873193f5f7b@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/7/5 15:10, Zhang Yi wrote:
> On 2025/7/3 18:47, Joseph Qi wrote:
>>
>>
>> On 2025/7/3 15:26, Naresh Kamboju wrote:
>>> On Thu, 26 Jun 2025 at 19:23, Zhang Yi <yi.zhang@huaweicloud.com> wrote:
>>>>
>>>> Hi, Naresh!
>>>>
>>>> On 2025/6/26 20:31, Naresh Kamboju wrote:
>>>>> Regressions noticed on arm64 devices while running LTP syscalls mmap16
>>>>> test case on the Linux next-20250616..next-20250626 with the extra build
>>>>> config fragment CONFIG_ARM64_64K_PAGES=y the kernel warning noticed.
>>>>>
>>>>> Not reproducible with 4K page size.
>>>>>
>>>>> Test environments:
>>>>> - Dragonboard-410c
>>>>> - Juno-r2
>>>>> - rk3399-rock-pi-4b
>>>>> - qemu-arm64
>>>>>
>>>>> Regression Analysis:
>>>>> - New regression? Yes
>>>>> - Reproducibility? Yes
>>>>>
>>>>> Test regression: next-20250626 LTP mmap16 WARNING fs jbd2
>>>>> transaction.c start_this_handle
>>>>>
>>>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>>
>>>> Thank you for the report. The block size for this test is 1 KB, so I
>>>> suspect this is the issue with insufficient journal credits that we
>>>> are going to resolve.
>>>
>>> I have applied your patch set [1] and tested and the reported
>>> regressions did not fix.
>>> Am I missing anything ?
>>>
>>> [1] https://lore.kernel.org/linux-ext4/20250611111625.1668035-1-yi.zhang@huaweicloud.com/
>>>
>>
>> I can also reproduce the similar warning with xfstests generic/730 under
>> 64k page size + 4k block size.
>>
> 
> Hi, Joseph!
> 
> I cannot reproduce this issue on my machine. Theoretically, the 'rsv_credits'
> should be 113 under 64k page size + 4k block size, I don't think it would
> exceed the max user trans buffers. Could you please give more details?
> What is the configuration of your xfstests? and what does the specific error
> log look like?
> 
I'm testing on arm 64K ECS with xfstests local.config as follows:

export TEST_DEV=/dev/nvme1n1p1
export TEST_DIR=/mnt/test
export SCRATCH_DEV=/dev/nvme1n1p2
export SCRATCH_MNT=/mnt/scratch

Each disk part is 250G and formated with 4k block size.

The dmesg shows the following warning:

[  137.174661] JBD2: kworker/u32:0 wants too many credits credits:32 rsv_credits:1577 max:2695
...
[  137.175544] Call trace:
[  137.175545]  start_this_handle+0x3bc/0x3d8 (P)
[  137.175548]  jbd2__journal_start+0x10c/0x248
[  137.175550]  __ext4_journal_start_sb+0xe4/0x1b0
[  137.175553]  ext4_do_writepages+0x430/0x768
[  137.175556]  ext4_writepages+0x8c/0x118
[  137.175558]  do_writepages+0xac/0x180
[  137.175561]  __writeback_single_inode+0x48/0x328
[  137.175563]  writeback_sb_inodes+0x244/0x4a0
[  137.175564]  wb_writeback+0xec/0x3a0
[  137.175566]  wb_do_writeback+0xc0/0x250
[  137.175568]  wb_workfn+0x70/0x1b0
[  137.175570]  process_one_work+0x180/0x400
[  137.175573]  worker_thread+0x254/0x2c8
[  137.175575]  kthread+0x124/0x130
[  137.175577]  ret_from_fork+0x10/0x20
...
