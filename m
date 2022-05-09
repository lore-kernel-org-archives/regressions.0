Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117831865
	for <regressions@lists.linux.dev>; Mon,  9 May 2022 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652093832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFrPs9L4di1vV1xZJqP9rzxBR1+UAeDEbQHD/bxvJ7Y=;
	b=VnsMMKuul/WaDHelV8z8/qWoq09dDLSb6qLOUtUbiNhDPKzkSp0W2HvKIORgOjhXw6PEwF
	XwIDbQ0LWBivmPax4QQeIgyPf9JWsxrlFmwv8dEd543US/ah0vwF8t08V+5rGaTnF8J4fc
	UgMfUAmZTr1EoVxdyCZixITcr8D1JVk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-icI49yjcMjGOL4AT13L-Zw-1; Mon, 09 May 2022 06:57:09 -0400
X-MC-Unique: icI49yjcMjGOL4AT13L-Zw-1
Received: by mail-ej1-f71.google.com with SMTP id re25-20020a170906d8d900b006f50701fbefso4227225ejb.23
        for <regressions@lists.linux.dev>; Mon, 09 May 2022 03:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EFrPs9L4di1vV1xZJqP9rzxBR1+UAeDEbQHD/bxvJ7Y=;
        b=Qbz+nyQAJAXZ2yHQpoIAMr/YhmhLXCHwYhOWpdUaQFFUCmpeQ6KZdlDTOrlqi2hfFC
         O+sIvRSAKXGXUVYOUusJNN96bX3Kb3TWz79GnFr9hr79OXkz/jSEU/A2MIpTyB4Mq85d
         CccxmYEh5nI4OHk3RpFuT2Ym/rqk/UqjpG+qvLaIjW49gog0cGKqAyo1FvBdaZ9Dns6f
         yFr4xseE5/zKQ4nzbg/jh54mrDVgo3O/YBZj6FjD5qeh/65YabJ/WO4MciUBNJK1pDsg
         8mgkuW9dg1lge4bHbrCpW7OUsfhSXwmLha8Xogyou0pMYzGHN2ZhteAezjOjXw6Dbium
         vFIg==
X-Gm-Message-State: AOAM532+b2AGxIjk3XMcJXiQhhJwYmm50vaB+5RkGDLSupYe18a9yf7n
	/GjAB4d5sXDIQDewKuPlzO4PYMAREoxi/Wp2sHpFF3ZKD9jdqaLvhvHdRPo+Zq8Gwz908nzvlMW
	61Gxp3Z8kc33LIkkUwrzyNvc=
X-Received: by 2002:a17:907:7da7:b0:6f4:f92b:3986 with SMTP id oz39-20020a1709077da700b006f4f92b3986mr13581740ejc.50.1652093828684;
        Mon, 09 May 2022 03:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR2LyN1sGr/ku45VLAMUVTF9Djf8FtshH8TyrOMtMCisUpjWy4B6l9l3wolcFcqotZ7FxfuQ==
X-Received: by 2002:a17:907:7da7:b0:6f4:f92b:3986 with SMTP id oz39-20020a1709077da700b006f4f92b3986mr13581728ejc.50.1652093828504;
        Mon, 09 May 2022 03:57:08 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d904000000b0042617ba6385sm6150956edr.15.2022.05.09.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 03:57:08 -0700 (PDT)
Message-ID: <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
Date: Mon, 9 May 2022 12:57:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zack,

On 4/11/22 16:24, Zack Rusin wrote:
> On Mon, 2022-04-11 at 10:52 +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Fedora has received a bug report here:
>>
>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=04%7C01%7Czackr%40vmware.com%7C3664ddfe25334b16109108da1b98a6af%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637852639719382480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GpkMy6OuPW06f%2Fzj%2FBGzoq8xT8pNsE6KtH0MTvN5FoA%3D&amp;reserved=0
>>
>> That Fedora rawhide VMs no longer boot under the VirtualBox
>> hypervisor
>> after the VM has been updated to a 5.18-rc# kernel.
>>
>> Switching the emulated GPU from vmwaregfx to VirtualBoxSVGA fixes
>> this, so this seems to be a vmwgfx driver regression.
>>
>> Note I've not investigated/reproduced this myself due to -ENOTIME.
> 
> Thanks for letting us know. Unfortunately we do not support vmwgfx on
> VirtualBox. I'd be happy to review patches related to this, but it's
> very unlikely we'd have to time to look at this ourselves.

I somewhat understand where you are coming from, but this is not
how the kernels "no regressions" policy works. For the end user
a regression is a regression and as maintainers we are supposed
to make sure any regressions noticed are fixed before a new
kernel hits end user's systems.

At a minimum it would have been good if you had tried to at least
reproduce this bug by installing Fedora rawhide inside an actual
vmware VM. I've just spend a couple of hours debugging this and
the bug definitely impacts vmware VMs too; and thus very likely
also reproduces there.

I've a patch fixing this, which I will send out right after this
email.

Regards,

Hans


