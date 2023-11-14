Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F84C1FAF
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P820N7b/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699952158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2eptL0/hRZAJ5UVmQrsn8paC3yYwq6Vrl06QgAw1qU=;
	b=P820N7b/ffULunS0DhYiwscCj6WdLma7Ma8bCfkBFqjA0kO5oTeVd0HXZeEq1J+D2lt/6v
	gsUgmZ5Wgc4IZJ0MQ50uBDK6lcqHnMy7FfAA27UH/61b0e8T9Q27A9+ZflZSeSusAgYGRC
	Ur70eDdMvCJ5EsvmFV+foLb7xxNXdDE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-XCDkv6zzO1KzweoPKbiB3Q-1; Tue, 14 Nov 2023 03:55:56 -0500
X-MC-Unique: XCDkv6zzO1KzweoPKbiB3Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-408534c3ec7so35210435e9.1
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 00:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699952155; x=1700556955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2eptL0/hRZAJ5UVmQrsn8paC3yYwq6Vrl06QgAw1qU=;
        b=i9fWJr33kGPPKTjGwwmlpqB4Q9hB6JbcfIYG/hWzK9Zk35sZ5u1RdxUEKEVlWGmVe6
         KekjCYdbgKu4OKbNNNUaaU6ek7iH9A7QzOvU5lAv2NhkJEXiowL096lqn36CXrRa40jv
         rrEIPHLICsJJJin0TubswSWBvWCrUS4QZT6qoD+3IGJ3Zr+dlFZErPlhoduDn67Ugpes
         5GqMeVI56ZxYJlbQH6PCV7CcJlcYv6tY51quEoXXF9TCQs1r9iDEDVndk3H/lQQaWIqb
         lVdK6j1tz8nhnx2zW6ApOsFe8bftpRxdTUdCMUxkMVcrlEsMXrwCkhxd8zJPqx+NI/W1
         S/Kg==
X-Gm-Message-State: AOJu0YyDu4+naI3OF/WaqoDund/7yfP0Xr/G/XZM25EgWiZ+WyD7ilQ0
	a3MHYdApqNAYLUAYWY2EQ3LNlVKvilfKU4juT8g6mDrRiAapLwfg0K8MU6+drNSNkt5PETB9BaN
	30kgj+GELXA2/HpmbeEfmLcc=
X-Received: by 2002:a05:600c:4689:b0:406:53f1:d629 with SMTP id p9-20020a05600c468900b0040653f1d629mr7066889wmo.5.1699952155649;
        Tue, 14 Nov 2023 00:55:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwmxzArCE1yT7c6VWtUi4CeGvspYKMMRsTRuOyn603I9zaKES8gBzQS1aSNYvHBK4R3G7DMw==
X-Received: by 2002:a05:600c:4689:b0:406:53f1:d629 with SMTP id p9-20020a05600c468900b0040653f1d629mr7066871wmo.5.1699952155285;
        Tue, 14 Nov 2023 00:55:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003fe1fe56202sm10557897wma.33.2023.11.14.00.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 00:55:54 -0800 (PST)
Message-ID: <bafd23a9-81d4-4d3b-9fd3-10461cba6b89@redhat.com>
Date: Tue, 14 Nov 2023 09:55:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Incomplete stable drm/ast backport - screen freeze on boot
To: Sasha Levin <sashal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Keno Fischer <keno@juliahub.com>, stable@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
References: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
 <32a25774-440c-4de3-8836-01d46718b4f8@redhat.com>
 <9dc39636-ff41-44d7-96cb-f954008bfc9d@suse.de> <ZVJQxS6h_K73fMfQ@sashalap>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZVJQxS6h_K73fMfQ@sashalap>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2023 17:37, Sasha Levin wrote:
> On Mon, Nov 13, 2023 at 10:49:01AM +0100, Thomas Zimmermann wrote:
>> (cc: gregkh)
>>
>> Hi Jocelyn
>>
>> Am 13.11.23 um 10:36 schrieb Jocelyn Falempe:
>>> On 13/11/2023 09:34, Keno Fischer wrote:
>>>> Greetings,
>>>>
>>>> When connected to a remote machine via the BMC KVM functionality,
>>>> I am experiencing screen freezes on boot when using 6.5 stable,
>>>> but not master.
>>>>
>>>> The BMC on the machine in question is an ASpeed AST2600.
>>>> A quick bisect shows the problematic commit to be 2fb9667
>>>> ("drm/ast: report connection status on Display Port.").
>>>> This is commit f81bb0ac upstream.
>>>>
>>>> I believe the problem is that the previous commit in the series
>>>> e329cb5 ("drm/ast: Add BMC virtual connector")
>>>> was not backported to the stable branch.
>>>> As a consequence, it appears that the more accurate DP state detection
>>>> is causing the kernel to believe that no display is connected,
>>>> even when the BMC's virtual display is in fact in use.
>>>> A cherry-pick of e329cb5 onto the stable branch resolves the issue.
>>>
>>> Yes, you're right this two patches must be backported together.
>>>
>>> I'm sorry I didn't pay enough attention, that only one of the two was 
>>> picked up for the stable branch.
>>>
>>> Is it possible to backport e329cb5 to the stable branch, or should I 
>>> push it to drm-misc-fixes ?
>>
>> I think stable, which is in cc, will pick up commit e329cb5 
>> semi-automatically now. Otherwise, maybe ping gregkh in a few days 
>> about it.
> 
> I thikn it would be more appropriate to revert 2fb9667, as e329cb5
> doesn't look like -stable material. I'll go ahead and do that.
> 
Ok, that's the best thing to do, as Thomas also found that userspace can 
be confused by the new BMC virtual connector, so it's safer to revert.

Thanks,

-- 

Jocelyn

