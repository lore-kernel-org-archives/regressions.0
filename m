Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD396FD5
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 04:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711083460; cv=none; b=tR3CFoa3z9IvCtSpWDEq5NBxKtWKXgVyMsY3nu5vAaTI7Si0x5TN7d0Ym4TVSpAQnd8C5eWQ3TXNqR9CTrAHXqRaW4aQNHejn5U9evvRaJSTUvx57JwLUbSKONqicondLcgY6Ef3SqDmhSvvZxtn/7MOfaS+/k8Ki+bZFgAlFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711083460; c=relaxed/simple;
	bh=fF5rQyHQWkmRrGj1g5vNHmvUdV2jYxwEEWFntwt3mQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VH24c8niE6Lr6DsZeOAQmE94UHP7E1OqcxB63HsEHDZzlJ/cift68L9EWiwJATRUpVgxmAlSpSsu8WE9WtRqQC/xkZf5rnCBCQiCKGMipxbzW2VtCT1I6QJxaBjKpqno57t3jMaXXdWeiQgCWeuBOQfQ1qnTYe/4JNB0D4PS8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=IIq7ZblJ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="IIq7ZblJ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-430b870163eso24027701cf.1
        for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 21:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1711083458; x=1711688258; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4moE6UNpA9SIxqGdVmnT/LKS1e/fLbBXDD3FIgn3m9U=;
        b=IIq7ZblJ44XpOXYlNYCHVZBg6OuS8IOlovPVh+QTb5goGQXOKf/kLAZbF/7Hi9PWkA
         Ht0miQXUhDm4w1pTnyO0zSDhPvLyFoIZ0Ggg5XN6ZBOGW0FHdFuOttu12QqKjRq9hyRo
         E0kZOnNniRGd+S8TeBYSn828h9YjIvaaKigMmDkVn1Nsou1E6gSrnxLX/6FQGefKJwbV
         zCBug96f/o8nLX3l6zQGYycOEFu2agFSlosrATYVlM19RL4PCx9nr0oGCJw0auAJkv04
         dfIzFExLdXpR5zMHiX0kXIM+6iDyZju6wu8t1Xb2aUQmv5LsUgNm6s82cnN1e9StikgN
         qwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711083458; x=1711688258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4moE6UNpA9SIxqGdVmnT/LKS1e/fLbBXDD3FIgn3m9U=;
        b=s2hseeBTFKSxoRQym9SyPx94yFki5iOfk4vhfELfFb+c/ZUqi6Rf97Db3HXPpZ/l4J
         Yw6/h3HCbV9j10HZbnvKlQrepS+A4da0f/vbll62VmqsxHKbGVdVgnB5WTApk7yA55Iz
         5zdwpDLLOpr8IgizsLrQeFXLuVPBw92y9WBZkjFIZfdug+uYic6tlcjXOfx0zdQq9FB6
         cHpJmELDqko20bALy3nYTe9nKujusr1ebIlcWKqvx6LALzyDqGIXxI7mkf92zgMQO7aL
         CK02ufebfgqIVSzJ2yphAB1KB2840tOMwmiGbHuNPqGA698eHOMjKfdHFxulF2YZY656
         EOxw==
X-Gm-Message-State: AOJu0YyN44CIknU5EFA+guXTl3XT024LWOUZg33Ah1+ncv9q9lpO4UCf
	qX8F7a5V8jYeTMqlOL8axWgXRUsnhHN+doa4cRE/N49BI9hAJpAI/gjfeovf1VUXmkyMkGAz2bN
	M
X-Google-Smtp-Source: AGHT+IFDVzdsNTf0W2w6oKUGYAk+vCLJ348WVZdcAHzdnqbFdRV88jezCeF+eTR98FPPhDmSdzt2NQ==
X-Received: by 2002:a05:622a:1210:b0:430:c6d3:b4e6 with SMTP id y16-20020a05622a121000b00430c6d3b4e6mr1592464qtx.12.1711083457763;
        Thu, 21 Mar 2024 21:57:37 -0700 (PDT)
