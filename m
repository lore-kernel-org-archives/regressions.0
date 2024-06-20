Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6A1AC425
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894175; cv=none; b=swDckpzYcRmOACBf/t2Cfc0k3RLl+AYyyekCBiMgt77Or4vm9i+E5S9ZpsizOkYdYSTSDC7Dq1MHXEhxXyz5BGTFcopcAh49LuzwoZhiYQlhcwBvZ54hyNgDq6uev8hYbEF2034286IWHcsx7/JBPtT1z+JqY3EXSZzwF27HkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894175; c=relaxed/simple;
	bh=C/7etpkN1EyOxZMX7kH6rf1YdH7lnLSLobU/qcTAhKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtYteUAsDl6ZqQ1soF54MxYXS9GbA5ZyzrJEFfHeeMZI5zgtGa33copkbfvX71mdHvhMUH4ttyJTbCzzPNj5jS3N58/fFqeEFK1NRdW0BrbdsIWNWLtrYWztPlehlZb0WJhreCnS7R2gkuc+VEzHPUwCMU5h3ytB23NfdnqfDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=ZX6tly8A; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="ZX6tly8A"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-376211b3a4fso5335815ab.1
        for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1718894173; x=1719498973; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A98UevaERdbTC/YwOFyWmTbSR1N+hw0zQSVldl8RhYU=;
        b=ZX6tly8AixAUl3nktx9HtnLv5ILW6f9Zc4LHyGQmpQo2mI3BqB7nqM5T3wugAUvoZV
         svTL40Pzbdj0Lktm12K1DsVWsBWWt3UWfAPyjrQr1U5P1eZ+N8j4DzgcCGqfpg5mO8hz
         sM2rlBTNxyACk1ego8OocWBGumuzpYFpIbH5HiZbpmNmgUXhnMSN/ZJ7s5Zg2JzMEB0W
         G5+JGdI/AZxqwTl6Md50zDyLFpZ6Siq9O1Kax+PpWahFeQmkk8bgmE7CiZju7wituV9k
         ZMOI2E5DrYnKfbBt9JynSGIvUMiHI+8se6xCoCmAIjGAe9eeCq8XyU7e+L1y6JkeajtI
         NChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718894173; x=1719498973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A98UevaERdbTC/YwOFyWmTbSR1N+hw0zQSVldl8RhYU=;
        b=N1nFob4SDDoCnZAooAojrZQK8pSOJPjwAjmm8GLK2CHfKfTtu8OZuAy0G3YcMRk+1k
         VIfSWQ+QqvD27Fzf4QjKyjZWPOuG1pX1LbMUwRcKFbZd6M/ua2v5+wHKiahjRJ1M1coj
         X47kOSldrzMNXp3erwISDeQUN7pTkbLms2eCMlLCAzJvxWyJ/2m/x40bu2wFwDf1ZHQm
         L5dFuQ52plPM1UHaVHiudxeRiqbxoYZoPB5NdNjI13EBs5c7TAbvoOZU8Tt4oftMehLH
         PvLKKb6kQyYqS2cBaJrnvmExLlS+/xyHzPwbTOFhDmqI5Efog+CzLUCqGq7BROhYM5QV
         xf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmJLDiM63b/5rx+XP3DN+jrVE0jOvKu6tM5d3p4o6EIRjvnHdP47rPlL4GP79Uchpou7sfpviFTLxLe/OStQbIXNDN/uPCJFW72n4=
X-Gm-Message-State: AOJu0Yx8QpiHmw1+uX5WtJyF3kONtexIh00K2f1bsZ65D4TvJUI9KGLi
	T7hZwwPor7/Maqyh/9x1YlOWgIJryZbApneA5yrb/yWgo362Hq3RS3+qMIwDEFTZdYdgenfMXhB
	OqzQ=
X-Google-Smtp-Source: AGHT+IHEX4VWi6NFf2OYvYNfmsh9bNN5+QvL49KMSIcQjonXWJpIa7TVyKkpnYOby5F1SBrP2YKhQw==
X-Received: by 2002:a92:dd0c:0:b0:376:296b:1754 with SMTP id e9e14a558f8ab-376296b17c3mr7852465ab.15.1718894173249;
        Thu, 20 Jun 2024 07:36:13 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9568dfb15sm4517876173.18.2024.06.20.07.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 07:36:12 -0700 (PDT)
Message-ID: <012b7244-fa12-452c-9d76-7768e59f7e03@draconx.ca>
Date: Thu, 20 Jun 2024 10:36:11 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Content-Language: en-US
To: Hailong Liu <hailong.liu@oppo.com>
Cc: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
 <20240620063742.7qugmebodtlogn5r@oppo.com>
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <20240620063742.7qugmebodtlogn5r@oppo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-06-20 02:37, Hailong Liu wrote:
> On Thu, 20. Jun 02:19, Nick Bowler wrote:
>> After upgrading my sparc to 6.9.5 I noticed that attempting to run
>> xfsdump instantly (within a couple seconds) and reliably crashes the
>> kernel.  The same problem is also observed on 6.10-rc4.
[...]
>>   062eacf57ad91b5c272f89dc964fd6dd9715ea7d is the first bad commit
>>   commit 062eacf57ad91b5c272f89dc964fd6dd9715ea7d
>>   Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
>>   Date:   Thu Mar 30 21:06:38 2023 +0200
>>
>>       mm: vmalloc: remove a global vmap_blocks xarray
[...]
>>   spitfire_data_access_exception: SFSR[000000000080100d] SFAR[0000000000c51ba0], going.
>>                 \|/ ____ \|/
>>                 "@'/ .. \`@"
>>                 /_| \__/ |_\
>>                    \__U_/
>>   xfsdump(2028): Dax [#1]
>>   CPU: 0 PID: 2028 Comm: xfsdump Not tainted 6.9.5 #199
>>   TSTATE: 0000000811001607 TPC: 0000000000974fc4 TNPC: 0000000000974fc8 Y: 00000000    Not tainted
>>   TPC: <queued_spin_lock_slowpath+0x1d0/0x2cc>
[...]
> I guess you can patch this
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-hotfixes-unstable&id=00468d41c20cac748c2e4bfcf003283d554673f5

I tried with that patch applied on top of 6.10-rc4, and the crash still
occurs.  There is no obvious change in behaviour.

Thanks,
  Nick
