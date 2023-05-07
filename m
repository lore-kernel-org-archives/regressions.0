Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40417C6
	for <regressions@lists.linux.dev>; Sun,  7 May 2023 14:55:29 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54f9e2d0714so4989867b3.1
        for <regressions@lists.linux.dev>; Sun, 07 May 2023 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683471328; x=1686063328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0a1+UeLlATmgaT4hIrkt4/5zUzk0Ow/J8sqcb3kQi/A=;
        b=D8oNiHkuVxig1gep6gO0cHT+strbDtVEhVzzvoIChhlbWN/T/LiQ8muaBiYDeiRam4
         k6Hg2eluXy0Sd5ij6o8X1aGaE0vGB1Qc3V9+XxqrgPMFf10ePTg3CnBf9YrpWpr8KrFo
         90DTLR6nzd76YT9akek53DDpYDb/WZUV27MMl+kScqkq5mqAH4kJSkzUGZicjF8NHzz2
         zKg3G2CzKJjeXH5fNmTKnilz5uqYYqIP8BehbGvWdHn0zPxjC4bNodpQf2ADdBsbvk7C
         M6oHXqcw6xkxz7hQj1kZ33FhQMNuk1vVsbAf2kk6Z+lLg0HH1AuuaFWqX/FbBplT6QQ5
         z3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683471328; x=1686063328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0a1+UeLlATmgaT4hIrkt4/5zUzk0Ow/J8sqcb3kQi/A=;
        b=MhG+OKNrOHvXpjGsnU+diA8KBb6l7//uj3EhY9nOLQcpNxkaIpNQ9+mLJeB5BxbXqB
         dZ51lOtRy4vscUtZv3J1Bb0+cMr5Zl9ARHHcsgTzy6p2+FgQPFqXVLOaUK+aqeXmEMeB
         WvWzGjUpIKn8q8WJvWIfdtuHVruYpcKcvRhdK0nYOPA3QQvndRY6Jz3QVfWDPKbOUoYF
         kRxodymGw6VZIugAYuXZMrr9lMY6EUypN9De474V/kBZgELS0x6d7STHPjAAZdPpxDvr
         R0hOkR19yUYbsBiACN/J15XqihjJQUyg6tdklQY4TJ1+0pAvFBtdMuVF58lBVwfM3hxf
         Ttww==
X-Gm-Message-State: AC+VfDxnL3Jnm1eYoGxzVEBb+K6u7KFnTjUQv3qiZPBNucEWEyrEh/ov
	dB0e69qP66xPZqGKtwLGxoM=
X-Google-Smtp-Source: ACHHUZ73lLFaaN5yQqcTGVDNauL6G7L1c8diOqwAnZkrCIPUGbPOEqJzxEAO4HctJp8fF4IsC5fB7A==
X-Received: by 2002:a25:aa71:0:b0:b9d:b2b6:7fd9 with SMTP id s104-20020a25aa71000000b00b9db2b67fd9mr6939647ybi.1.1683471328071;
        Sun, 07 May 2023 07:55:28 -0700 (PDT)
Received: from [192.168.75.211] ([173.23.87.62])
        by smtp.gmail.com with ESMTPSA id s4-20020a259a84000000b00b9dfcc7a1fasm1712432ybo.7.2023.05.07.07.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 07:55:27 -0700 (PDT)
Message-ID: <0bb0439e-b066-ad05-371b-73d3135b39a3@gmail.com>
Date: Sun, 7 May 2023 09:55:25 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [regression] Bug 217394 - IRQ override skipping breaks the Aya
 Neo Air Plus 6800U keyboard buttons
To: Mario Limonciello <mario.limonciello@amd.com>,
 Chuanhong Guo <gch981213@gmail.com>, "Limonciello, Mario" <mlimonci@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-input@vger.kernel.org, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <01ea5c8e-ed2f-7568-f6ed-896329e7b673@leemhuis.info>
 <68d017d9-d815-01d4-23c1-49c0aaf5f20b@amd.com>
 <CAJsYDVKY0V4V5fCseGJ7SPW6+-4r7d04RTgkF82VgYcNLk5DtQ@mail.gmail.com>
 <1b3e5df0-6190-e560-72c8-f600f715f89e@amd.com>
