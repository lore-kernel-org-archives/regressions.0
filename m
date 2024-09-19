Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2B1A0AF8
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726764835; cv=none; b=IETAP+ckUcBOn8ZdQFte1kYlQV9XenDnVi70ic7KMEZSU02zEgIOnmpYeshvS9PAifPiqtYHcstnUzlUffaNx8Q39Wx0natWFZ/tt4fhULLX/iUmmEGSNUJrDVFz3HPWOgc+PQmObAPezaluAsTvR32a2LABoDw35CyzsuL2cO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726764835; c=relaxed/simple;
	bh=bn6oGPW58fPqNoeG/yyMk8vFqMKMBG4u8Nq13neeEYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAdJiOwtqMU2J8uA76WJsqhaNBMdavUFWgU5whCjA3ia0xEIDlaQW0N+gCMD4yl1glj0UdiD/JGQlXGItcFOKcEfJgLgf5CDBgPZhsheikSMPGGGv2m22rvFGvtmqY8dGI75PcTRbSdImUPNDCHb8nV566U65oNDdhe95dkZJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B0XiLJN9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B0XiLJN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726764833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2+TSii+mHfEEe1HaRRA9cI1yQ4z2lktV77MXNOhxqM=;
	b=B0XiLJN9SRperVmt4TauEkDL9c3SWkQ6tH5RC7gR1AeRtQ+NEed9Y5WOIUxwWn386BaCzO
	3Vr9+Y2xROjo/8SnOp+t5ZGFeSCy85d7TKHDuLw/epqViqhmIB6zjoRg7I7o/S+GumHfev
	orXAVzemtjhNtv39bvnF2UgUdBWpPjo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-kxj5poFNMPCB79c5sfj0zA-1; Thu, 19 Sep 2024 12:53:49 -0400
X-MC-Unique: kxj5poFNMPCB79c5sfj0zA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8d13a9cc2cso76850966b.3
        for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 09:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726764828; x=1727369628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2+TSii+mHfEEe1HaRRA9cI1yQ4z2lktV77MXNOhxqM=;
        b=CuoVDauRSEEABBFpobpuiLDAlrdb0iK3/C2q+iOSRs7SMjibFg01zb/PJrrZBiJ32s
         U87W2ml+NpCiqYek4rEC7Q7xOYAu02kKg/WRkT7T/DGSsD5Vsbfa6K/f8f4CAyqQJlry
         kPYPAwvJQhxBMbQiw63QKe/05JACaCuV+rA75BaKySDvVzvlsgbHbr09Dyxnk7VZZxRu
         yMkeCznJLppV0SxE2esEIpwO4HU2ZaH19PGZCs43/TEEy7PvFRYOMNQc2S12rnGyoAFd
         pNt/+e/SIxy4bLCdvS8DfrZPegmyYY97/tFaY6zbo4puUp6qyULD6/rmf/tcqHfuEueK
         S+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPpLwT1EyfHk2MOBlO8a4HLMYJTm4scZIu5W4OGxWVj4wRkvQNRlWXbnzJx2nmsIfraHZzDBXFGkZdUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkqEFxlTU+XNLakFFua+TRwU/LO6ovFN4UuA61GEIOxHzz4k1p
	4q6GEUuvhnGI3IZTAxVo0qUnfMoSqqPlp6f3/M+8aK83MEK9RbJEz9fXC08pQ+JusGHSn3XMq7p
	zPSReRaKHbtz3QJIxVOxVk8HRQ5WOj7Hso9Td2ECW0z04I0hmtAA++bvNcwQH
X-Received: by 2002:a17:907:e29a:b0:a8d:4631:83a9 with SMTP id a640c23a62f3a-a90293dc171mr2515035466b.3.1726764828480;
        Thu, 19 Sep 2024 09:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEv/8VjZJXFjJAjmj7AYnAhIpGt2wAk3Kqi2ZF3yBVwUInfkzT9Qd+2XBRJvysfsZ7E4eHCw==
X-Received: by 2002:a17:907:e29a:b0:a8d:4631:83a9 with SMTP id a640c23a62f3a-a90293dc171mr2515031966b.3.1726764828086;
        Thu, 19 Sep 2024 09:53:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90613315e3sm740881766b.209.2024.09.19.09.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 09:53:47 -0700 (PDT)
