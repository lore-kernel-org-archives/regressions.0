Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24F1DFEF
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727267814; cv=none; b=RLZWjXogkRAano0UxaySY4O2/c4pCP5n+od8ux5obV2/eJVsyLs7VwGf0aK9zghFmI4ycUdOOjKlL+5cwaMx1/I/lij0YSaxlvNlAuEeyr7ShVR+z1Aa40euGJK1tTKfk1WoHJbnWrOMYWUYa1waZeo+DlcG3U8yKLbrGqzhkRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727267814; c=relaxed/simple;
	bh=gQ9ns3v1e+JoVEichbexWd8YKRC7Xlsv9R9WgknrNtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8EtIoXKtuZZsrYvHmrvSmzJGTGd15So/i59gF0/+VR3fPyrErYAH5d8CLp+JayEoC0n1lPIH93Y95D0d23t6xfGcXszakJ0Ll5CtYar6fNYlU1hlfx6AlHvx99Wgy/tzHpegdlUWLh0o1ch4E1LO5QGfRND/4NbKaal8yBK3tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CDQSeQs+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CDQSeQs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727267811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyRMd2ZT8uh48chGGXhpc+Qi9coPe+eqTvOBfCoOaTA=;
	b=CDQSeQs+oeln1S/FpY8JBvWg50PMoWzzYCYL4hok8jEG38ANv1HkHXfvUHs5FXnqodAYG0
	o43844yKTvLtGsjyVGFh1EuCpQY4P0JXiSJGwnTQ7kV7Aq+rwZwy8KR9XAJGG/ek3G8yjf
	ckgmnlz2Rx69Gjv5mA17biL7GwcnED4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-ujMvUcIWOoKG0R70j3uoyQ-1; Wed, 25 Sep 2024 08:36:49 -0400
X-MC-Unique: ujMvUcIWOoKG0R70j3uoyQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8d26b5857cso513785366b.0
        for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 05:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727267808; x=1727872608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyRMd2ZT8uh48chGGXhpc+Qi9coPe+eqTvOBfCoOaTA=;
        b=RH1fVWpTav76PvQQHDu+zXH1tfktl+pfGoamiW9WA3kfBwMo6muJV1PdGFzXokNZrM
         tRj/kJLQz1O2D9tYsnMglxxbdEnNTprgfzyh0mln8+Pttf3DYxHzRNbhTxzgdgKR4wCk
         ZMwkIsBRkLs9nJEQtg04Ba3q5hcw99dOi63veVb3Ham7bOUfUYZcVQ3di0/RG8oqLFKn
         jRlLQAeJuJw3n4/3DrhSkl700uhF8SVxfCCz5TVNnOhArMGVNlXBWoJZtk+Lkf1d8TgG
         +qTFAzOuaTVhZq/Juc0D51AuWos5RcWPSQdtS2NeUJIHJtCrAsf7z8oZ4Ja6VFz9dj3A
         yGfA==
X-Forwarded-Encrypted: i=1; AJvYcCVgGWR0kse5h6Lzs9cPZXzf/58lIHF9+V1YriVhUsjT7oGEGSXaSk3WfZqqReXcYIjHEkn63EfX5GPEag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTW7xFGXa+meV9jjRbAm4LihibyRHYiG4mLusNekZreqwjHA+3
	bPB9n2i2QNxkMs9CQbp2MR36N/sXVSEiqbC03nfE8dXmhcBkeyXMoYg4dAP4fPRgoOxa2yuCKH1
	bvCzTUYprSXB0p9/1CCegSNwzDvnxxKbY9z2ZDOhdMCASJ5Ns02FS3hQfxzab
X-Received: by 2002:a17:907:7286:b0:a86:7b71:7b74 with SMTP id a640c23a62f3a-a93a06a3e81mr251371966b.55.1727267808249;
        Wed, 25 Sep 2024 05:36:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv7YOI3w+oy8/4wAMxx/Mhw8ztDgsS5AEoaAxcEGVTbGdlOe+ZtraZbzrnM7BNlsHxiUF9Fw==
X-Received: by 2002:a17:907:7286:b0:a86:7b71:7b74 with SMTP id a640c23a62f3a-a93a06a3e81mr251369966b.55.1727267807769;
        Wed, 25 Sep 2024 05:36:47 -0700 (PDT)
Received: from [192.168.39.203] ([109.38.139.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930f188bsm204963466b.153.2024.09.25.05.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 05:36:47 -0700 (PDT)
Message-ID: <b92b57d0-41ee-46a3-ac44-4705a116a593@redhat.com>
Date: Wed, 25 Sep 2024 14:36:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux fails to ACPI S3 supend on Dell XPS 13 9630
 (6.11.0-04557-g2f27fce67173)
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Marek Maslanka <mmaslanka@google.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
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
 <10f1c736-33e9-4e04-a31e-0f095cdd08d2@redhat.com>
 <28bef0a7-bc6c-47b8-9545-e6d867922e14@redhat.com>
 <f037f25b-153d-4fb7-92fd-e3900c9488f6@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f037f25b-153d-4fb7-92fd-e3900c9488f6@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 25-Sep-24 12:46 PM, Thorsten Leemhuis wrote:
> On 19.09.24 18:55, Hans de Goede wrote:
>> On 19-Sep-24 6:53 PM, Hans de Goede wrote:
>>> On 19-Sep-24 4:03 PM, Paul Menzel wrote:
>>>> Am 19.09.24 um 13:57 schrieb Hans de Goede:
>>>>> On 19-Sep-24 1:03 PM, Paul Menzel wrote:
>>>>>> Am 19.09.24 um 10:17 schrieb Paul Menzel:
>>>>>>> Am 19.09.24 um 07:51 schrieb Paul Menzel:
>>>>>>>> Am 19.09.24 um 07:51 schrieb Paul Menzel:
>>
>>>>> So I think we can fix this by limiting the new handling to s0ix suspend.
>>>>> Can you please give the attached patch a try?
>>>> Thank you so much for the instant reaction. Indeed, your patch makes ACPI S3 suspend work.
>>>> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>
>>> Thank you for testing. I've submitted this upstream now.
>>>
>>> I'll include this in the first pdx86 fixes pull-request over 6.11-rc1 is out.
>>
>> That should be 6.12-rc1 of course.
> 
> Out of curiosity: why not send the fix to Linus this week to get it into
> 6.12-rc1 (and thus on track for stable backporting too, assuming Greg
> will pick it up)? Just asking, as I have seen some developers wrongly
> assuming it's not okay to queue fixes due to our "no newly developed
> patches should be merged to -next or mainlined during the merge window"
> rule.

The commit/regression this fixes is only in 6.12 (1), so there is no need
to backport the fix.

Which means that AFAICT there is no big hurry to fix this and I'm currently
traveling (I'm at kernel recipes in Paris atm).

Regards,

Hans


1) If I'm not mistaken, it was certainly first introduced in 6.12 and
it is not a bugfix, so I don't expect it to get picked up by the
stable kernels.

