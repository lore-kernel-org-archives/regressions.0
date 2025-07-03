Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1312E1743
	for <regressions@lists.linux.dev>; Thu,  3 Jul 2025 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539634; cv=none; b=OXT9S7ZGF2b+efHdxNOAx3IuOwvo07MkwYk5iAM6vyfJ5PhkdydQdCXlSD9rhCOgiWH6GjU0+RRN+egv0rpx7fqCel8AvPWCg71RpUBaC4t25DRHtX81rG6ASyGh24/FItHMpypmZD0SswnvhNKPKnLG0q40kfT4q6pOTzMpM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539634; c=relaxed/simple;
	bh=NkBVSvIRK6m5xJpAYwjcb6boeOKxulWEgOMtKfEgvGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGFSF83/Yzg7g8ne0QreuBGmuTrGh8FhH8ORY5NlmrMS2AKEAjuAiFa4P9tvFqubP/bWyhEMpG47WFuYavdvi6RENLCH3NSjoXuBaF4LA9hYtcglkMojSGE6ExjKDcgYqq4W8isMzpwxidu0WQKJvkvTiVByNhsIYXA3lcaLtrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWIS2WAn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWIS2WAn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23c76ed4a7fso11298955ad.1
        for <regressions@lists.linux.dev>; Thu, 03 Jul 2025 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751539632; x=1752144432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT116BmQVYQp7TgXBQY166ymvqYjgN3gIl7mlb2d3wM=;
        b=UWIS2WAnCVrO5Dr5k47FrEo/wfGKXaTEHQ/ydcS9rz7G5+k8ZyqUf6izNUT2a3jk4l
         octaMHFXDvrl84kqH8haXRkS6x1fsr9/awb7l9zjPbncw6CmUKgNIFSrnV+kPu+h8aEW
         ArtznblEzjWJwowCAGeqtSLjvOX68iLvi81CAJ8Fk7mA8OnqHCC5oRLpSYMUwn6HRKts
         vRFhy3dNxItugmXOCVbl9YDVl7hCbLsjEw4bNRP7EOzA2forSKnqty5y7kI0LZMacov1
         bzUnTfUjgxp9QkcvGyMYkSYBVKdNYoO+TWkIMT7za6hFxa11zDJtUBpGKj52nht+L6BV
         qwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539632; x=1752144432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yT116BmQVYQp7TgXBQY166ymvqYjgN3gIl7mlb2d3wM=;
        b=lrd3j4XlpEnkvMPsLPmvoyQWlgadJQCGTLvvBfanBJH6wV0Pwp+JIBnLmKYynbknUL
         0U8RjMZ3AbsJTPVUjnL7chDhGHjYhXa268OiMfMFUP4X1HDfFEatwiKhICRQqOw/AiKO
         5xT2beZEfuGlB+UcK64UAn8fEbOfwvhExidV13Pm59YEJAV4XdA2Q4hzWTewnIHbgwVj
         Sbn/AqJvlOz9t3n6r3kkJNKBwaPKBWomR4UfhgkjQhNruJF3bZHqZSQkExnYY9YSxYcX
         7xG7PW7EqaAk6D6jxQGKxpdV8cURNXy6FyGqvtApUvlvdPoFG0ZjX/bh9xN8xMvWH+JB
         +9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZYpFNTYzAKZzdDic7d2caAmKU+pbMSmGBRvCjH6oTHS7x4U0uzLIu6+nmISbVNe9ArqIfElz4gIX7yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMDRgF3ujTVmiaJ6brxie/My+0e1s8QtftNecODlWuiEOatumR
	W8GIRg2LEpnftFBrtxyVzV/2cVmOuAVHsbqZzrhWSwd17tE6toxTbTcI
