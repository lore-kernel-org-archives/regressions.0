Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000817CD
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688976757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fv53BGFeIRXnhHK8MChLbwdnTLnz0IWizm/BeA0NY/c=;
	b=XH9uYbT3q2SWmxk094YxW/+pdqBeVOCw4cnJQsJ12PPPHznj+/ySKfigqUJH6yc8RZZbLx
	s5cvgYKfykOUS7fEmeJxLdaiKOdWRQpFTJrDIWcOKapmw6s3XbGASICEKFfwvjYBD+gzX2
	XDu1uTJfm3ki+9+fvp5+WTldJmmrSfg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-DWv-CddBM_CLNwlj0NsrGw-1; Mon, 10 Jul 2023 04:12:36 -0400
X-MC-Unique: DWv-CddBM_CLNwlj0NsrGw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-315998d6e7fso550448f8f.3
        for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 01:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976755; x=1691568755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv53BGFeIRXnhHK8MChLbwdnTLnz0IWizm/BeA0NY/c=;
        b=mEUvkuycwIHsQBYkae4gWy0B4+8lz6j6x9pu0HLlZ/+PTl0otlHfcRlD8CT0JJJKdJ
         xmEnklz4gwXCRK5PO+KQq6Utj8wlIPYmjFygoNLPFAMgX/OWAqkVYHfMhfDbeXO9vHqD
         LgdnTHMKF8i5kF5/nYpOUbxwYwS23wspqbYYNhYRKN+i0r87/qmhemjvlHXsH/peGrGi
         3OjbRswQ9mZNb/N1Zgi/ZTUXQiMeJ34vm0O3pSqGbzD5iH/cMwMxuVUwYphSD51X8Qha
         wQ0FmUGM9/kcrs+dSHzQpQFaNh+h5nViyZVC9TxVm9d1fBmg+3fVuvWJL4FdxjbDJ3b7
         fS/A==
X-Gm-Message-State: ABy/qLZ+Zm1wj29DAZSpgCrRnug5cgefhQCaDD4CGNUT//FIKdxNKtpK
	U04S+wE7kknR+is+g7GGKILN+Cbbiswd4V1Ae5ahGkyUggciboP0aiwJ5pjuKnVVrL2aDmS0YV3
	CdkH7jGgX0FPo9PSUrXXeqFSzhDbEGEsOt7Zwwq1lZNzsW/JFy7dUQHOiClELIufmNxIllT3Wbp
	FXn8b1uk4=
X-Received: by 2002:a05:6000:1b08:b0:314:1b6a:a095 with SMTP id f8-20020a0560001b0800b003141b6aa095mr9636512wrz.23.1688976755435;
        Mon, 10 Jul 2023 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFE+Ha5XzKKRXOguNpZE4bn/UbVPSJzAM4VbcDyv7HcjDbYhX6RcdcK8chbam/7D8j7m0JLyQ==
X-Received: by 2002:a05:6000:1b08:b0:314:1b6a:a095 with SMTP id f8-20020a0560001b0800b003141b6aa095mr9636488wrz.23.1688976755022;
        Mon, 10 Jul 2023 01:12:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id n12-20020adfe78c000000b00314367cf43asm11012165wrm.106.2023.07.10.01.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 01:12:34 -0700 (PDT)
Message-ID: <d4ca4cab-fed3-0b3e-5563-800bed43e5b2@redhat.com>
Date: Mon, 10 Jul 2023 10:12:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/ast: report connection status on Display Port.
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20230706100102.563458-1-jfalempe@redhat.com>
 <62460153-04b1-b1aa-7966-45be16f3ec43@leemhuis.info>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <62460153-04b1-b1aa-7966-45be16f3ec43@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2023 15:03, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 06.07.23 11:58, Jocelyn Falempe wrote:
>> Aspeed always report the display port as "connected", because it
>> doesn't set a .detect callback.
>> Fix this by providing the proper detect callback for astdp and dp501.
>>
>> This also fixes the following regression:
>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>   EDID on DP")
>> The default resolution is now 640x480 when no monitor is connected.
>> But Aspeed graphics is mostly used in servers, where no monitor
>> is attached. This also affects the remote BMC resolution to 640x480,
>> which is inconvenient, and breaks the anaconda installer.
>>
>> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> So if this "also fixes a regression" how about a Fixes: tag and a CC:
> <stable tag to ensure this is not only fixed in latest mainline, but
> also in all affected stable and longterm kernels?

In this case, the regression only affect one userspace program 
(anaconda), and the fix looks too risky to backport to all stable kernels.
I've to prepare a v3, as this one breaks on hardware were there is only 
one Display Port connector and no VGA connector.

> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 

Best regards,

-- 

Jocelyn

