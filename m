Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51F54648
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727938885; cv=none; b=GfUTAKxWI+tTMJaRt38mU8LaU2Et/S8EPh7+hQFn39mT5ShK4k/n1xKWjC7zP+mzBL/cL1FdFR16T0AGxMM+P3SA0kNAY5oQcuq+jHcYbT5OngOft8j4E3zqVlCA4aDfx9RCE792gng/qApxf0D8Xw/MbaQLkyRwaCBx6FK03KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727938885; c=relaxed/simple;
	bh=ArbjUydtmGlo5b1ehyfK+5eOMTPBVWa9ApNJGz3Qu5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBaSap2GUGL3VxEVIRiBlgl8D6axQ+mR0Z/xU2ogletDUHh1sZr4s7yqawbP2OBh6VpkdTm2oFUVHTHGRFIq+XlVDnViVH/Y+q5MdrCiilOWZQPQP1KGTl2oiP67FufuiYGdQ1MdNquq7BtBnIf6oajpBdcy9VPONGcxw7NVn1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/HdHnao; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/HdHnao"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d4979b843so71775066b.3
        for <regressions@lists.linux.dev>; Thu, 03 Oct 2024 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727938882; x=1728543682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yeFU/LyDTmhZuy175QMgG/UWC/hjLY8mwcwo3xYsGbw=;
        b=R/HdHnaoNUS0DBqeO5lJrpLJJ3TEkbTo51iWbf1mgExgsQ5CC+6q7xbny9XVekQECa
         W4zCnM44v+UWAcUaYix3/6WGeQTAJbpxduA6SVzdrLemLzYkL6mNTARzJUFqGu+YgSGr
         zTSMRurZXCrnjDT0dZU47qDfEQWLUp/NgGz8IPoWnYLaB7/YWH2qW+shoPKgrz1ITsBF
         c8jdhQ7BxpePb0zNLu+Cq6HGIee3txj72qQAZaNje4o4pI+vBrcx0m7Q3rJXg9KpJ5TP
         /r+a6+mX3UZqSqdIErV5IIYbsXMzO+FnRWiDg9YbfpVqphcH/kls2WdhnxPdOdKPOP+w
         a1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938882; x=1728543682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeFU/LyDTmhZuy175QMgG/UWC/hjLY8mwcwo3xYsGbw=;
        b=KOJcEx///42D/QkQUo1+wG7mqHXzdWDZsy2j8lDtzHHUvCtORqajYbE1j3kbrg5PUm
         ZLMp2eTo/CtQQFYFo5qD9jNr/7Epc8M3SDeo7aOh5/c+PKP3WTsCIUUn3+Re687UHq8I
         Y9O59561bsZv+y8wWkT6B1g7WHPba0nWgOk1b6Np9f7CDNvCpfpFTbFVrPEOw47ELRu6
         kdmwoVWnroWuOYBXlH3vHTRu8KdeLJLQxQhMpuBTrs5iHh2sq+jDzzlwhPodQT4V02Fd
         anlv1r7pZannM7pKh8n5Qi6kFjVDo6k2vpVtWUCGtLyNEud6vO4ZKdTn4ewHJNxy/MfU
         I1sg==
X-Forwarded-Encrypted: i=1; AJvYcCVtDYTOEegB2x7KCTuC6uZDxBUr1RdomPf21wMfsgMtC0hiswrpTRk+arfFBtHBz8RQ43ZQslzR6/puMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjujlWFHQumGAJXjEj+DuNzyFdaXEW5y9sHPFNc8aCuQlas9yW
	WQqygfbEPY9RW1DcEtuyMOru9om8Z5xv1XWeOAnBn6QcbsbqDY0y
X-Google-Smtp-Source: AGHT+IER3VyW3n6ywREaiId2g3zAK8SXUqTp9Fta4Nf0MTIrzOUDcBEsds5SS13sKcJoxzc3Tta5gg==
X-Received: by 2002:a17:907:3e1c:b0:a8d:caa:7ffb with SMTP id a640c23a62f3a-a98f82618f9mr481463566b.29.1727938881654;
        Thu, 03 Oct 2024 00:01:21 -0700 (PDT)