Received: from [192.168.0.51] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id c17-20020ac81111000000b0042f07081f26sm558521qtj.22.2024.03.21.21.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 21:57:37 -0700 (PDT)
Message-ID: <14dcd743-144a-9f7b-849c-0843d50e4c04@draconx.ca>
Date: Fri, 22 Mar 2024 00:57:36 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: PROBLEM: Only one CPU active on Ultra 60 since ~4.8 (regression)
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
References: <CADyTPEwt=ZNams+1bpMB1F9w_vUdPsGCt92DBQxxq_VtaLoTdw@mail.gmail.com>
 <CADyTPEyAidGgBT3f1VJLHb3ouO-r1UyvFp1PcwXxy0NRG94sbw@mail.gmail.com>
 <1df92fec-7f57-5080-94ed-b149ed384280@leemhuis.info>
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <1df92fec-7f57-5080-94ed-b149ed384280@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Just a friendly reminder that this issue still happens on Linux 6.8 and
reverting commit 9b2f753ec237 as indicated below is still sufficient to
resolve the problem.

On 2023-01-21 08:31, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> CCing the sparc maintainer. Also CCing the regression list, as it should
> be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html
> 
> The the mail address of the culprit's author bounces. There is another
> Atish Patra still active; does anyone known if those two are the same
> person?
> 
> Anyway, that's it from my side.
[...]
> On 20.01.23 04:15, Nick Bowler wrote:
>> Hi,
>> 
>> I'm resending this report CC'd to linux-kernel as there was no response
>> on the sparclinux list.
>> 
>> I tried 6.2-rc4 and there is no change in behaviour.  Reverting the
>> indicated commit still works to fix the problem.
>> 
>> On 2022-07-12, Nick Bowler <nbowler@draconx.ca> wrote:
>>> When using newer kernels on my Ultra 60 with dual 450MHz UltraSPARC-II
>>> CPUs, I noticed that only CPU 0 comes up, while older kernels (including
>>> 4.7) are working fine with both CPUs.
>>>
>>> I bisected the failure to this commit:
>>>
>>>   9b2f753ec23710aa32c0d837d2499db92fe9115b is the first bad commit
>>>   commit 9b2f753ec23710aa32c0d837d2499db92fe9115b
>>>   Author: Atish Patra <atish.patra@oracle.com>
>>>   Date:   Thu Sep 15 14:54:40 2016 -0600
>>>
>>>       sparc64: Fix cpu_possible_mask if nr_cpus is set
>>>
>>> This is a small change that reverts very easily on top of 5.18: there is
>>> just one trivial conflict.  Once reverted, both CPUs work again.
>>>
>>> Maybe this is related to the fact that the CPUs on this system are
>>> numbered CPU0 and CPU2 (there is no CPU1)?
>>>
>>> Here is /proc/cpuinfo on a working kernel:
>>>
>>>     % cat /proc/cpuinfo
>>>     cpu             : TI UltraSparc II  (BlackBird)
>>>     fpu             : UltraSparc II integrated FPU
>>>     pmu             : ultra12
>>>     prom            : OBP 3.23.1 1999/07/16 12:08
>>>     type            : sun4u
>>>     ncpus probed    : 2
>>>     ncpus active    : 2
>>>     D$ parity tl1   : 0
>>>     I$ parity tl1   : 0
>>>     cpucaps         : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
>>>     Cpu0ClkTck      : 000000001ad31b4f
>>>     Cpu2ClkTck      : 000000001ad31b4f
>>>     MMU Type        : Spitfire
>>>     MMU PGSZs       : 8K,64K,512K,4MB
>>>     State:
>>>     CPU0:           online
>>>     CPU2:           online
>>>
>>> And on a broken kernel:
>>>
>>>     % cat /proc/cpuinfo
>>>     cpu             : TI UltraSparc II  (BlackBird)
>>>     fpu             : UltraSparc II integrated FPU
>>>     pmu             : ultra12
>>>     prom            : OBP 3.23.1 1999/07/16 12:08
>>>     type            : sun4u
>>>     ncpus probed    : 2
>>>     ncpus active    : 1
>>>     D$ parity tl1   : 0
>>>     I$ parity tl1   : 0
>>>     cpucaps         : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
>>>     Cpu0ClkTck      : 000000001ad31861
>>>     MMU Type        : Spitfire
>>>     MMU PGSZs       : 8K,64K,512K,4MB
>>>     State:
>>>     CPU0:           online
>>>
>>> Let me know if you need any more info.
>>>
>>> Thanks,
>>>   Nick
