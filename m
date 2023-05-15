Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431721381
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 02:23:26 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso6364076a12.1
        for <regressions@lists.linux.dev>; Sun, 14 May 2023 19:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684117405; x=1686709405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ctYwXC1YUjZKdl7Y3ohGsN195nvG7PVKrDsBWnokCY=;
        b=qpWeXYthILdYqHwzqnI1i4dq+bWfLs+IuS6n/gF6Jx7onIIZTTOEzoFNPvwXKnI9y6
         vfz3LHKsbDSn+Zi06JO3XNnoqsZc/DoyRqxsMknwawgnZrqAJD0tdnDF4MVrRvCadeMf
         Eo2D/D47KRIoCcPUezFEEsIwTYijDbUNkpHDEZ4pVrjG4t5HSuUleYK5mkWga/44ou4T
         Wm0R/Vh5/83pJ+up1GB2OS3WL+dWAPfB8mCAtYaJIzuvlyayQl1ab1nBiIqMWSVzs/mq
         lnrqk5TlI8faUTNUdC6cDsFshd9/L0P5TV13R3iKHQKfFsme8N4Z96qk4KHRoqmuKNCr
         gclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684117405; x=1686709405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ctYwXC1YUjZKdl7Y3ohGsN195nvG7PVKrDsBWnokCY=;
        b=ger+ODXCNJzD4/4yQotTc+il/3oWdvnrgFgic6tHQQpcNqZjjRYhqOLVHiswnMR3XG
         oujFcYDLWTuAgW0UKUiz1/BwJhtHpWBPvqs7aGH8EYye8RY1oM19fwbk1+ewDLqNWv7l
         dZSwxoPLBO7kCkLsn4pUCgXWjgLIk8p+8sxOpfwTfry6DbSPrGANW54EcDMTfYMoiWbu
         PRJhnm70CLYm24qX2e3/QrcPtKFg4HJ9Jop1l1HTGCOGhfH1QfzPBeaCqhtBrp1xXg/e
         R9APNSwGPo02aSp46RZjJ0x09rgb3aXjgbUDh5EaM/CYxS/mr8Xygb5fB+xAOVOeItI8
         QY0w==
X-Gm-Message-State: AC+VfDzjI02Qc0crtWVGu87a/AMBWX7HJG6/4Qa5X33gJOIBV68e1oks
	FfEJOKCdwqGIk35R3qLbZxs=
X-Google-Smtp-Source: ACHHUZ5hvE1oOW0HR2n8p5NBw+2baxIFG6toJU18YluCfOM1aVCojT707But9JVCCZSdGUewI8ZuWQ==
X-Received: by 2002:a17:90a:9f44:b0:250:7273:cc3e with SMTP id q4-20020a17090a9f4400b002507273cc3emr27398431pjv.8.1684117405592;
        Sun, 14 May 2023 19:23:25 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-25.three.co.id. [180.214.233.25])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902da8b00b001aafde15ff3sm8316005plx.293.2023.05.14.19.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 19:23:25 -0700 (PDT)
Message-ID: <626d677d-ead7-7ec8-b91a-162c914fe1d5@gmail.com>
Date: Mon, 15 May 2023 09:23:20 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Content-Language: en-US
To: "Joseph C. Sible" <josephcsible@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: regressions@lists.linux.dev, kailang@realtek.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/23 04:48, Joseph C. Sible wrote:
> On 5/14/23, Takashi Iwai wrote:
>> The patch changes two places (the change in alc_shutup_pins() and
>> alc256_shutup()), and I guess the latter is the culprit.  Could you
>> verify that only reverting the latter fixes the problem?
> 
> Yes, only reverting the latter fixes the problem. I just tried a
> kernel consisting of 6.3.2 plus the below change, and it works fine:
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec *codec)
>         /* If disable 3k pulldown control for alc257, the Mic
> detection will not work correctly
>          * when booting with headset plugged. So skip setting it for
> the codec alc257
>          */
> -       if (codec->core.vendor_id != 0x10ec0236 &&
> -           codec->core.vendor_id != 0x10ec0257)
> +       if (codec->core.vendor_id != 0x10ec0257)
>                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> 
>         if (!spec->no_shutup_pins)
> 

Thanks for the fixup. Can you send it as proper patch for review?
See Documentation/process/submitting-patches.rst for instructions.

-- 
An old man doll... just what I always wanted! - Clara