Message-ID: <10f1c736-33e9-4e04-a31e-0f095cdd08d2@redhat.com>
Date: Thu, 19 Sep 2024 18:53:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux fails to ACPI S3 supend on Dell XPS 13 9630
 (6.11.0-04557-g2f27fce67173)
To: Paul Menzel <pmenzel@molgen.mpg.de>, Marek Maslanka
 <mmaslanka@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
 regressions@lists.linux.dev, Petr Mladek <pmladek@suse.com>
References: <18784f62-91ff-4d88-9621-6c88eb0af2b5@molgen.mpg.de>
 <154114fb-276f-45f6-bba0-98133c7c5d4d@molgen.mpg.de>
 <3b600845-77d5-42d3-8556-53cc0b2eab25@molgen.mpg.de>
 <1c10c0c4-f4d7-490f-85d2-0278c062fb87@molgen.mpg.de>
 <aa60da75-7931-462d-addd-49adfbd9893b@redhat.com>
 <b3cc0791-6334-4143-90bc-d3ae04aae0de@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b3cc0791-6334-4143-90bc-d3ae04aae0de@molgen.mpg.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 19-Sep-24 4:03 PM, Paul Menzel wrote:
> Dear Hans,
> 
> 
> Am 19.09.24 um 13:57 schrieb Hans de Goede:
> 
>> On 19-Sep-24 1:03 PM, Paul Menzel wrote:
> 
>>> Am 19.09.24 um 10:17 schrieb Paul Menzel:
>>>
>>>> Am 19.09.24 um 07:51 schrieb Paul Menzel:
>>>>
>>>>> Am 19.09.24 um 07:51 schrieb Paul Menzel:
>>>>
>>>>>> On the Intel Kaby Lake laptop Dell XPS 13, Linux
>>>>>> 6.11.0-04557- g2f27fce67173 (“6.12-rc0”) fails to ACPI S3
>>>>>> suspend the system. The screen turns black (as expected) and
>>>>>> the power button LED stays on.
>>>>>>
>>>>>> Doing
>>>>>>
>>>>>>       echo N | sudo tee /sys/module/printk/parameters/console_suspend
>>>>>>
>>>>>> and on tty2
>>>>>>
>>>>>>       sudo systemctl stop gdm3
>>>>>>       sudo systemctl start getty@tty1.service
>>>>>>
>>>>>> and then on tty1
>>>>>>
>>>>>>       sudo systemctl suspend
>>>>>>
>>>>>> I see some panic messages and traces containing ktime_get or
>>>>>> so, but I failed to save the messages. (Hints very much
>>>>>> appreciated.)>>>>>
>>>>>> I try to test the printk changes, but otherwise bisecting is
>>>>>> not feasible, as it’s my production machine.>>>
>>>> It’s not the printk changes. I tested some commits, and assume it’s the timer core changes:
>>>>
>>>>       $ git log --oneline --merges daa394f0f9d3c -3 --no-decorate
>>>>       daa394f0f9d3c Merge tag 'core-debugobjects-2024-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>>       9ea925c806dbb Merge tag 'timers-core-2024-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>>       cb69d86550b3f Merge tag 'irq-core-2024-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>>
>>>>
>>>> 1.  6.11.0-02659-gcb69d86550b3 succeeds to ACPI S3 suspend
>>>> 2.  6.11.0-02710-gdaa394f0f9d3 fails to ACPI S3 suspend
>>>
>>> It truns out your commit e86c8186d03a (platform/x86:intel/pmc:
>>> Enable the ACPI PM Timer to be turned off when suspended) causes
>>> the regression. The laptop defaults to s2idle, but due to
>>> problems, I force it to `deep`.
>>>
>>> Revert on master is not easily possible due to other changes it seems.
>>
>> First of all thank you for reporting this so early in the cycle and
>> for pinning it down to a specific commit. Both are really appreciated.
>>
>> I guess that the power-savings from disabling the pm-timer are mostly
>> relevant for s0ix suspend. If regular S3 suspend is used the the
>> firmware is in control of the suspend and if necessary it should disable
>> the timer.
>>
>> So I think we can fix this by limiting the new handling to s0ix suspend.
>>
>> Can you please give the attached patch a try?
> 
> Thank you so much for the instant reaction. Indeed, your patch makes ACPI S3 suspend work.
> 
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022

Thank you for testing. I've submitted this upstream now.

I'll include this in the first pdx86 fixes pull-request over 6.11-rc1 is out.

Regards,

Hans



