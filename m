Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3369CA54
	for <regressions@lists.linux.dev>; Sat,  7 Oct 2023 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCk6KMtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696668680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oDRM3x+Dbg0HgjsFOZuFQecU4AZd+pusA3mLRKOu+cI=;
	b=CCk6KMtGf0p5WDJvWePM2+0w6UGLkleMEAoGj07b/alP7qGcSbvF5tu2Az1vTROTIMY42Y
	9EA+8WLaZBkN3OKZk6cLvrIQjveUlW6N7s+6FfhsazGsohL87o1LIj8lzHoWnSd2t9t+gH
	r8Ha/Kv6/Fkw8jnw41NO9SxMlkkD9DY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-NH4hRO6fN2mnD4wg3uTvYQ-1; Sat, 07 Oct 2023 04:51:17 -0400
X-MC-Unique: NH4hRO6fN2mnD4wg3uTvYQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b2cf504e3aso242298066b.2
        for <regressions@lists.linux.dev>; Sat, 07 Oct 2023 01:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696668676; x=1697273476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDRM3x+Dbg0HgjsFOZuFQecU4AZd+pusA3mLRKOu+cI=;
        b=THi9ZqLMCC1ufBRsgN3c28Jr/Z7cYCN7CfUInlcuTE7LOyEkFDDiffWv17aFRStZ7o
         6iAudxJM4rQhbPtVlZXBCZQPkPZWGhwusYDkzNKb9SKegFh6TxW//X2Ga6K7nvuHwOIX
         yv7ha5VBlLs+2shB2Nb5z7pkqv3R0pT+1jHCBk3APbl+buWFozpotAvfUTkhaJzaYsRj
         iSY5Gk6UELnjmjMH9yV9vqF8BSv1juOFeGd/1xRDqMCurgtqGINXA89Z8f00U6dQXrt3
         Mz3kxHMSltGB/JAHYGuajbl0c0wYF8Hmnf6ag2Cyu/ArKPilS3lDpAQhHPQNN/LhE31l
         gPuQ==
X-Gm-Message-State: AOJu0YxdZ76MhMyg11YutusQXYhq+PP1PKUFRHIsVguV+R61snAgvWNJ
	rPIdhb5SKbfuQLyMKtDU5hmchGIO+u4VUGgP2+xJXANJejQU+082eYyMVUkfi/+Cwh/F3JqQE9W
	4A/UdwHxjeqpnNycm11KdVWM=
X-Received: by 2002:a17:906:5188:b0:9a5:c9a4:ba1b with SMTP id y8-20020a170906518800b009a5c9a4ba1bmr10482850ejk.8.1696668676800;
        Sat, 07 Oct 2023 01:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Yb2r7gN29uw7TiEY3d3JfAvYPX6gsIQq82PCTAtWvTwZvWl3RZzGWb3BpGZ4CyNMEp9pNQ==
X-Received: by 2002:a17:906:5188:b0:9a5:c9a4:ba1b with SMTP id y8-20020a170906518800b009a5c9a4ba1bmr10482840ejk.8.1696668676423;
        Sat, 07 Oct 2023 01:51:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qx18-20020a170906fcd200b0099bc8bd9066sm4037437ejb.150.2023.10.07.01.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Oct 2023 01:51:15 -0700 (PDT)
Message-ID: <026f8034-0b0e-9c77-f547-7f883b9b8bc1@redhat.com>
Date: Sat, 7 Oct 2023 10:51:15 +0200
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gK1Q54sMRJJJBTf+gY5jd-_57jYKvN5ELNSpmaeVVjAw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rafael,