Content-Language: en-US
From: Matthew Anderson <ruinairas1992@gmail.com>
In-Reply-To: <1b3e5df0-6190-e560-72c8-f600f715f89e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On the Ayaneo Air Plus I modified the DSDT based on another handheld 
with a 6800U that does not have the problem and it resolved the issue. I 
hope this information helps in some way.

<             Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard 
(101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
<             Name (_UID, Zero)  // _UID: Unique ID
---
 >             Name (_HID, "MSFT0001")  // _HID: Hardware ID
 >             Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard 
(101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
6135c6135
<                 IRQNoFlags ()
---
 >                 IRQ (Edge, ActiveLow, Shared, )


On 5/7/23 7:41 AM, Mario Limonciello wrote:
>
> On 5/6/23 03:25, Chuanhong Guo wrote:
>> Hi Mario!
>>
>> On Thu, May 4, 2023 at 12:11 AM Limonciello, Mario <mlimonci@amd.com> 
>> wrote:
>>> +linux-input
>>>
>>> On 5/3/2023 7:58 AM, Linux regression tracking (Thorsten Leemhuis) 
>>> wrote:
>>>> Hi, Thorsten here, the Linux kernel's regression tracker.
>>>>
>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>> kernel developers don't keep an eye on it, I decided to forward it 
>>>> by mail.
>>>>
>>>> Chuanhong Guo, apparently it's cause by a change of yours.
>>>>
>>>> Note, you have to use bugzilla to reach the reporter, as I sadly[1] 
>>>> can
>>>> not CCed them in mails like this.
>>>>
>>>> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217394 :
>>>>
>>>>>    Matthew 2023-05-03 02:28:33 UTC
>>>>>
>>>>> Reverting the changes found in this patch fixes the issue:
>>>>>> https://lore.kernel.org/all/20220712020058.90374-1-gch981213@gmail.com/ 
>>>>>>
>>>>> With that patch the AT Translated Set 2 Keyboard doesn't show up 
>>>>> with the evtest and is not usable.
>>>>>
>>>>> Hardware:
>>>>>
>>>>> Aya Neo Air Plus
>>>>> AMD Ryzen 7 6800U
>>>> See the ticket for more details.
>>>>
>>>> BTW: there apparently is another IRQ override needed for a different
>>>> machine. See https://bugzilla.kernel.org/show_bug.cgi?id=216804#c8 for
>>>> details (ignore the comments before that, the quirk entry for that
>>>> machine was merged; comment 8 and all related to it really should 
>>>> have a
>>>> separate bug; that's also why this partly fall through the cracks here
>>>> :-/ ). The user is currently trying to create a patch.
>>>>
>>> Something I'm wondering about is if it's possible for i8042 to detect
>>> the polarity is incorrect when it probes and
>>> to try to correct it.
>>>
>>> If we could do that we can probably drop 9946e39fe8d0 ("ACPI: resource:
>>> skip IRQ override on AMD Zen platforms")
>>> to fix this issue along with all the other quirks that have collected
>>> over time on i8042 polarity issues.
>>>
>> I don't really understand why there are more and more new laptops
>> appearing with broken IRQ settings in ACPI, especially considering
>> the fact that some of these laptops were released after the original
>> problem was already identified almost a year ago.
>> What exactly was the solution when AMD internally discovered this IRQ
>> mismatch problem? Did you guys changed the emulated IRQ polarity
>> without updating the ACPI table with the corresponding polarity
>> description in your reference design?
>>
> In the reference design the tables are updated to be accurate and
> reflect the appropriate polarity.  It seems that the vendors must be
> changing this and it not breaking Windows for some reason.
>
>
