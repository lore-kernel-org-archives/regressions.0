Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312A2C9D
	for <regressions@lists.linux.dev>; Fri,  3 Dec 2021 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638530429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCEoUW7+u756imTky0jSFPok8S0L4DifBezJf8rr5n4=;
	b=PuS6xFLxV1vCf/2kAn99xhjNTYMHbJO95+YgxuqiWzRXiP3/g3t9TNP/O9pBORi5NbGdNf
	i786d9QN9f7IRte6OldhBEumTNRfVHymOI72iykO8de2uX13jAlNzx7DJQou+OxIF0lv6r
	DrMuasb/H1Pq1Y9D3QAECJWgxZOStF0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-YnBlVXtiP926QrK9Te5OOw-1; Fri, 03 Dec 2021 06:20:28 -0500
X-MC-Unique: YnBlVXtiP926QrK9Te5OOw-1
Received: by mail-wr1-f69.google.com with SMTP id v17-20020adfedd1000000b0017c5e737b02so533915wro.18
        for <regressions@lists.linux.dev>; Fri, 03 Dec 2021 03:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TCEoUW7+u756imTky0jSFPok8S0L4DifBezJf8rr5n4=;
        b=S+IzwBUh/HOFAPNr9+NZUod9OFSn7BOYDK6cP+N4MFe6ylXf7WY5F6H31aFKidXr6A
         7pNEgXU9/PTLfQe10VAPfkbdmbQbCWwiq+dPsY4uY8dVx1tkghZmacqexgSqB8bfztqM
         idkXIp2pabb1BVB6h3WO1XK8OdU/3C0uYo2AkGaHKQS9ourMb9IGwdEEhZ3Wx+til5jQ
         xaFVyTjdFdQF5PbiNTamKubof8jLBUArMeRTMGp9P+lU9P8tCo8eUKa4qfakh+g60bO4
         NEC6Pmh3Gfjtt5YgKLffZFIgNU4j8HY55+okj0IDhfMcH47woFJmWwzc4lXbrBSzXi2Y
         vkOg==
X-Gm-Message-State: AOAM533S5PdrWzxNet+aT+2NBTy2zRmtPZlQ5K+203aftQfRayhrbhqV
	NJH+eQDvFcbEyy6BIYC55pHo5xzC/o46KfRQIjQ0Hf+RwXE8VFYZfVhHqq7/iH64o6/Ol9+MK7N
	Anf++0gMrojgSJqf3aodzY9k=
X-Received: by 2002:adf:edc6:: with SMTP id v6mr21051554wro.461.1638530427173;
        Fri, 03 Dec 2021 03:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJM87rlYiWw2QEKek+Z+Eku0ybwl3FqjSXdx/b5RzJmEzD14yUo8rrlrytrDw1uCbfb3NIDA==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr21051531wro.461.1638530426960;
        Fri, 03 Dec 2021 03:20:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o12sm2667241wmq.12.2021.12.03.03.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 03:20:26 -0800 (PST)
Message-ID: <5de368f7-91cd-5998-9fe4-1bf448e32742@redhat.com>
Date: Fri, 3 Dec 2021 12:20:25 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: 5.15 regression: CONFIG_SYSFB_SIMPLEFB breaks console scrolling
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Harald Dunkel <harri@afaics.de>
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <e50d5ad5-19fd-07ae-41e4-5a2d26a98bcf@afaics.de>
 <4bf94684-6410-db9f-5bec-ea0540a2ea76@leemhuis.info>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4bf94684-6410-db9f-5bec-ea0540a2ea76@leemhuis.info>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry for the late reply.

On 11/21/21 12:47, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 16.11.21 05:52, Harald Dunkel wrote:
>>
>> if I enable CONFIG_SYSFB_SIMPLEFB in 5.15.2 and use grub's default
>> configuration
>> (Debian sid amd64), then a few lines at the bottom of /dev/tty1 including
>> login prompt are off-screen. Scrolling is broken. I can login, though.
>>
>> Enabling GRUB_TERMINAL=console in grub doesn't make a difference. Using
>> the same kernel except for CONFIG_SYSFB_SIMPLEFB the problem is gone.
>>
>> Graphics card is a GeForce GTX 1650. I tried with both CONFIG_DRM_NOUVEAU
>> and proprietary graphics drivers disabled.
>>
>> Attached you can find the config file. Please mail if I can help to track
>> this problem down.
> 
> Thx for the report. I'm not totally sure if this is a regression, as
> that's a new config option. But it might be one considered a successor
> to an older one, hence it might count as regression. Adding two
> developers and a mailing list to the CC, hopefully someone can clarify.
>

I don't think this is a regression since enabling CONFIG_SYSFB_SIMPLEFB will
make the simpledrm driver to be bound while disabling the option makes the
efifb driver to be bound instead.
 Yes, it seems to be a bug in the simpledrm driver but the solution if you
have issues with the simpledrm is to not enable CONFIG_SYSFB_SIMPLEFB and
keep using the old fbdev driver.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

