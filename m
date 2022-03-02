Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B928E2
	for <regressions@lists.linux.dev>; Wed,  2 Mar 2022 09:59:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a5-20020a05600c224500b003832be89f25so894085wmm.2
        for <regressions@lists.linux.dev>; Wed, 02 Mar 2022 01:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=mGjgjuJagPpDvHFPLswTGe/gvNp6BgBi52/QqsLQeJk=;
        b=AQ+0vGNm+zvi6vFj0EvBj/kvCv9mTd2H8P9exSay8pjcA8cbqDrMbmOkTRK/hI4TYh
         jmVJnHEchXT7cGH0AuR70QWcXOCf7s8gNb4P7+W3B4xUswQLax6gCU8VUH3/d0HGk7Jr
         lEEEhu/dXxXLbxeNgxMIczy9naQT1SRTpRDY8uLDhr9NG2D0V6QJYTdjJm+OJtMXzbwz
         us3e02mRhd2mE3VzitNOstPUfNWrIW5QwH1GXb2aKgy4L/xXbT5IvBbxWo/jFxsarPzi
         FUrb5umabPCyQjZgcUthKL8twhUK74F69V8PA0cMsKzLs5bjwq6uqNcRXKW17xbKgfKQ
         UJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=mGjgjuJagPpDvHFPLswTGe/gvNp6BgBi52/QqsLQeJk=;
        b=KL0uaFTiTuAEzJDI2DrtQSpWv0EzxT3LhEGcl1LnxEEiQajwE/ra+PbO2ZNC5D+RMI
         adu8qmzaakaV130F9HDWigxcF4OQZnqEJyTg3FgJaG+6d9Ttaxgzu4eKr+YQtNpVjS3W
         wquWsjgMaAw+w24R6aTaGWCwOtGkhu5i/0Hs65B48gsZFlvhbAlnP8k0dD31fUfNz8Yu
         b8T0BLTQXvODRmt69a3m/SLjuPehQUXq+1nzDUN+QYNUQQEfwYYorz5mALljMcdPO7xh
         vUqXGCzKMhi2XwkfH5i/ciKsrHeQmb56yAOvK+N1JUrH1TH2aXwwDGtrngVEnV+EXow7
         hDBQ==
X-Gm-Message-State: AOAM531kCqSmlqt24CruonrYamoQz95kPoAA22sOvGz23JIJBAAh88mz
	b5ZkkFfEqmt72VTFna2jf+A=
X-Google-Smtp-Source: ABdhPJyAqaH/rAcQlSZoE/a7wWSEFbwALpQ2eo677UEeXWcTtJNhf5OOeu4IlZDVnRoxyjUsq5Lv2Q==
X-Received: by 2002:a05:600c:3203:b0:381:b544:7970 with SMTP id r3-20020a05600c320300b00381b5447970mr5100314wmp.144.1646215165490;
        Wed, 02 Mar 2022 01:59:25 -0800 (PST)
Received: from [192.168.1.10] (4e691f2a.skybroadband.com. [78.105.31.42])
        by smtp.googlemail.com with ESMTPSA id p6-20020a5d4586000000b001f0436cb325sm1127234wrq.52.2022.03.02.01.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 01:59:24 -0800 (PST)
Message-ID: <7e8834f3-5f7d-4c14-a913-d036957bc81d@googlemail.com>
Date: Wed, 2 Mar 2022 09:59:23 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Chris Clayton <chris2553@googlemail.com>
Subject: Re: bug kernel 5.17, qualcom and intel adapters, unable to reliably
 connect to bluetooth devices
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Chris Murphy <lists@colorremedies.com>,
 Bluetooth <linux-bluetooth@vger.kernel.org>, regressions@lists.linux.dev
