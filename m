Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3196AA5
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 14:25:04 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a4bcf8a97so830718b3a.1
        for <regressions@lists.linux.dev>; Thu, 07 Sep 2023 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694096704; x=1694701504; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2YPuLrMqEAU/JggmCPMqjB7zQ5AWCNVCbWGp4F5AMo=;
        b=nL6Y+13XYYsD0EATHoMZpTlvncC6RFPjbqqVTXEA0ha78+muJvhDEAxa6wE+EnqJrd
         xA6mb7cr9EE9oUtqhxu5sNiPNS8UjTfqThyuDz9CiDhaaYPfwy6bXEq70zgahok3cr6R
         /dYot8eLOOIjvS0XtNZbeR4L6zEyhTuWBrWi2PLGzSeicuVCdqcWHSWIYQ0ICZROGUCV
         HG+Gu4v8zvrK7MUi5LmA1VyK6jlqugnXbSVtA2ydiHNGDpAredxHFebrQjfpqVRpk2T8
         U1a1z5LjxY3yI5VSlk0nMz/WP7nXov65p+qL8YEFkaGxP9zURxBWh8dhYxScv6pHz5H/
         FK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694096704; x=1694701504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2YPuLrMqEAU/JggmCPMqjB7zQ5AWCNVCbWGp4F5AMo=;
        b=dsfSxZSqq8BwykwaQyvEYKZlQnbiRwJ+WStSzI+iNOctu6newxYTbVafDC3jtvcjl+
         +6pdo+fujd4MUajzmJEmJqyd+lJy9vY4T2zKAxy4I7KK3xQl3No5gVLUK+hnooFsQfqW
         OZW4QH37jz09ncY53ftgnMZqM8oJ+EC/1zJCM0PFHq7bxRNZ24vi9kXG82qm/+2omY7d
         WaCZELRj1od9g1Z4lMoxTQZnKpkK4zh8uvQMdwNnJxY1Vg256noP4roOYJcJMsGQxUjh
         OhxxJHCsJ2s10KyIexrIomEls83cnYfdXCNqPB/VQYsssz95oVBuELeQNW5EdpuStLs9
         MwDw==
X-Gm-Message-State: AOJu0Yx8kcksGvuvOHK07B3vMDvZcQnOnFYBeSGFydFjkIxfHMLLZpFc
	CF/z3WqKBxOut3QqkDEsfDTmL5w7Crk=
X-Google-Smtp-Source: AGHT+IGKqhZxSgRw6ppdClq/R7fZbxG40jWtTrR32+9LximJG6jhwJ9cUqh8bsfdEsnuqBjSQg/guQ==
X-Received: by 2002:a05:6a20:1387:b0:149:4f9b:df84 with SMTP id hn7-20020a056a20138700b001494f9bdf84mr16058396pzc.28.1694096703907;
        Thu, 07 Sep 2023 07:25:03 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id v10-20020a62ac0a000000b006888029fd63sm12350215pfe.9.2023.09.07.07.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 07:25:03 -0700 (PDT)
Message-ID: <5627ee60-8f74-0595-b901-f8cbf161e582@gmail.com>
Date: Thu, 7 Sep 2023 21:24:56 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: which regression to add to the tracking (Was: Fwd: AMD Geode LX
 hardware RNG driver produces regular patterns (geode-rng.c))
Content-Language: en-US
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
References: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>
 <3d7825ad-ebde-4ff0-878c-fdf970bc82ba@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <3d7825ad-ebde-4ff0-878c-fdf970bc82ba@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2023 21:12, Thorsten Leemhuis wrote:
> Hi Bagas! Thanks again for all the work your do, it helps a lot. But it
> might be better to discuss something related to a message of yours from
> earlier today.
> 

OK, let's see.

>> Subject: Fwd: AMD Geode LX hardware RNG driver produces regular
>> patterns (geode-rng.c)
>> Date: Thu, 7 Sep 2023 18:37:00 +0700
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> System: Alix board 2d13 (AMD Geode LX800) running OpenWrt
>>> 23.05.0-rc3 (kernel 5.15.127)
>>>
>>> Steps to reproduce:
>>>
>>> cat /dev/hwrng and see output. Output in console shows regular
>>> pattern, rngd daemon (from rng-tools) refuses to run because of low
>>> entropy from /dev/hwrng. Pattern doesn't change until I reboot
>>> system.
>>>
>>> Important notice: This problem started somewhere between 4.14.267
>>> (kernel used in OpenWrt 19.07.9) and my current 5.15.127.
> 
> I wonder if it is wise or a good idea at all to (1) forward these
> regressions reports to the developers while (2) adding them to the
> regression tracking:
> 

I'm on the err side of adding relevant devs so that they can reach
the reporter.

> * I'm not sure if OpenWrt's kernel is close to vanilla; I guess many
> developers won't have an idea either and thus might ignore the report
> (which they are free to)[1].

FWIK (from what I know), I'm not openwrt kernel hacker, so I don't know
how to build kernels for it and flash it to my router.

> * 5.15.y in ancient for upstream kernel standards, hence mainline
> developers might ignore this report (see [1])
> * the span (v4.14.267..v5.15.127) is extremely large and the regression
> might be caused my a mainline change or by the stable team; hence it's
> unclear who has to handle it and thus might be ignored by both camps
> (see [1])

Yikes! I forgot to ask the reporter to also try mainline (which is mostly
what I do in this case).

> * I'm swamped with work already, so I can't follow up to each of those
> reports, hence adding them to the tracking is likely of no benefit for
> anyone.
> 
> I in this case would have asked the reporter to test mainline first
> before taking further action.
> 

Ack.

> None of this is a big deal (and with a bit of luck some developer will
> look into this), but there were similar things with a few of the other
> reports you forwarded. I wonder how we could reach a situation that is
> more fruitful for everyone involved (you, me, the reporters, developers
> that receive mails like the one quoted above). Which leads to the question:
> 
> Are you planning to continue your regression report monitoring work for
> the foreseeable future? Then it might be best if I start on a
> "contributor guide" or something like that which mentions some basic
> quality aspects a report should reach before it is forwarded. Or do you
> have a better idea?
> 

Likely so.

I think for a good regression report:

* as always, test mainline first
* if it still reproducible on mainline, bisect. When reporting,
  specify commit range as narrow as possible (or better, exact culprit commit)
* provide relevant logs (preferably in LC_ALL=C) and clear description

Thanks for the pro tip!

-- 
An old man doll... just what I always wanted! - Clara

