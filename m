Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2FBBA51
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgilhPJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696853433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIyRfHkAIwuGp8hT7eJUs9lEr3357JAlgogvvefitEQ=;
	b=MgilhPJtWigxOSG3Y2C8TtMM1DU+3STEVIa4H7DtWxRGDmC/3HXnsEMTcFkZPnqfhkyxYV
	TKEfA4SIPBSnD5+OfTi4VfenuKEpTlunBSXVtHg3XSQActgc9/LkEQ6E1RyRAUm1tWsF0D
	eSDPtGO/Kw5e9lGhNY5WAt0AcGzD0bU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-XhxCodfQMzSllcOR0CgJIw-1; Mon, 09 Oct 2023 08:10:32 -0400
X-MC-Unique: XhxCodfQMzSllcOR0CgJIw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5219ceead33so1080316a12.2
        for <regressions@lists.linux.dev>; Mon, 09 Oct 2023 05:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853431; x=1697458231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIyRfHkAIwuGp8hT7eJUs9lEr3357JAlgogvvefitEQ=;
        b=uI+28pESY9kiFk9Z/9wLj6VANJOatlXEmAaGZEiVc7h/9vUk0mTm6dFJ9krB3B2nHE
         8I4nOioM/gDd+dOcOS0kdj4rxsYcU2uvf1wNACl5j/B2YRXFo2UWCWjID7BgzDhWCMvW
         +ZTHwHQzThPQl9YVl1bAtFtJwN/O5uTku5+b/iBhS/7mokLMC0YwyoUpBOev1r3B1iB7
         pE+5aZZA7lprVU+E85AGJ5YnH1LfNa4VCXE7q7YQuY+EhZF2G9HR6jmaS15npW1mKRzr
         X/2sKUypKc95kZi1AK3c5hVYL1kpNkF7pLHaU6/GwBDgPwhqOsTe2X2JVX7AifsjXJEZ
         moCw==
X-Gm-Message-State: AOJu0YwRveGxIC/BQnsPSD0dm+o/wkLS10We8ndSINl6Q/HijrU6+/s2
	epzYWa2uTpXunWhkssgAYSN/SPgZ6xhrJfFgoJasObQIJqoOdKhaG81+RsAxm9BQ95K7tvQoxAR
	YYN3ZWsRFIoqn2tkKLK7vaUg=
X-Received: by 2002:a17:906:31d6:b0:9ae:699d:8a2a with SMTP id f22-20020a17090631d600b009ae699d8a2amr12596499ejf.5.1696853431229;
        Mon, 09 Oct 2023 05:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAs2cz5PFcqOiVeADiguilbVRbiXu0RYwZqXR7dkdNNPyY+w89VIgJhQXj62aoIIXCj14xKA==
X-Received: by 2002:a17:906:31d6:b0:9ae:699d:8a2a with SMTP id f22-20020a17090631d600b009ae699d8a2amr12596485ejf.5.1696853430876;
        Mon, 09 Oct 2023 05:10:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906a40700b009ae587ce133sm6688268ejz.188.2023.10.09.05.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:10:30 -0700 (PDT)
Message-ID: <f8864b1d-9e66-6f20-ca2f-cc869b427343@redhat.com>
Date: Mon, 9 Oct 2023 14:10:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ACPI: resource: Add TongFang GM6BGEQ, GM6BG5Q and
 GM6BG0Q to irq1_edge_low_force_override[]
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: August Wikerfors <git@augustwikerfors.se>,
 Mario Limonciello <Mario.Limonciello@amd.com>, linux-acpi@vger.kernel.org,
 Francesco <f.littarru@outlook.com>, regressions@lists.linux.dev
References: <20231006123304.32686-1-hdegoede@redhat.com>
 <ed4672a7-439c-4240-aadc-7a36858c36b2@augustwikerfors.se>
 <9a905931-6210-8f6b-92f5-3c863d4a2e86@redhat.com>
 <CAJZ5v0gK1Q54sMRJJJBTf+gY5jd-_57jYKvN5ELNSpmaeVVjAw@mail.gmail.com>
 <026f8034-0b0e-9c77-f547-7f883b9b8bc1@redhat.com>
 <CAJZ5v0gYc7OePFzLLA2NTEzRy1DU+L86gE80vtBT6Jz4DBO1nA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gYc7OePFzLLA2NTEzRy1DU+L86gE80vtBT6Jz4DBO1nA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/8/23 14:16, Rafael J. Wysocki wrote:
> On Sat, Oct 7, 2023 at 10:51 AM Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>> I realize that I'm the architect of this whole mess, but delaying
>> these new quirks to 6.7 does not seem like a good idea to me.
>>
>> This fixes a serious problem (kbd not working pretty much makes
>> the whole laptop unusable under Linux at least on the road). With
>> a very small chance of regressions since this is DMI match base.
>>
>> Maybe we can just take all the resource.c DMI quirk changes
>> as fixes to 6.6 ?  I admit the:
>>
>> "ACPI: resource: Consolidate IRQ trigger-type override DMI tables"
>> "ACPI: resource: Drop .ident values from dmi_system_id tables"
>>
>> patches are not really bugfixes. But they too have a very low
>> chance of causing regressions.
>>
>> Regards,
>>
>> Hans
>>
>>
>> p.s.
>>
>> Note that "ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA"
>> should probably go as a fix to 6.6 regardless of the discussion since
>> that is a pure bugfix which applies cleanly on top of 6.6
> 
> That can be done.

Great thank you.

>> And the same goes for this (unrelated) drivers/acpi/ec.c patch:
>>
>> "ACPI: EC: Add quirk for the HP Pavilion Gaming 15-dk1xxx"
> 
> That can be done too.

Thank you again.

>> That too is a pure bugfix which IMHO should go to 6.6 as such.
> 
> But if you want the $subject patch to go into 6.6-rc, please rebase it
> on top of the latest 6.6-rc and resubmit.  It will not apply cleanly
> on top of the current linux-next, but I can handle the merge conflict.

That works for me, thank yuo. I've prepared a v3 which is based on
v6.6-rc1 so that it should apply cleanly for merging as fix for v6.6.

I'll send v3 out right after this email.

Regards,

Hans