Received: from [192.168.1.64] ([91.231.32.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910473a94sm41072866b.169.2024.10.03.00.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:01:21 -0700 (PDT)
Message-ID: <389d8a20-835e-4541-892a-ea9ffa59d320@gmail.com>
Date: Thu, 3 Oct 2024 09:01:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libahci driver and power switching HDD on newer kernels
Content-Language: en-US
To: Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-ide@vger.kernel.org
References: <7882faa8-d5ec-4868-b158-0b942b669cc0@gmail.com>
 <c4f1c690-6e97-44de-985f-dc9eadd18d23@leemhuis.info>
 <c7880a6f-04d4-4572-9255-1575f6668b4e@kernel.org>
 <a0c34406-3bb3-4880-9513-0876aacd4de6@gmail.com> <Zv25MQWh-1yYAcVC@ryzen.lan>
From: W <linuxcdeveloper@gmail.com>
In-Reply-To: <Zv25MQWh-1yYAcVC@ryzen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 2.10.2024 o 11:20 PM, Niklas Cassel pisze:
> On Tue, Sep 24, 2024 at 12:42:10PM +0200, W wrote:
>>>
>>> Given that you had 6.4.12 working OK, it is likely some commit that introduced a
>>> regression. If you can git bisect it, we will have a better idea how to remove
>>> the regression.
>>
>> Please take a look at bugzilla report:
>> https://bugzilla.kernel.org/show_bug.cgi?id=219296 - there are the details.
>>
>> I'm wondering what is the better way for communication - here on mailing
>> list or put the comments in bugzilla ticket?
>> Probably here will be better idea...
>>
>> W
>>
> 
> Hello W,
> 
> Could you please try the following patch,
> and see if it helps:
> 
> 
>  From dba01b7d68fffc26f3abf3252296082311a767a0 Mon Sep 17 00:00:00 2001
> From: Niklas Cassel <cassel@kernel.org>
> Date: Wed, 2 Oct 2024 21:40:41 +0200
> Subject: [PATCH] ata: libata: do not spin down disk on PM event freeze
> 
> Currently, ata_eh_handle_port_suspend() will return early if
> ATA_PFLAG_PM_PENDING is not set, or if the PM event has flag
> PM_EVENT_RESUME set.
> 
> This means that the following PM callbacks:
> .suspend = ata_port_pm_suspend,
> .freeze = ata_port_pm_freeze,
> .poweroff = ata_port_pm_poweroff,
> .runtime_suspend = ata_port_runtime_suspend,
> will actually make ata_eh_handle_port_suspend() perform some work.
> 
> ata_eh_handle_port_suspend() will spin down the disks (by calling
> ata_dev_power_set_standby()), regardless of the PM event.
> 
> Documentation/driver-api/pm/devices.rst, section "Entering Hibernation",
> explicitly mentions that .freeze() does not have to be put the device in
> a low-power state, and actually recommends not doing so. Thus, let's not
> spin down the disk for the .freeze() callback. (The disk will instead be
> spun down during the succeeding .poweroff() callback.)
> 
> Fixes: aa3998dbeb3a ("ata: libata-scsi: Disable scsi device manage_system_start_stop")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   drivers/ata/libata-eh.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
> index 3f0144e7dc80..45a0d9af2d54 100644
> --- a/drivers/ata/libata-eh.c
> +++ b/drivers/ata/libata-eh.c
> @@ -4099,10 +4099,20 @@ static void ata_eh_handle_port_suspend(struct ata_port *ap)
>   
>          WARN_ON(ap->pflags & ATA_PFLAG_SUSPENDED);
>   
> -       /* Set all devices attached to the port in standby mode */
> -       ata_for_each_link(link, ap, HOST_FIRST) {
> -               ata_for_each_dev(dev, link, ENABLED)
> -                       ata_dev_power_set_standby(dev);
> +       /*
> +        * We will reach this point for all of the PM events:
> +        * PM_EVENT_SUSPEND (if runtime pm, PM_EVENT_AUTO will also be set)
> +        * PM_EVENT_FREEZE, and PM_EVENT_HIBERNATE.
> +        *
> +        * We do not want to perform disk spin down for PM_EVENT_FREEZE.
> +        * (Spin down will be performed by the succeeding PM_EVENT_HIBERNATE.)
> +        */
> +       if (!(ap->pm_mesg.event & PM_EVENT_FREEZE)) {
> +               /* Set all devices attached to the port in standby mode */
> +               ata_for_each_link(link, ap, HOST_FIRST) {
> +                       ata_for_each_dev(dev, link, ENABLED)
> +                               ata_dev_power_set_standby(dev);
> +               }
>          }
>   
>          /*

Hi Niklas, Damien and others,

Niklas I applied your patch on:
commit 9852d85ec9d492ebef56dc5f229416c925758edc (tag: v6.12-rc1)
and gave it a try.

I have done 2 cycles of hibernate/wake_up and in both cases it worked 
fine so the HDD is not powered off and then powered on.

W

