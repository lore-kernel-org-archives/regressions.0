Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC81C14
	for <regressions@lists.linux.dev>; Tue, 25 Oct 2022 13:37:08 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id r204so11402156oie.5
        for <regressions@lists.linux.dev>; Tue, 25 Oct 2022 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jYA4CRt7QwFxQ2WJSL+6qpHoqAMY4yfe7v64iFTEeg=;
        b=KMv+Ujbtf9SE9T3fWLARgIMD8dbNUhfiDS39mJbUVKWDXSkcfY17IW89WFcRZi1/YC
         fSSRRIbACOz6R3JKItclWb9tEY/GClRIlEFt4ybhrL4YZ5YaKsEmAwfyEobi8mI/yjZe
         uHMejs5tRKWe1U1Ko2LFB60OSVUGL0RJKhbo9omuEYfIFy7SXMX6oRWri/hCZR2SRYlA
         G5j+shdwHTAyzGGAcG5XPmIEhOD/iklVUHI7KVAZgnWkPpS7cNKTG8oWSyINMZkHivw3
         iiQwEpj4SEmukIZiS9GdSYD3DtueSQT1jUQNd//LNQZ7xJ2l1GLSF0pYpJEcc+DQZZE0
         fjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYA4CRt7QwFxQ2WJSL+6qpHoqAMY4yfe7v64iFTEeg=;
        b=JEtLqSTasAJ5MviaOmlzqNZbXoX55nybXNCfWhtnjbReXi5J6VCtJuAUaMMFAwKWad
         vLTwFVt4lVtWPTvrKJWoicH1iOmwnO1nECvY7pqjcm6nNG1+fpJodKEPrMgGmkPbS/0g
         /VFgW6v1ywkqOEmC+o8fWfrK073AWy+t+CQSySWGYQ58z3X11kGTPykF0FApceT3TdVI
         fEv1thW1hSGM71yxfIUUrO71SdB6baa/R/B9fJv7l5zhoJFd2T9sMmpJR9F7rdt50BAO
         jtX5sZBvP2kflGkxxa3iibL8gs/vrxGZPfgGs6fgvwgSUCki7fmsK80APFiLfIH59dFn
         GCSQ==
X-Gm-Message-State: ACrzQf1wVCL46MZWayDQuBLeS/62HQqZ00pQwLUp6Zt1yEeYDYQ+zrBl
	KiKi1v73q3orbFIDx39+PaDJDOmTo7I=
X-Google-Smtp-Source: AMsMyM5WKNa9inG277X3WE+Hxvew5Iq1MaPP04sOO3fCVaaTKDsT4e9kpQ4vtyQvvbEj6fjBB87kGQ==
X-Received: by 2002:a05:6870:d79b:b0:130:f29c:b54c with SMTP id bd27-20020a056870d79b00b00130f29cb54cmr22926276oab.125.1666705016366;
        Tue, 25 Oct 2022 06:36:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i11-20020a54408b000000b00354b575424csm938403oii.29.2022.10.25.06.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 06:36:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5373483d-adde-2884-6017-75f3bd25d6bc@roeck-us.net>
Date: Tue, 25 Oct 2022 06:36:52 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Christian Bach <christian.bach@scs.ch>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <ZR0P278MB0773545F02B32FAF648F968AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
 <ZR0P278MB0773072DD153BA902AFE635AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
 <Y1fYjmtQZa53dPfR@kroah.com>
 <ZR0P278MB077321F8565A4FF929B132A1EB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: AW: tcpci module in Kernel 5.15.74 with PTN5110 not working
 correctly
In-Reply-To: <ZR0P278MB077321F8565A4FF929B132A1EB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/25/22 05:48, Christian Bach wrote:
> Thank you for answering. I did try a Kernel from 1 year ago (11. December 2020 - with the Hash b5206275b46c30a8236feb34a1dc247fa3683d83). But this Kernel had the exact same behavior.
> I even wanted to go back further the when the tcpm module got it's own subdirectory (v4.20 - 20. September 2018 - Hash ae8a2ca8a2215c7e31e6d874f7303801bb15fbbc) to see if it still worked at that time but my build system was not able to build it.
> 

Greg asked for you to test with a v5.4.y kernel. ae8a2ca8a221..b5206275b46c30a82
is again a pretty large step with more than 100 commits in the drivers/usb/typec/tcpm/
directory.

Also, it might be useful to provide the respective kernel logs.

Thanks,
Guenter

> -----Ursprüngliche Nachricht-----
> Von: Greg KH <gregkh@linuxfoundation.org>
> Gesendet: Dienstag, 25. Oktober 2022 14:38
> An: Christian Bach <christian.bach@scs.ch>
> Cc: stable@vger.kernel.org; regressions@lists.linux.dev; linux@roeck-us.net; linux-usb@vger.kernel.org
> Betreff: Re: tcpci module in Kernel 5.15.74 with PTN5110 not working correctly
> 
> [You don't often get email from gregkh@linuxfoundation.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Tue, Oct 25, 2022 at 12:19:39PM +0000, Christian Bach wrote:
>> Hello
>>
>> For a few weeks now I am trying to make the PTN5110 chip work with the new Kernel 5.15.74. The same hardware setup was working with the 4.19.72 Kernel. The steps I took so far are as follows:
> 
> That is a huge jump.  Why not use 'git bisect'?
> 
> Or start with a smaller jump.  Why not go to 5.4.y first, that's only a year's worth of changes, instead of 4 years of changes.
> 
> thanks,
> 
> greg k-h