On 10/6/23 21:20, Rafael J. Wysocki wrote:
> On Fri, Oct 6, 2023 at 5:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi August,
>>
>> On 10/6/23 16:18, August Wikerfors wrote:
>>> Hi Hans,
>>>
>>> On 2023-10-06 14:33, Hans de Goede wrote:
>>>> The TongFang GM6BGEQ, GM6BG5Q and GM6BG0Q are 3 GPU variants of a TongFang
>>>> barebone design which is sold under various brand names.
>>>>
>>>> The ACPI IRQ override for the keyboard IRQ must be used on these AMD Zen
>>>> laptops in order for the IRQ to work.
>>>>
>>>> Adjust the irq1_edge_low_force_override[] DMI match table for this:
>>>>
>>>> 1. Drop the sys-vendor match from the existing PCSpecialist Elimina Pro 16
>>>>     entry for the GM6BGEQ (RTX3050 GPU) model so that it will also match
>>>>     the laptop when sold by other vendors such as hyperbook.pl.
>>>>
>>>> 2. Add board-name matches for the GM6BG5Q (RTX4050) and GM6B0Q (RTX4060)
>>>>     models.
>>>>
>>>> Suggested-by: August Wikerfors <git@augustwikerfors.se>
>>>> Reported-by: Francesco <f.littarru@outlook.com>
>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217394
>>>> Link: https://laptopparts4less.frl/index.php?route=product/search&filter_name=GM6BG
>>>> Link: https://hyperbook.pl/en/content/14-hyperbook-drivers
>>>> Link: https://linux-hardware.org/?probe=bfa70344e3
>>>> Link: https://bbs.archlinuxcn.org/viewtopic.php?id=13313
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> Since this is a regression fix for 453b014e2c29 ("ACPI: resource: Fix IRQ override quirk for PCSpecialist Elimina Pro 16 M") (for PCSpecialist systems like Francesco's with product name "Elimina Pro 16 M" but not board name "GM6BGEQ") and 2d331a6ac481 ("ACPI: resource: revert "Remove "Zen" specific match and quirks"") (for other vendors using the same TongFang design), it should have a "Fixes:" tag for at least one of those.
>>>
>>> Both of those commits are in 6.5 (and 6.6-rc) so this should go into 6.6-rc and be backported to 6.5, but the patch seems to depend on 424009ab2030 ("ACPI: resource: Drop .ident values from dmi_system_id tables") and maybe also d37273af0e42 ("ACPI: resource: Consolidate IRQ trigger-type override DMI tables") to apply cleanly, which seem to only be queued for linux-next/6.7? I'm not familiar with what the correct process is for such cases.
>>
>> You are right:
>>
>> Fixes: 453b014e2c29 ("ACPI: resource: Fix IRQ override quirk for PCSpecialist Elimina Pro 16 M")
> 
> OK
> 
>> Note likewise this commit should really also be send as a fix
>> for 6.6 and backported to the stable kernels:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/drivers/acpi/resource.c?h=bleeding-edge&id=c1ed72171ed580fbf159e703b77685aa4b0d0df5
> 
> That's harder, because it does depend on commit 424009ab2030 ("ACPI:
> resource: Drop .ident values from dmi_system_id tables") which is not
> 6.6-rc material IMV.
> 
> So I'm going to queue this up with the Fixes tag above and Cc: stable
> pointing to commit 424009ab2030 as a dependency, but for 6.7.

I realize that I'm the architect of this whole mess, but delaying
these new quirks to 6.7 does not seem like a good idea to me.

This fixes a serious problem (kbd not working pretty much makes
the whole laptop unusable under Linux at least on the road). With
a very small chance of regressions since this is DMI match base.

Maybe we can just take all the resource.c DMI quirk changes
as fixes to 6.6 ?  I admit the:

"ACPI: resource: Consolidate IRQ trigger-type override DMI tables"
"ACPI: resource: Drop .ident values from dmi_system_id tables"

patches are not really bugfixes. But they too have a very low
chance of causing regressions.

Regards,

Hans


p.s.

Note that "ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA"
should probably go as a fix to 6.6 regardless of the discussion since
that is a pure bugfix which applies cleanly on top of 6.6

And the same goes for this (unrelated) drivers/acpi/ec.c patch:

"ACPI: EC: Add quirk for the HP Pavilion Gaming 15-dk1xxx"

That too is a pure bugfix which IMHO should go to 6.6 as such.




