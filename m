Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC6D303
	for <regressions@lists.linux.dev>; Thu, 25 May 2023 10:55:51 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d2e8a842cso1572670b3a.3
        for <regressions@lists.linux.dev>; Thu, 25 May 2023 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685012151; x=1687604151;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjU9i+ZYM/HNSnAs/618Ff78enf67mpHrMCpLJib6CU=;
        b=k/L4FprDp8LWVHX1ZeHJ851f7uGMIooBVgX3nXVovC4l4i0ceKKaEq8NOtoXrY9Mu9
         ObUWOww2jDwsmtlaCo5jKwSN9GvtPhxE5QFRy1TFg8XhMk3U9LYuKcHd6Zn6Y3RA5sXe
         095cWozRhevuejiRm+i9dvcEQIumMRRqTHDMcZhEQZj9590larlbYxMsKweVf04ip4nK
         //Vhwproo0k2kEEk+pLeDu3ZrSjZLOEmUzCIrEcjQMi7tTnVFM11h4tGt0xL7E/kV1oZ
         L0Ced+vFvhanp2PYezIkDR1lX9UkRqOjjaRpJhKtipGQRwP8FrejFjfDIXrVlSGEKvCL
         v7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685012151; x=1687604151;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjU9i+ZYM/HNSnAs/618Ff78enf67mpHrMCpLJib6CU=;
        b=ZM2Lr5ufQFTXec9oQ8CxLLYKfm+mzKilaujWQn+EGGg+1xef/g1XLCOnb9HqohPB9y
         ZKPv+Uld2cDWCwXWvAg3OYxzLdTIwtX0iNmFzz4/0SBcIJyC0bNpqIiKoy9sWVvJ/61s
         6HPp0y9bt/7L3dxoaIfOMRCnBJlFlCg7FnGKSUEzgFLNwRimVrFkCQugBrXhEZjIhub/
         elIPrFQI+eSBpADhL1KAByzxya18/pc7FU2VtfVtOWbAmat21cCpq/Epje5O9yl6HyWC
         y0vx/hRPrcZc63KLMbQ2qQxjp+n2syJ0vFSx2O2KRZIOOsF4/Eje9Kom2gl8ctyARfUm
         bgkA==
X-Gm-Message-State: AC+VfDxmetPxl4sox2EfLVLhI3RD4MJ8pFWP94q57GvdhjmF/BU9FBjO
	gRDo6tIwA/mNlMKB9YxwW/s=
X-Google-Smtp-Source: ACHHUZ7J1KrU2nbIGIVFBiD5pUMC6fZk6Fpj90bK6EfiKYf2MKIx6zIFpvjf3+DyDq37dl/D6Sv9YA==
X-Received: by 2002:a17:902:e808:b0:1a9:581e:d809 with SMTP id u8-20020a170902e80800b001a9581ed809mr1603287plg.7.1685012150744;
        Thu, 25 May 2023 03:55:50 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902eac200b001ac69bdc9d1sm1137187pld.156.2023.05.25.03.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 03:55:50 -0700 (PDT)
Message-ID: <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
Date: Thu, 25 May 2023 17:55:45 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: absent both plymouth, and video= on linu lines, vtty[1-6]
 framebuffers produce vast raster right and bottom borders on the larger
 resolution of two displays
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Antonino Daplas <adaplas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Felix Miata <mrmazda@earthlink.net>
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
In-Reply-To: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/25/23 17:52, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> Original Summary:
>> absent both plymouth, and video= on linu lines, vtty[1-6] framebuffers produce vast raster right and bottom borders on the larger resolution of two displays
>>
>> To reproduce:
>> 1-connect two unequal native resolution displays to a Tesla or Firmi GPU
>> 2-don't have plymouth in use (I don't ever have it installed, so don't know whether it impacts)
>> 3-don't include e.g. video=1440x900@60 directive on Grub's linu lines
>> 4-boot Tumbleweed or Fedora 38
>> 5-switch to a vtty, e.g. Ctrl-Alt-F3
>>
>> Actual behavior:
>> 1-Both displays utilize the resolution (same pixel grid) of the lower resolution display
>> 2-Lower resolution display behaves as expected (light text on black background)
>> 3-Higher resolution display uses same pixels as lower resolution display, with light text on black background, leaving right side and bottom raster instead of black
>>
>> Expected behavior:
>> 1-Both displays utilize the resolution (same pixel grid) of the lower resolution display
>> 2-Lower resolution display behaves as expected
>> 3-Entire higher resolution display's background is black instead of portions in raster
>>
>> Workaround: add e.g. video=1440x900@60 to Grub's linu lines, which causes both displays to use the same nominal mode on the full display space.
>>
>> Typical other linu line options:
>> noresume consoleblank=0 net.ifnames=0 ipv6.disable=1 preempt=full mitigations=none
>>
>> My Tesla has HDMI and DVI outputs, tested with 1920x1200 and 1680x1050 displays.
>> My Fermi has dual DisplayPort, tested with 2560x1440 and 1680x1050 displays.
>> Occurs Tumbleweed with 6.3.2 and 6.2.12 kernel-default, and with 6.2.15 on Fedora 38, and (partially with Tesla, right side only) with 6.2.12 and 6.3.3 on Mageia 9.
>> Does not occur with 6.1.12 kernel-default on NVidia, or with AMD Caicos (Terascale2) GPU, or with Intel Eaglelake GPU.
>> Tested only on legacy booting (no UEFI support).
>> Others might describe what I call "raster" as multicolored snow.
> 
> See bugzilla for the full thread and attached dmesg.
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: v6.1.12..v6.2.12
> #regzbot title: vast raster right and bottom borders on larger display (two displays with inequal resolution) unless forcing resolution with video= parameter
> 

Oops, I forget to add bugzilla link:

#regzbot introduced: v6.1.12..v6.2.12 https://bugzilla.kernel.org/show_bug.cgi?id=217479
#regzbot from: Felix Miata <mrmazda@earthlink.net>

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

