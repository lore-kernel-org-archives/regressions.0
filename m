Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0289F1847
	for <regressions@lists.linux.dev>; Tue, 17 May 2022 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652802613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6h7GjHXovS7HJ4Kp5wqYSGdYt0+9AQpi6DLOx1zqHHk=;
	b=WylYw4yUvhLFNm+SvQ7oQtrZD0g4hFo0gLh/nEbrypv5H1DRfchYFEsmcbUSfLvdIIzrrM
	0xxkIhicI1jilswFc4xS5BqSO0EIp40VhqiYt+EjU5KXlyAvfXwRyxtUPWUlpReXAkgXGs
	xQyxJcHYfnPIXLFtfYqgvFRnXoaDneo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-COdZVWEuPa6Zw5lhB-b94g-1; Tue, 17 May 2022 11:50:10 -0400
X-MC-Unique: COdZVWEuPa6Zw5lhB-b94g-1
Received: by mail-ej1-f72.google.com with SMTP id bk16-20020a170906b0d000b006fe34a2e598so2634731ejb.0
        for <regressions@lists.linux.dev>; Tue, 17 May 2022 08:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=6h7GjHXovS7HJ4Kp5wqYSGdYt0+9AQpi6DLOx1zqHHk=;
        b=agXFgm8LAHovbeB0LKPxwhg6r17e/yDVyHCbhc/9g5M8Z9q5ulkf9f8srxI0EzmvHB
         3KpjdZc2CfKJZD6+ovg3Iz9iHdgOlcR232y2whCtkaArLtz4q3jjpIM7F+NaaomiJ/bu
         yOzfoFltR32XRdJB4Tm4Ex0N1TxyCD/74Bhh00cYbo+F3M603ByAwdc4L0PhCX+cyLVT
         PvUC8D9e8zKcSEWSQ+LFgOtpZCCSS5Fph2LWrJMbyIEsbnlw+Ld4n47yUHKlGuEnfMA6
         5dZkAerp72/F4Sb7u/5KumKBm2XseGPwzBsfnjyMutJ2ge+IqNRXqPGeOqJkKM7xMjPJ
         aq0g==
X-Gm-Message-State: AOAM531SSfWR6nuz7lSHvFgPiylkWoISDwk2xBq6qRsNU8N7/HJm8GDW
	aZZBj90Y59tlh3/0nLHynWh1JL11G1KRpamyjJGH9A+kP12Oxg3Ee7UDjnNlYoK+zAJlpYo9Oio
	nuennpzLLQ0hiMwRkzi02auo=
X-Received: by 2002:a17:907:1b1c:b0:6f0:10e2:7a9b with SMTP id mp28-20020a1709071b1c00b006f010e27a9bmr21197683ejc.58.1652802609259;
        Tue, 17 May 2022 08:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwauTfVmlCJoRiKhXSBiOeT/A7JIF17V3tL8pRBRkaE+ZWZTtEnTbdgpF/bFVMc/K/bASQynw==
X-Received: by 2002:a17:907:1b1c:b0:6f0:10e2:7a9b with SMTP id mp28-20020a1709071b1c00b006f010e27a9bmr21197664ejc.58.1652802609081;
        Tue, 17 May 2022 08:50:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u11-20020a50eacb000000b0042617ba6383sm7426505edp.13.2022.05.17.08.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 08:50:08 -0700 (PDT)
Message-ID: <04f2e08c-4c39-16d3-d785-f36494c6256c@redhat.com>
Date: Tue, 17 May 2022 17:50:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Linux regressions report for mainline [2022-05-09] (was: Linux
 5.18-rc6)
From: Hans de Goede <hdegoede@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAHk-=wi0vqZQUAS67tBsJQW+dtt89m+dqA-Z4bOs8CH-mm8u2w@mail.gmail.com>
 <165209064657.193515.10163777181547077546@leemhuis.info>
 <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
 <54664f6a-b046-1330-e794-cb533e942a94@redhat.com>
In-Reply-To: <54664f6a-b046-1330-e794-cb533e942a94@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/9/22 21:04, Hans de Goede wrote:
> Hi,
> 
> On 5/9/22 19:20, Linus Torvalds wrote:
>> On Mon, May 9, 2022 at 3:47 AM Regzbot (on behalf of Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> Hi Linus! Here's a quick compilation of open reports about regressions in
>>> 5.18-rc that I'm currently aware of; most of the reports are quite
>>> recent and there afaics is nothing that looks particularly worrisome.
>>
>> Well, the Intel GPU issue seems likely to cause problems for lots of people:
>>
>>> [ *NEW* ] drm/i915: BYT rendering broken due to "Remove short-term pins from execbuf, v6"
>>> -----------------------------------------------------------------------------------------
>>> https://linux-regtracking.leemhuis.info/regzbot/regression/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>>> https://lore.kernel.org/dri-devel/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>>>
>>> By Hans de Goede; 0 days ago; 2 activities, latest 0 days ago.
>>> Introduced in b5cfe6f7a6e1 (v5.18-rc1)
>>>
>>> Recent activities from: Tvrtko Ursulin (1), Hans de Goede (1)
>>
>> Although it looks possible that it mainly affects old chipsets (ie the
>> two reports are for a Bay Trail chip and a Core 2 Duo chip - I have no
>> idea how they compare).
>>
>> That probably means there are a lot of machines out there, but likely
>> not the kind that most kernel developers will be testing, so not a ton
>> of reports until it hits distro kernels etc.
>>
>> It looks like Maarten is already involved.
> 
> This is being tracked here:
> https://gitlab.freedesktop.org/drm/intel/-/issues/5806
> 
> I've just tested a patch from Maarten which fixes things for me,
> so hopefully we can get this resolved soon.

Maarten, it would be nice if we can get this fixed before 5.18
is released. What is the status of getting your:

https://patchwork.freedesktop.org/patch/485889/

patch for this merged ?

Regards,

Hans