X-Gm-Gg: ASbGncvhRPvgiKcDc7gTTXD0q96FWNWQNPFBG01nopBBohK+MtB+NOSpLYX7zmr/W+7
	kPjpp+EAWtjcnksr6fxUtcVPy2FcNxM/aG968wTj8VmZ9uRDGFXfImTQ5WvPnacNCAJyRG9Dedl
	YZcAx4hHxArIAck+wi4AIsEF1OhATPCGSnydV6J/QjILoNee3UMQnPIJZwkMGJEli1kZkJfCbki
	6oPID1CddAP+LzKL94JO19EKgMsfZ8f0BU3SRuZenNz5L9YWmPKcXekWqEkCPVUJn0SbKf7FETG
	wGviTP+alL+4zs9ofuYBvAgYydNeBI8z4SP73wwM2Xwplsid08rALgfA7HiL9Rjwz4aOiho/9at
	l6No=
X-Google-Smtp-Source: AGHT+IE+BSY2N3Ksp1Ngu882oItJhHDV437LBfkyE/yfOf+Y7Tt3xVRjNgqMrrvyEVdLEqjOCjXpZg==
X-Received: by 2002:a17:903:1aab:b0:234:f825:b2c3 with SMTP id d9443c01a7336-23c7a1f0e25mr31795975ad.17.1751539632373;
        Thu, 03 Jul 2025 03:47:12 -0700 (PDT)
Received: from [30.221.128.104] ([47.246.101.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b9f2sm162265655ad.99.2025.07.03.03.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:47:12 -0700 (PDT)
Message-ID: <2ee5547a-fa11-49fb-98b7-898d20457d7e@gmail.com>
Date: Thu, 3 Jul 2025 18:47:08 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250626: WARNING fs jbd2 transaction.c start_this_handle
 with ARM64_64K_PAGES
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4 <linux-ext4@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 LTP List <ltp@lists.linux.it>, Theodore Ts'o <tytso@mit.edu>,
 Jan Kara <jack@suse.cz>, Anders Roxell <anders.roxell@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
References: <CA+G9fYsyYQ3ZL4xaSg1-Tt5Evto7Zd+hgNWZEa9cQLbahA1+xg@mail.gmail.com>
 <2dbc199b-ef22-4c22-9dbd-5e5876e9f9b4@huaweicloud.com>
 <CA+G9fYv5zpLxeVLqYbDLLUOxmAzuXDbaZobvpCBBBuZJKLMpPQ@mail.gmail.com>
From: Joseph Qi <jiangqi903@gmail.com>
In-Reply-To: <CA+G9fYv5zpLxeVLqYbDLLUOxmAzuXDbaZobvpCBBBuZJKLMpPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/7/3 15:26, Naresh Kamboju wrote:
> On Thu, 26 Jun 2025 at 19:23, Zhang Yi <yi.zhang@huaweicloud.com> wrote:
>>
>> Hi, Naresh!
>>
>> On 2025/6/26 20:31, Naresh Kamboju wrote:
>>> Regressions noticed on arm64 devices while running LTP syscalls mmap16
>>> test case on the Linux next-20250616..next-20250626 with the extra build
>>> config fragment CONFIG_ARM64_64K_PAGES=y the kernel warning noticed.
>>>
>>> Not reproducible with 4K page size.
>>>
>>> Test environments:
>>> - Dragonboard-410c
>>> - Juno-r2
>>> - rk3399-rock-pi-4b
>>> - qemu-arm64
>>>
>>> Regression Analysis:
>>> - New regression? Yes
>>> - Reproducibility? Yes
>>>
>>> Test regression: next-20250626 LTP mmap16 WARNING fs jbd2
>>> transaction.c start_this_handle
>>>
>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>> Thank you for the report. The block size for this test is 1 KB, so I
>> suspect this is the issue with insufficient journal credits that we
>> are going to resolve.
> 
> I have applied your patch set [1] and tested and the reported
> regressions did not fix.
> Am I missing anything ?
> 
> [1] https://lore.kernel.org/linux-ext4/20250611111625.1668035-1-yi.zhang@huaweicloud.com/
> 

I can also reproduce the similar warning with xfstests generic/730 under
64k page size + 4k block size.

Thanks,
Joseph