References: <CAJCQCtSeUtHCgsHXLGrSTWKmyjaQDbDNpP4rb0i+RE+L2FTXSA@mail.gmail.com>
 <17f2bf7e-1d6b-e090-8926-21a408f2b496@googlemail.com>
 <CABBYNZ+cL4f8xvTJFQGLgqPueE=-UsOtvcPQez0BEsJ5xGppfQ@mail.gmail.com>
 <16cac2c8-c1ca-c8d7-e3d9-5f00be511614@googlemail.com>
 <CABBYNZJQOSZ1fecTRQOX+w8crdiLdr0_tVstgbnyEVq3NaxscQ@mail.gmail.com>
 <6b17bdb5-dddb-e7c7-86f6-2240c6523a81@googlemail.com>
 <CABBYNZ+2Dg+AdnJqpR=wS0juektNapwHcPHBWdZyvSGFT1dVLQ@mail.gmail.com>
 <cdfed116-a5ea-0313-ba87-da429a0ac089@googlemail.com>
 <CABBYNZLnMwod+pgomEfvu83AJ=jM+uqwK9-Eqj6fA9_wXg6HBA@mail.gmail.com>
 <CABBYNZJvQaD4z_pL2YJnu3Ma8MLmxkUqAHMswd8s9XsE5FNMMw@mail.gmail.com>
 <032917a9-0c14-16d3-2751-945b9cd766a3@googlemail.com>
 <CABBYNZKZZT0Wmzx5YfTWSR7_P--O=8QLOdn7jWKa9x=GjYNgzA@mail.gmail.com>
 <CABBYNZJekcb8wy+Sp7pLPs-usvm8yXPqL+e3RCDv5i9S+cq8dQ@mail.gmail.com>
 <CABBYNZLSFjVRZf+CTZ0qE+tObaHrDa5rtFvSVuQrwUc1cQWeZA@mail.gmail.com>
 <CABBYNZJ_W-SsfBc2m-8dQkzbJ6KHoP_5YoAiED5JewVd17kUAQ@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CABBYNZJ_W-SsfBc2m-8dQkzbJ6KHoP_5YoAiED5JewVd17kUAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luiz,

Good news...

On 02/03/2022 06:55, Luiz Augusto von Dentz wrote:

<snip>
>>
>> Looks like I was able to reproduce but I still don't know the cause,
>> anyway the symptom is the following:
>>
>> [23412.856410] remove_uuid:2273: hci0: sock 0000000049dcd70a
>> [23412.856467] mgmt_class_complete:2174: hci0: err 0
>> [23412.856470] mgmt_cmd_complete:176: sock 00000000d63e046a
>>
>> It looks like the cmd->sk is wrong/corrupted, what is even more
>> strange is that the socket pointer does seem to match previously
>> connected MGMT clients and after a few attempts with btmgmt> power on
>> it does come back to life, very bizarre...
>>
>> Can you try to enable some kernel debugs before you start bluetoothd:
>>
>> echo "file net/bluetooth/mgmt.c +pfl" > /sys/kernel/debug/dynamic_debug/control
>> echo "file net/bluetooth/mgmt_util.c +pfl" >
>> /sys/kernel/debug/dynamic_debug/control
>>
>> Maybe that should give us a clue what triggers it.
> 
> Here is an attempt to fix the problem:
> 
> https://patchwork.kernel.org/project/bluetooth/patch/20220302064351.225212-1-luiz.dentz@gmail.com/
> 
> Also it probably make more sense to test with the following tree since
> we are using it to push regression fixes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/
> 

I've cloned bluetooth.git, applied the patch and installed the resultant kernel. I've booted into the kernel eight times
and on each occasion , my bluetooth devices connected successfully. Additionally, I've the latest updates from Linus'
tree into my local clone and applied your patch to that. That too has resulted in a working bluetooth service.

Thanks and well done to you and your colleagues.

For the patch above:

Tested-by: Chris Clayton <chris2553@googlemail.com>

>>>>>>>
>>>>>>> --
>>>>>>> Luiz Augusto von Dentz
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> Luiz Augusto von Dentz
>>>
>>>
>>>
>>> --
>>> Luiz Augusto von Dentz
>>
>>
>>
>> --
>> Luiz Augusto von Dentz
> 
> 
> 
