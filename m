Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA81FBE6
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 15:41:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40078c4855fso49039055e9.3
        for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694446866; x=1695051666; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjYmrJjsl3SfHGvoNU0kb/uDqmnjfKb3l9GQBiI06J8=;
        b=V5sw1/qLlHqYSTVkHJBTjYM4KxGgNKhv4ChGMgioKZ0CQsAq2rYZbBjTJEjZ2MgHCc
         z/tHy1+2cgGknMmiDVAUMhRWwbK0Bxeb2ajXIfxG3uDHuUL4X94GC8x4EC3h7p4scNDR
         vhBUXWAQC00J14tldhVwm9pdM0duqDFxfOCFNVJIk9uuuwAuExrALKatNabYWoUToAjy
         8VTWPe7/LvsQFYI1tr5tDX5x/L8IHpymiSzaVRam3VH+vCjIaTwNpkkb3uWlvCr/GIyg
         ub0JL599NW3sI2dmo4jMcGqnnK9b9YxIVXerSb0lyAK9bQYDN3nYoWcTPE3k0JppBET3
         IXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694446866; x=1695051666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjYmrJjsl3SfHGvoNU0kb/uDqmnjfKb3l9GQBiI06J8=;
        b=etZQ9kF+l5FjkigfvCVVQBItvXBo3i0UJBU9I0FhuonBnko5TQwYk+TGga/SWhFn/e
         bh5jABJaMo0pYJUqP0Al0ec0EBZgdSJiHZzan3j7e+1BGPETH5IyiEXslxdZRgyVlU3W
         KYZ2hyzkkvfr0MDag5ThBImH/RmRa+EhHeo50Xml6sgIe69ICPnoXpGQZocEIArZw62i
         4WcjayWtiL8Vl/i3kBw3kExkak9jnSAHAahhN5hWMv9ucOpJyQOcjzDlmt34uqD7G3iM
         KQZnySshFwkSvw6Y7E4uDuBnq/k4a/RKn/0L+JkPONswNxh7689iXjUZBdmSFdhKY6h/
         wrNw==
X-Gm-Message-State: AOJu0YyFeUZyY34BDr6Dn2qEqt4NwPHfwmIf22AGMtvv/ZwttSydOfGj
	4oApfeeKCVcgW/n+uFW+dfmhd9EOCpPucJas
X-Google-Smtp-Source: AGHT+IHqM56dQ32aWlcm6F2LZfsLKJXjEIHqvYDsPQJPafx7d0FZvNKolx5YuHnCIio6rpzeuXmtnw==
X-Received: by 2002:a7b:c042:0:b0:401:38dc:8916 with SMTP id u2-20020a7bc042000000b0040138dc8916mr8227931wmc.10.1694446865465;
        Mon, 11 Sep 2023 08:41:05 -0700 (PDT)
Received: from [192.168.1.103] ([185.8.197.9])
        by smtp.gmail.com with ESMTPSA id fl12-20020a05600c0b8c00b00402f745c5ffsm10372450wmb.8.2023.09.11.08.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 08:41:05 -0700 (PDT)
Message-ID: <c766f724-709d-42c1-b0eb-a7a543d28bd6@gmail.com>
Date: Mon, 11 Sep 2023 17:41:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible nvme regression in 6.4.11
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Genes Lists <lists@sapience.com>, Ricky WU <ricky_wu@realtek.com>,
 Keith Busch <kbusch@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "sagi@grimberg.me" <sagi@grimberg.me>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "hch@lst.de" <hch@lst.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <5f968b95-6b1c-4d6f-aac7-5d54f66834a8@sapience.com>
 <ZN050TFnKZ54LJ5v@kbusch-mbp.dhcp.thefacebook.com>
 <30b69186-5a6e-4f53-b24c-2221926fc3b4@sapience.com>
 <570d465a-7500-4b58-98f0-fd781c8740cc@sapience.com>
 <ZOZEwafA8+tknJNT@kbusch-mbp.dhcp.thefacebook.com>
 <7cf188d0-77b4-4e80-8da6-2045a7f29866@sapience.com>
 <180a2bbd2c314ede8f6c4c16cc4603bf@realtek.com>
 <903830f8-9f9a-4071-9ced-761a55018c5a@sapience.com>
 <97cee217-e438-4fff-836a-186f59d6d256@sapience.com>
 <fa82d9dcbe83403abc644c20922b47f9@realtek.com>
 <5d38cf11-114a-4997-a0fc-4627402468f8@sapience.com>
 <d544fac1-ed2b-4417-8edd-1a81ed8a41d6@leemhuis.info>
From: Augusto Zanellato <augusto.zanellato@gmail.com>
Autocrypt: addr=augusto.zanellato@gmail.com; keydata=
 xjMEZCx4GxYJKwYBBAHaRw8BAQdAzs3qNoRVWI59ACofZ+2FP0XVrKXcrRfYi3Xx/hdJTD7N
 L0F1Z3VzdG8gWmFuZWxsYXRvIDxhdWd1c3RvLnphbmVsbGF0b0BnbWFpbC5jb20+wo8EExYI
 ADcWIQRnOxq9z5pFgCWryKMFxh3iHhl5WAUCZCx4GwUJBaOagAIbAwQLCQgHBRUICQoLBRYC
 AwEAAAoJEAXGHeIeGXlYmMkA/2/c5wdsNA+3y88FFwa5V9l9HJzpJD+nWeL64xakeqdAAP4q
 vg0/NOcUpbnpqZErpTV0eIaylMusdNX7yZ//esUCDs44BGQseBsSCisGAQQBl1UBBQEBB0Cp
 5irXwYE8Jp0e5N34LQc2MiiJ5MRPeAMMe1RddSpcYAMBCAfCfgQYFggAJhYhBGc7Gr3PmkWA
 JavIowXGHeIeGXlYBQJkLHgbBQkFo5qAAhsMAAoJEAXGHeIeGXlYyIQBAJ58AJfxKmn/XFjW
 YU4T0cI/FhDGsDktTghE06r4RDCDAP9lyXA3dJTRhscI0IbQQQq2hGoMv+9u+3nOJQDlpP1w Aw==
In-Reply-To: <d544fac1-ed2b-4417-8edd-1a81ed8a41d6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm also experiencing the issue described in this thread, just wanted to 
chime in with regards to

> Anyway, 6.4.y will likely be EOL in a week or two. Which bears the
> question: are 6.5.y and 6.6-rc1 working better for you?

I can confirm that the issue is still happening and preventing correct 
boot on both 6.5.2 (Arch Linux package version 6.5.2.arch1-1) and on 
6.6-rc1 (Arch Linux package linux-mainline built from AUR).

For reference: the affected machine is a Dell XPS 15 9560 with the 
latest firmware revision (1.31.0) as of time of writing this email, the 
NVMe drive is a Sabrent Rocket4 1TB drive, but the issue also happens 
with the OEM provided Toshiba XG4.

Thanks,

Augusto


PS: it's my first time here in LKML, feel free to tell me if I did 
anything wrong :)


