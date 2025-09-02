Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF41E0B86
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756838833; cv=none; b=IHS1HpjPzjoms6TW1KHHdwtLege0Jaem6sCk5PdMObuPlvPBy0LjVWVMGogvsFKaWPCI0FgiFF64+8DFUcKa+UJRli4pD8C0mknjByY7D37Uj2tH3VcCzdjH7LgEhdjTJf/w1DQzjNSZld9wMYAN5DLkSDzn7TS8s+XqWxGNAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756838833; c=relaxed/simple;
	bh=niHNVvGTbLrHGUofLzXOJQKNA7lJyWtdS3IisPCmbPE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fOkztBoDX/suFNSMaKWZavudvULZTYDsXiqxj7kvf8AEioSwQczoH+UqO10dlGPWfacH/4xA1vdRVRGbTEXhwItLdR2Xl+NSz+XZGdb73jOzTL2+OPhY4g0zkuzPCBH0IYWJlu0cYOqMn7t39YS7RBos4R0+rk+jWWQfgZmGHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4gVUdoY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4gVUdoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756838831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mL5Iuf1X4+usrTx5fIL5N9qPxoTLIij37cao5pmfb98=;
	b=N4gVUdoYiRD16YVfuMkgKE/3oALpGe1gSR4dnGJHQtUa4CEJgi4DLC4cQQaGCM+SFF4dlg
	NjqPSrI9XVK5CGyOVS1z8tb5ROpwjWTVTLWQUvEGsmgM3oyOSAOS98JBOg07dPyhBP8WnH
	jQp2SKC58zF3wBbvoljwBI6dZD7USPU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-rFFQsMYbOEC7T8mO5D7CvQ-1; Tue, 02 Sep 2025 14:47:10 -0400
X-MC-Unique: rFFQsMYbOEC7T8mO5D7CvQ-1
X-Mimecast-MFC-AGG-ID: rFFQsMYbOEC7T8mO5D7CvQ_1756838829
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dde77f3e9so105237216d6.3
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 11:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756838829; x=1757443629;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL5Iuf1X4+usrTx5fIL5N9qPxoTLIij37cao5pmfb98=;
        b=lcOy6g29KJajTYXkVrtFDsVIZeVh0JijJgRk5ItrHENwByFOwQT4mjS9CADBWU4fFC
         1ZH2LXp4OeoIe6yyZFUpG2rKO7KVkUMXVWVFtyBCwnmLzZL8B39PbkUv0rBwFILgbbIv
         nvMW1puK8OWsDunzwvGe8/ViDpNCw6022kVu0GYIWqkkiYBYs2DQ3WItOMzjyURH/Orr
         Ivwww+dxdjNl0P6j6zO+irWdHMciqe1Q/AmIenq6eSDAhxZto3PeYFEvIkTfwj90vacd
         EZu/tRDhW/9eB63/AQ2zMXoOoe2URCYhLKfK/nNKGeyKwwZDgar49XBkNj7D0xXeBJ6R
         5HMw==
X-Forwarded-Encrypted: i=1; AJvYcCXm8MponhcM8j9E6e/l7MnMQqHTr53hHYtL5NbMjOAkWtfbMGQm3RmufdrjSLc2DgolEtEZXbhbwDsfLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKNzqcGphxNtDvm+W0yB56GLDUbNktvN8yIcgvo2GXGk4N+Huh
	CYpvuWLipVe+fjseIjwhdd1uiloItYPlA14RUoJdDh0x4/SFr1gkQYtRO1yaH+3Jm02cf2J6aLK
	nccVPhdtLHWH56lvewiVAyC0Kb1+EvcDTTw7xJM5/dNMBmx6T0ef55xdhBbG5Jqca
X-Gm-Gg: ASbGnctrXpfJ47bS4C/rPIj5IWWy7k8OkiDcZnitRtfoXkrW5Wy3xV4Rn9nvdKFaoSb
	qI0ZsbXB3r27R5+IdtcMm2+PzKmKtOIVBJea86w492Ipg3FeXczy6nozadyC7SeYyvFJe5suHwD
	Kdrcxp0yp+dua5PmKkvCgfgDYlIMBAgATePrlV8znAQQPy+JbKyI4i5DrfxZPmwMtFa78GEHGUP
	S9KX0/QfjaWoDxKBEjI/gatffUTMGVp8aMm2hR/gOclOl9P05IzeSEIYv2/mR8IS0KbCLm/b01p
	e00mKRcQwK8HDFOytl1bLvkhAq7e3dKXMtlkpJgXlBqp0Suo/l5LUK8zwI0jsyp1vIazLdWam2b
	CITIpSp5dhQ==
X-Received: by 2002:a05:6214:21cb:b0:70f:a719:5666 with SMTP id 6a1803df08f44-70fac92194bmr129841746d6.61.1756838829436;
        Tue, 02 Sep 2025 11:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsXDCqrxLSsW18GhRFLcFTT86tc4vo6hE4zeQhE6MFMmYRH8/ZI2p1iYn7Y10qN43gJ30zqg==
X-Received: by 2002:a05:6214:21cb:b0:70f:a719:5666 with SMTP id 6a1803df08f44-70fac92194bmr129841426d6.61.1756838828872;
        Tue, 02 Sep 2025 11:47:08 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720add668bdsm15895626d6.33.2025.09.02.11.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 11:47:08 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <530b6d8f-8987-4fd7-9add-eed0a823b411@redhat.com>
Date: Tue, 2 Sep 2025 14:47:07 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250805: ampere: WARNING: kernel/cgroup/cpuset.c:1352 at
 remote_partition_disable
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Cgroups <cgroups@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 kamalesh.babulal@oracle.com
References: <CA+G9fYtktEOzRWohqWpsGegS2PAcYh7qrzAr=jWCxfUMEvVKfQ@mail.gmail.com>
 <hyqcffknmjwjuogoe4ynubs3adk47t2iw4urnpjscdgjjivqz7@b5ue6csrs2qt>
 <CA+G9fYvA=945et87Q=_c6b-TWjSBxy4H-X9iNsb1_Pj9GCXUaw@mail.gmail.com>
In-Reply-To: <CA+G9fYvA=945et87Q=_c6b-TWjSBxy4H-X9iNsb1_Pj9GCXUaw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N2RkWON02tzYerlMJNb9SLD_cUuzXsMkD7ZX6Tuy3ow_1756838829
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/2/25 6:58 AM, Naresh Kamboju wrote:
> On Tue, 26 Aug 2025 at 19:56, Michal Koutný <mkoutny@suse.com> wrote:
>> Hi.
>>
>> On Thu, Aug 07, 2025 at 01:57:34PM +0530, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>> Regressions noticed intermittently on AmpereOne while running selftest
>>> cgroup testing
>>> with Linux next-20250805 and earlier seen on next-20250722 tag also.
>>>
>>> Regression Analysis:
>>> - New regression? Yes
>>> - Reproducibility? Intermittent
>>>
>>> First seen on the next-20250722 and after next-20250805.
>> Naresh, can you determine also the last good revision? That would be
>> ideal to have some endpoints for bisection. (To look for any interacting
>> changes that Waiman was getting at.)
> Michal,
> Since this was an intermittent issue, I do not have a good end point
> of the bisection.
>
> As I repeat,
> First seen on the next-20250722 and after next-20250805
> and not seen after this.

If this problem hasn't been seen again after next-20250805, it is 
probably caused by a bug in one of the new commits that has since been 
fixed. We are not going to look further into this until it is reproduced 
again.

Cheers,
Longman

