Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660424;
	b=5jRliz3T/HyiXfwnqoMzic1hqjLZMukM95xbyWV+ulUl2/2ohetT0f1eb69cd32uzq0x
	 GdbrtvlRjAQQX1PS0zT1dpIuL9xXnAr7agZgcxrXCOupJqCbOg6YQkat4bYxl3Wk+Lwql
	 pwGzu+NB79zSw7Y2z8+6I58KAKNekuoDnAZYrYEEHdIz1KBHJgMC0CknjXCS5xxq2Pw4g
	 AMht4ijTBvX5x8wm9raVyNvrnvKax///VBFSrgCL3Hk+qfmOXA6BQfRDBippABGBfwU79
	 QxMfsY3bg1xvQjPdM67HC6Ry5A2kOBUkkY73HvTV3TLAqWxh9sCdLqEDJ536LWyaGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FINTa2MpCSNE/TWHxw/1m7qkME3F6UZuCUBBZ7mFXGI=;
	b=1UnFCYWHoJFplM+2LbJVLdBgdkQV+zkbcERzvbWpW12FISPI+OmMtvGNWQe8bvVIBuIz
	 mU1IT/erW2jOd+KrrrMQ/4jv8RZV9U7upAuVzcF8MsgkI/l0VTV8VRhZWilT9GLUZkuDB
	 IvYTaozxLqANT0tpOR91j+2DVJ+p/jHY9N//AnUkAjl52XmrKubTIyzRBWLQnqAoumo+M
	 pVry/oBJ6Xr1fVwRQfWBUeQykxayOXhHmigePXXAQzIgJQwkKBUlcJPCsLPuR/zg5nPd2
	 60H611h1k+mY9B4ASymoXtvWiE3iOMdH7dr4ASnUYB+4vWT0wI59MAy+IfgUJvGU9eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NNXF6Pal;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3CF606A31D
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 09:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3CF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NNXF6Pal
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06e79e152so751376b3a.0
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660423; x=1793265223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FINTa2MpCSNE/TWHxw/1m7qkME3F6UZuCUBBZ7mFXGI=;
        b=NNXF6PalfL5CxCDcLctSc8kKBpPVidfqZ7Nqu58SRKoKvZ+rpxREIFBBAaZJR4PcgG
         XlQTSz2fZrICYKMkvPyy2AZBlMsvJolcjmA2iWOUa+EW7DTlQM6uIOxboGehSYo9Pxnl
         gkKVWc3stWdrvjyno5xXSv08CMx9rwET8ybM0mmukdX5G4gLM9860RCmOMMKv4L9nfJA
         1pFHdq5X7SVYBYGy8OLeHIoIE3mxyg+aqNnGE15XvwZqNZZP4q1OZStYjuZup3iysSRZ
         6clfh7SbzzEZUsIqW/3+LLgJSQfZQQ3T6WqGk1vh6zVOyz3SE2kWzzSZUTN9BXH8JlUY
         vhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660423; x=1793265223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FINTa2MpCSNE/TWHxw/1m7qkME3F6UZuCUBBZ7mFXGI=;
        b=EBjUjWAJATU/xfwYW76XMrjgYaSTArLrYlflsYAXIP7aA2OVXDGavRQKjNI625v9fg
         XFiwOG7KP4aQuKfWfbFAz5hweBbMJPwpoXP8lEKynVMuRcl5m7LQBmwzvgWuQ+k+B9zT
         g9ED/tMHhtp/XcoPOX6Vlu2T3/FPy8uZB8Ae7+Mk/Y7Ii8qIPUdx3x80qUcc73u3hUca
         wlvvNeS/eNN/7euxFKOXArou9n9UT8eIPe9h4imJAMXFFnB4N7AZ4kCY7F/eFR9ysWJV
         IHgCVlUGwCJ3ITrowdpUetLTBK+jRGLRJnL7g7fJDPybzpiNZ5rsaL+LR/G4ZcRZ1Tr+
         R70A==
X-Forwarded-Encrypted: i=1; AKwUvBwcXjSzfiR7KP6+O+3UBVLx6F7ldzzr+f0qKpAjyss9RMBU7k8zLy/er3N1mjWxN76JWkbMsvISuTUw1w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIiRhLRX4hf3r5m8pln3VqbROy1p8kVpYA+o4c/UUWPJOSbR4DJ
	ReVSbzyrxBGfXDtEKa8gVhrIG5VwofqZnrHDYyuQHtEbEuSCZ8lg7OAH
