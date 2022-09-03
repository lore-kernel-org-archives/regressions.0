Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8F7E
	for <regressions@lists.linux.dev>; Sat,  3 Sep 2022 15:42:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso8241146pjh.5
        for <regressions@lists.linux.dev>; Sat, 03 Sep 2022 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=RihxUErPjGjCRqUDS9HiNVuBbHa0QuWFBeZk5IF4d5A=;
        b=LhnvBaEGtF/EwExLuye2jtEj11YmcGxHMSpXEVByoR2rfSw7wnBM3I/8XvCadrYDaP
         USeKz8cbPrXg/ksnsKvEj5dXkgqMnkadX/nQrkxAf9QBYgo6+CiM8L9fy73ILY/9AM46
         /NE8v2Ay6moBLmAT/SClw+KDYOEAdpl7sxlp6dgkMVxIL9xiu2kJwDwaXfAUbqjTQw1k
         WZLB26r5d+V7bjyZn9fQW9xw2+tjEPZHiy7BZ9OnH/N5LxlVfHD/DuPOyeaKDUqdloXc
         4mQ1BVpLAmUGjR7ZbFi/KFyqfLM54RLyrQLwqkvsGMP1M0kbFGzfp3VdhrVwFc4L4Oje
         tQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RihxUErPjGjCRqUDS9HiNVuBbHa0QuWFBeZk5IF4d5A=;
        b=Uk6kfCFP/J2Mgg6um2+TpHpwlDpgmQYpnBUpnSZtg4jasrjbxV2HkUX42Oa+cXMR1g
         ffOO2vW8a1/HzI4xnry4qIsTkNDsvGqPjIQFspKe6zkbHf2qevdGYk3owcNbYLOFLBZC
         BjRAjUAosbf5uITBVUyXTRlS4Yt3FDCv+7IuQIotuK2TevlrXAB/D77VoGyAmLUcVNIv
         LcHGLiKhE2WN17hGMvoqH/FPZWbbBkQVXsVda+VKbwFuywRyGxdjEBIoN06Ct0t0Rzqj
         u46J+d8hvJvs11yY3TMk143YtIWb9Lf7YMfjJ/uT+8ZyO/RdD5XgUosAsRKpj4PDwFb6
         TAgA==
X-Gm-Message-State: ACgBeo2T3aNtdlluOdaN7XyPdfBIORRQgeNIaccXv5OOKpG8t5BK01Jh
	lnas9ELRd5jX0UuUrXfBomNQMx9Ldm5N9Q==
X-Google-Smtp-Source: AA6agR6V9DCFe/r6xK476t79zuEgn+XddXPAXY2KeS67DfvvT3HPza5sfbINa1GzuaKs/aD1Yw5gaA==
X-Received: by 2002:a17:902:8bc7:b0:172:c32f:7d30 with SMTP id r7-20020a1709028bc700b00172c32f7d30mr39289655plo.48.1662219757601;
        Sat, 03 Sep 2022 08:42:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 136-20020a62158e000000b0052d52de6726sm4109083pfv.124.2022.09.03.08.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 08:42:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
Date: Sat, 3 Sep 2022 08:42:33 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
 regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
In-Reply-To: <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/22 08:13, Eugene Shalygin wrote:
> Guenter,
> 
> yes, there is a patch that I don't really understand, but it fixes a
> very similar problem:
> https://bugzilla.kernel.org/show_bug.cgi?id=216412 I will test today
> that change with a hardware where it needs to autoload and submit the
> patch if it works.
> 

I don't understand why that works either. Maybe it interferes with other
PNP0C09 devices and/or the code in drivers/acpi/ec.c.

Couple of comments:

- You'll need to drop __init.
- No need or reason to rename asus_ec_sensors_platform_driver
   to asus_ec_sensors_platform_driver_probe.

Thanks,
Guenter

> Best regards,
> Eugene
> 
> On Sat, 3 Sept 2022 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 9/3/22 04:00, Christopher Klooz wrote:
>>> Hi Eugene,
>>>
>>> Currently, we have user reports of at least 4 Fedora installations that have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
>>>
>>> All issues can be solved by blacklisting asus_ec_sensors.
>>>
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
>>>
>>> The bugzilla report contains kernel logs of two machines, one with nvidia-driver and one without a tainted kernel.
>>>
>>> The report and the contained ask.fedora link contain some elaborations of how the issue manifests at the users' machines. The major issue is a wrong output of battery power percentage (in one case it gets stuck, in the other cases is becomes erratic). Also, in one case it has effects on suspending (see the report).
>>>
>>> On the Internet, there are already reports from other Linux distributions noting the issue and the same solution (blacklisting).
>>>
>>
>> Eugene,
>>
>> do you have an immediate idea other than reverting the patch pointed to in the bug report ?
>>
>> Thanks,
>> Guenter
>>

