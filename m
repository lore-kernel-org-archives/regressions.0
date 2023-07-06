Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605C7E9
	for <regressions@lists.linux.dev>; Thu,  6 Jul 2023 03:08:29 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-55b1238a013so203989a12.3
        for <regressions@lists.linux.dev>; Wed, 05 Jul 2023 20:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688612908; x=1691204908;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkswXhgVYLum5NAuYw9zYKn7kb93ZCamEnpThtSqHNc=;
        b=S3is4OStCcuBp9VXOE2UDwGY1EdZNPtDBNIShgNjO2ImugFGUKpwVRwPpSRa0+C6ee
         lvANFsMxW1CNYqXS0/WWuK7Y5+aiH4ZURb5ItUIinZOMeL4QgqyRlPCF9GuoIHmiIscu
         XPKcSvn6XDiu98lirHCA1rWuWmpdA07TLqsXU9tTYjunKKR6ArzdVNy+zjB584hwsTt3
         GUfD99svNOngxdn/SYf+WHgvY5io9RbYmwKo5RXDnZN3M+DHCx1+Y8mDPXQhVzqLBqmM
         5Fat7gJD0npAwHt3alPSauqFApN6RqU86demE4lm2grNV1dI8amc9YXEBSMlxM1koPSN
         PZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688612908; x=1691204908;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkswXhgVYLum5NAuYw9zYKn7kb93ZCamEnpThtSqHNc=;
        b=Ry+S6VoXrE+i234mC7ZAHw/h5iJcTf0mATebkOBbYPQWPU4+HBUn7FtU0cQVuLljrt
         0ldf23n5Mjj6kXnI0BgNHuq0dT8HxVGbFtFmlEg3ob8k5/6APoTYnRiNvGIss0WBS5wF
         2LUGo3y4Ete1EZmUMg1uk/5NV7s6GpwbVPZbTkXsOzKcBGNZp66IuBblduB8sNgb7XJ6
         SCEkZg8+FJKVqJqhUyQO5zqH86ZENVT8hXKbCsvjyr0XmRGeRv2p8vhyvbicFAZgrPFh
         4qlMsPRRhuEGb+6gCUq56Ix8kgC+C/4sjIkOW5+AVq+wEjdVYBzqVgQRxnnF1JpxzaO+
         r42A==
X-Gm-Message-State: ABy/qLbCeL5x2Gfxlbbz9i614AQ9fvcwx7rAs3yxif7uXcxI/5UEL2fO
	eIlNPMk+HkGLUI95MY/P1zM=
X-Google-Smtp-Source: APBJJlGylu/y1J6UmD5L0LCkDB3980SfnVTwY5UUOgqM0SRWc727bzWb5tomce3Ltd6cmX+TmhrHew==
X-Received: by 2002:a05:6a20:13d9:b0:12d:d379:6e6c with SMTP id ho25-20020a056a2013d900b0012dd3796e6cmr681861pzc.11.1688612908443;
        Wed, 05 Jul 2023 20:08:28 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x23-20020aa793b7000000b00673e652985esm220170pff.44.2023.07.05.20.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 20:08:27 -0700 (PDT)
Message-ID: <50f4c10d-260c-cb98-e7d2-124f5519fa68@gmail.com>
Date: Thu, 6 Jul 2023 10:08:20 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: 3 more broken Zaurii - SL-5600, A300, C700
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dave Jones <davej@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Ross Maynard <bids.7405@bigpond.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux USB <linux-usb@vger.kernel.org>
References: <7ea9abd8-c35d-d329-f0d4-c8bd220cf691@gmail.com>
In-Reply-To: <7ea9abd8-c35d-d329-f0d4-c8bd220cf691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/5/23 09:09, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> The following patch broke support of 3 more Zaurus models: SL-5600, A300 and C700
>>
>> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad module alias from zaurus
>>
>> dmesg and lsusb output attached.
> 
> Because the description above was vague, I asked the clarification.
> The reporter replied:
> 
>> The problem is that networking to SL-5600 / A300 / C700 devices does not 
>> work. I cannot ping the devices.
>>
>> The error is occurring in zaurus.c. dmesg is missing the following line:
>>
>> zaurus 2-2:1.0 usb0: register 'zaurus' at usb-0000:00:1d.0-2, 
>> pseudo-MDLM (BLAN) device, 2a:01:39:93:bc:1a
>>
>> A patch was created in 2022 to fix the same problem with the SL-6000:
>>
>> USB: zaurus: support another broken Zaurus - 
>> [6605cc67ca18b9d583eb96e18a20f5f4e726103c]
>>
>> Could you please create another patch for the 3 devices: SL-5600 / A300 
>> / C700?
> 
> See Bugzilla for the full thread and attached dmesg and lsusb.
> 
> Dave: The reporter asked to write the quirk for affected devices.
> Would you like to create it?
> 

Thorsten: Email to the culprit author (Dave) bounced. What can
I do in this case? Should I start adding get_maintainer.pl output?

-- 
An old man doll... just what I always wanted! - Clara