X-Gm-Gg: AYBFou3b6THCINCCP0zCMpxj1nH3iWnK258miBj2CnxWBbiBh+aOItws8Kdq36b7uLP
	jv3JF+Hn4eNyDoy7B/63bWo4c3CEc7tO+GNa4RYEGiwQCLNvsWg7JsWoZzdXMElAairQjadzhJg
	kab7FAo5NxwJWpEKg5Ei7NMaiPSblu4l6IMzD8BzU44zguFPH0xLpk2kn2DsYWXAj4RDnllztrb
	+VvV98NZ3C1L49ZNOLSEnCdzVFv7DaE72hKJzR8xyHPLVyaaQlXTMTvHnlaZHwTIf+Bhmq/k8rJ
	sX/ymzAUNEVlFfoPU8Utwxobgn53GWJMKYjD4jQetMAOW3TEpWkVat71fKmp5BkfmCfizBlmr4Z
	HUYQBXfYfFMPTK1GV7rNgkP2FMsKx19lJgFuuNjUUTFAgZU6ciCY6IK+xNr/ex6gshLK5HPGJu2
	Y0Y9KgvBfW8V3wI83Raz8f4nFYZobGanHi7sRbHUtwInZ4EUqO2IwvqGHNMOCZwR+60dnNZp3yv
	76lKMRziqJXgKPbolyTcB3oVZfd40LluGJmz+QMfy0lafUGlOZe9D92ZDXPMvYTvg3YkzOSVEi/
	FZFwsHM2GAK59b7zB5I=
X-Received: by 2002:a05:6a21:9d8a:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e287f30989mr3468912637.72.1792660423266;
        Thu, 22 Oct 2026 02:13:43 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:7b5d:9435:af71:375d? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c060asm1855223b3a.22.2026.10.22.02.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:13:42 -0700 (PDT)
Message-ID: <271a9f64-e1d8-4b21-968f-9cb95b980ec1@gmail.com>
Date: Thu, 22 Oct 2026 17:13:38 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Serhiy Shliapuhin <shlyapugin@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@lists.linux.dev
References: <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
 <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
 <CADGd8gF9DxnDVZxbsARCNkXXp7_aWfWOkyAN_Y8v65TtKW3zNg@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CADGd8gF9DxnDVZxbsARCNkXXp7_aWfWOkyAN_Y8v65TtKW3zNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 16:08, Serhiy Shliapuhin wrote:
>> Can you avoid it by blacklisting bitland-mifs-wmi?
> Yes. With bitland-mifs-wmi blacklisted no platform_profile handler is
> registered, and power-profiles-daemon switches all three profiles via
> intel_pstate EPP again, same as before the driver was added.
>
> The same can be achieved by running power-profiles-daemon
> with --block-driver=platform_profile, which is what I use now.
>
>> And does it still happen with vanilla 7.3? 7.0 is long EOL upstream
>> (and 7.2 soon, too).
> Yes, it is reproducible with vanilla 7.3-rc3 (Ubuntu mainline build,
> no distro patches; newer mainline builds are not available yet -
> bitland-mifs-wmi.c has not changed since 2026-07-03 anyway).
>
>    $ uname -r
>    7.3.0-070300rc3-generic
>    $ cat /sys/class/platform-profile/platform-profile-0/name
>    bitland-mifs-wmi
>
>    low-power             -> accepted, reads back "balanced"
>    balanced-performance  -> -EOPNOTSUPP, stays "balanced"
>    performance           -> -EOPNOTSUPP, stays "balanced"
>
> Understood regarding 7.0; I only mentioned it as the last kernel
> where profile switching worked on this machine, before
> bitland-mifs-wmi was added.
>
> Thanks,
> Serhiy Shliapuhin
>
> On Wed, Oct 21, 2026 at 5:56 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>> On 10/20/26 07:12, Serhiy Shliapuhin wrote:
>>> On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
>>> by bitland-mifs-wmi can actually be selected. "performance" and
>>> "balanced-performance" are always rejected with -EOPNOTSUPP, even
>>> while the laptop is charging, and "low-power" is accepted but has no
>>> effect. As a result power-profiles-daemon can only stay in Balanced.
>>>
>>> This is a regression. With Ubuntu kernel 7.0.0-38-generic [...]
>> Can you avoid it by blacklisting bitland-mifs-wmi? And does it still
>> happen with vanilla 7.3? 7.0 is long EOL upstream (and 7.2 soon, too).
>>
>> Ciao, Thorsten
>>
Hi, We're tracking this issue in the recent patch series.

https://lore.kernel.org/platform-driver-x86/20261021123414.25516-1-qby140326@gmail.com/T/#t

