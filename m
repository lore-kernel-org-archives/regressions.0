Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9792F24
	for <regressions@lists.linux.dev>; Sun,  6 Feb 2022 17:20:36 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id fh9so1879701qvb.1
        for <regressions@lists.linux.dev>; Sun, 06 Feb 2022 09:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hnu13BcRGddplmpUh1YzEX2nWwPlpBt573XpCqqfRXM=;
        b=jmdEcLuNUGiAknaXt/CQ/QmliWWDM94ilAD5x/JECjHNyRrKh+Bg+JQsjC4oLBDKma
         Ljf8yOXPdOjJs265K+E+Hv/WOu8kWlJVYvtbpDa92gdegkZvx20+hYm5zL9lwVBigciz
         d6L2VY2vz2a5nd0wmz0py23O9tdGohez+0OllwsxGf/hpSndjckaQzy06VYF/WOyH6mE
         Xtb9xRj6wYeGYCW5gViw7kU7QN/li56bXlpB2gf+eM1bQia9qb8dtnPdM3JCjDBzBTnD
         rYbGQZskqfXrol8QRUA0fzw90DV9wbHHzo1uhbrQUz72REyWHFWY2kdXVOGLJEK9Y+5A
         NejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hnu13BcRGddplmpUh1YzEX2nWwPlpBt573XpCqqfRXM=;
        b=vF9nOX6m3IEMZtl4hR3awbmrLCaVUNRU9BW8qP/1WKqcsFame9w4dzprW4nOKLW6uL
         sBmGczSxw8EbFtAfQYLZ8OKgFL46WLhl63jSRD1FtU+s1xMmBZT1pJ59JOb+bgLKifyZ
         8tNvxRWXD1/lFVOtirjzlK6ipvlV6byb6ouu3+Fj36QPj68TXm834z0GxSoVW+SuPgGE
         BytRg6i5aA8T1bscKpDAsutfZRzZJ0Q96zIJDzuNwr5bWWT7lfGtDXNQTX7l46wil8kA
         h2qoelFygCX8BTTlm6becZt/OkmIucNG7QBHGPCcyxSy1z1VyxP1qn6ODU/SwMDZiyOc
         ddZA==
X-Gm-Message-State: AOAM532EoHnShngm3MuCOXqCwgcBTtzD35h+c2R8u1DurRG8iSsbZ/fe
	PMbhU58kdC43wIM6gfgqxw==
X-Google-Smtp-Source: ABdhPJwqyd2n63Ifl3I4CA3ERIvz+OuhYXyq/lpVcBrpRz9GTjZ0ddDPh0nUgadnp6v/9UzDWRcJnQ==
X-Received: by 2002:ad4:5dc4:: with SMTP id m4mr8212062qvh.17.1644168035499;
        Sun, 06 Feb 2022 09:20:35 -0800 (PST)
Received: from [10.1.1.242] (207-38-182-214.s3007.c3-0.wsd-cbr1.qens-wsd.ny.cable.rcncustomer.com. [207.38.182.214])
        by smtp.gmail.com with ESMTPSA id j11sm4463819qtj.74.2022.02.06.09.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 09:20:35 -0800 (PST)
Message-ID: <b3f1ab29-d46c-5d43-717f-d27f1bd852d8@gmail.com>
Date: Sun, 6 Feb 2022 12:20:34 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Asus Router Kernel Panics
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 tech.support@broadcom.com
References: <4f5dccba-ab28-8007-bed8-f2594498c8c1@gmail.com>
 <Yf/+npr9xV2HVg9k@kroah.com>
From: MP <fromschoollaptop@gmail.com>
In-Reply-To: <Yf/+npr9xV2HVg9k@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the reply. Will put pressure on Asus to properly research 
this. Their solution is\was to send a refurb unit to me... Which is not 
going to solve much of anything.. TY, enjoy the rest of the weekend all.

On 2/6/2022 12:00 PM, Greg KH wrote:
> On Sun, Feb 06, 2022 at 09:57:15AM -0500, MP wrote:
>> Hello all,
>>
>>   Just looking for a bit of guidance here and a suggestion on proper next
>> steps. I think there may be an issue within the below broadcom nand driver
>> implementation.
>>
>> I have an Asus GTE-AX11000 and it reboots\crashes multiple times a week,
>> upon inspection of snmp logging you can see the below entries, when the
>> kernel panic occurs the entire router locks up, and sometimes reboots.
>> Sometimes it doesn't reboot and the router hangs completely and drops all
>> network devices, and removes wireless SSIDs and all of your devices lose
>> their connection.
>>
>> Not sure who to turn to but Asus support has not grasped the gravity of this
>> problem and I am thinking this can only really be resolved with a
>> firmware\driver\linux update, so just hoping for some additional help or
>> guidance from this group.
> This is a very old, obsolete, and known buggy kernel version running any
> number of unknown closed source kernel modules.  Only the manufacturer
> can help you here, there is nothing the community can do at all, sorry.
>
> Best of luck!
>
> greg k-h
