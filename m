Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF881A587
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F1H6RaO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699868166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwJZ0Xbnvhf2lf2q1QxNyLQ6WK9A/m8KvfH5CYCBO3M=;
	b=F1H6RaO8XZa3i/9AlgkeUbLMNsZ56odVzPkZHLDxvGYITYMN9QLFReCxUiyr22rnOXkqN2
	umY7DwmLcBdRY5dQ2TxxfBqGsRrzCVJz4muV1jbFvougNcEJOLjTR1Mp1405aBjZA11ddx
	BKMreKI4UhsAQFf4qMKg6IpcD6H4Uf8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-wM76CdFFOnSnz_4MlmHtNg-1; Mon, 13 Nov 2023 04:36:05 -0500
X-MC-Unique: wM76CdFFOnSnz_4MlmHtNg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32fa25668acso2041851f8f.1
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 01:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699868164; x=1700472964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwJZ0Xbnvhf2lf2q1QxNyLQ6WK9A/m8KvfH5CYCBO3M=;
        b=ok2+1r0fnYTkVgCI9lqlSd4qUNKsPUNQXXHHBRSAq7iWrtsn7Rb+8gN2ajp9p5hrOO
         pn2a/xuQfQjAFCVk58prrzxl85FP6+UBYB2zCoUtvnUtp+A22rvzc6qA2SSnHILWDdw8
         Y7F8gtbcDNbj4kXVToMHuuar9n2UIK9vteNkrCx+mFeOstSX8FTF3U5iIz2iMMEZISUK
         EOTHlobKNDE7QVM0Hbne/ntqmckm3SvHIXH7ARhLuTG86nmv8tZ7FaxI/U4zpXAvSNbM
         qafuPGmsg63gu0P02WqfFccBotuG6egTLeU8GJSwdf7hUkWnXqFcucOi8j8J51vJJQs6
         AEiQ==
X-Gm-Message-State: AOJu0Yw2/bhn3v3+wlHNBZFBmwnsp2OtlO9OhEYilbFpKW0TTSAD3f6Z
	XnOrVa1ub17Oh12tCY4BCSpJM1YLvQJ/JOCd4QzxCXURnwe2kTlbqzomfpF0mfrR3YSU0le+wxY
	5XvjAhznlCmxg4HwI+vryldc=
X-Received: by 2002:adf:d1c8:0:b0:32f:7d21:fd82 with SMTP id b8-20020adfd1c8000000b0032f7d21fd82mr3475734wrd.51.1699868164022;
        Mon, 13 Nov 2023 01:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLGAlllr6+af01I7oixb2AlnKzkAe+EmipQrO095UcddK3SovOFEQ7UX3I/6FEprbQxEmEuQ==
X-Received: by 2002:adf:d1c8:0:b0:32f:7d21:fd82 with SMTP id b8-20020adfd1c8000000b0032f7d21fd82mr3475721wrd.51.1699868163726;
        Mon, 13 Nov 2023 01:36:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id dn17-20020a0560000c1100b0032db1d741a6sm4729165wrb.99.2023.11.13.01.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 01:36:03 -0800 (PST)
Message-ID: <32a25774-440c-4de3-8836-01d46718b4f8@redhat.com>
Date: Mon, 13 Nov 2023 10:36:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Incomplete stable drm/ast backport - screen freeze on boot
To: Keno Fischer <keno@juliahub.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, sashal@kernel.org, tzimmermann@suse.de,
 airlied@redhat.com, dri-devel@lists.freedesktop.org
References: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2023 09:34, Keno Fischer wrote:
> Greetings,
> 
> When connected to a remote machine via the BMC KVM functionality,
> I am experiencing screen freezes on boot when using 6.5 stable,
> but not master.
> 
> The BMC on the machine in question is an ASpeed AST2600.
> A quick bisect shows the problematic commit to be 2fb9667
> ("drm/ast: report connection status on Display Port.").
> This is commit f81bb0ac upstream.
> 
> I believe the problem is that the previous commit in the series
> e329cb5 ("drm/ast: Add BMC virtual connector")
> was not backported to the stable branch.
> As a consequence, it appears that the more accurate DP state detection
> is causing the kernel to believe that no display is connected,
> even when the BMC's virtual display is in fact in use.
> A cherry-pick of e329cb5 onto the stable branch resolves the issue.

Yes, you're right this two patches must be backported together.

I'm sorry I didn't pay enough attention, that only one of the two was 
picked up for the stable branch.

Is it possible to backport e329cb5 to the stable branch, or should I 
push it to drm-misc-fixes ?

Best regards,

-- 

Jocelyn

> 
> Cheers,
> Keno
> 

