Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F31865
	for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680081742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnQgiE2seslOmri+mINL03bE7wmcbXexDhZ7sWwtei8=;
	b=YTnPDjfxpSpjXsya72Exwn1pBDvtnX4q91vSR7p/873npH5TsyobheMGss2Zew+Nc3zAsf
	IRbqzydBvON6DfAGHCpzUmJ4sR/SOd8UsTmlotRgVb/T+lCVPsxRdrv9c3tz9QIisUhHyP
	7BhEOjmy6SEbfyRnjZC6bMRqrKHVY04=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-TAteIYBoNlyJwmU89Nc8uA-1; Wed, 29 Mar 2023 05:22:21 -0400
X-MC-Unique: TAteIYBoNlyJwmU89Nc8uA-1
Received: by mail-ed1-f70.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so21329331eda.5
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680081740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnQgiE2seslOmri+mINL03bE7wmcbXexDhZ7sWwtei8=;
        b=XIGIpbAlJxXy5gLONz+Fq6fhWK/zwx9XzvFl49npGkvbI9+LuU/3GgKMedl4CD2Xx5
         syo0B3L9H/s/tEHsaLnI2eCZf+CDNNg70yTTH+bA20i/kdyDvBtVFK5MjFEeVO5+MDcP
         ToykDmXBEEZZqIuy3ZSwYxYJmaAEBjpiMl0VS4jQ38JDSjqXtL1IxZAhy1Imzbol28IJ
         BBbOda3Y1Qo/gziZPrFyd16cSiqOJtdzwaJhDR3DAOAMcV15CEtZTUkuK34BOEzfJ1uI
         +ShQv2roDtaY8p8V69b+Nd3zczamvL0OlqqaXgSvtR31dzNNJetUFLE78t9aMQFPpmGC
         1c4A==
X-Gm-Message-State: AAQBX9c/moxPgNhGPvyhnP8HSanGlotWWb3jJKL/8I+haCH90xUyoc6W
	KpKXV1Awg595W4h80ncMOH2Fjt/KMnz4FJZ0+aWmByy8AXXolxCd5FyMRug7NtVcZxyMEdGa+zK
	v8bBB9jhyk9kP80y21tNxRw8=
X-Received: by 2002:a17:906:4a55:b0:92f:a0d5:211c with SMTP id a21-20020a1709064a5500b0092fa0d5211cmr16224790ejv.35.1680081740366;
        Wed, 29 Mar 2023 02:22:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350YCg597ErLnj2rX3slo8f8H8UafW8Jx4GKqVYjjTtDQJ7gKBV0XWnScXpjtKQmI/aWyDjN7jA==
X-Received: by 2002:a17:906:4a55:b0:92f:a0d5:211c with SMTP id a21-20020a1709064a5500b0092fa0d5211cmr16224776ejv.35.1680081740129;
        Wed, 29 Mar 2023 02:22:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c25-20020a50f619000000b004bd6e3ed196sm16970687edn.86.2023.03.29.02.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 02:22:19 -0700 (PDT)
Message-ID: <3dec29bf-b772-d82d-fff9-6c8bcca5f464@redhat.com>
Date: Wed, 29 Mar 2023 11:22:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [REGRESSION] wrong coord from Thinkpad TrackPoint since 6.2
 kernel
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: regressions@lists.linux.dev, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <87h6u4otuc.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87h6u4otuc.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Takashi,

On 3/29/23 10:16, Takashi Iwai wrote:
> Hi,
> 
> we've received a bug report about Thinkpad TrackPoint (ALPS DualPoint
> Stick) on 6.2 kernel:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1209805
> 
> The device reports the wrong values as the movements, e.g. sometimes a
> value such as 255, 254 or -255 is returned while usually it should be
> a smaller value like -1 or 2.
> 
> The evtest on 6.2.x kernel shows the wrong values like:
> 
> Event: time 1680037542.898747, type 2 (EV_REL), code 0 (REL_X), value 255
> Event: time 1680037542.898747, -------------- SYN_REPORT ------------
> Event: time 1680037543.145196, type 2 (EV_REL), code 0 (REL_X), value 1
> Event: time 1680037543.145196, -------------- SYN_REPORT ------------
> Event: time 1680037543.175087, type 2 (EV_REL), code 1 (REL_Y), value -255
> Event: time 1680037543.175087, -------------- SYN_REPORT ------------
> Event: time 1680037543.185421, type 2 (EV_REL), code 0 (REL_X), value 1
> Event: time 1680037543.185421, type 2 (EV_REL), code 1 (REL_Y), value -255
> Event: time 1680037543.185421, -------------- SYN_REPORT ------------
> 
> while 6.1.x kernel shows the correct values like:
> 
> Event: time 1680037386.318058, type 2 (EV_REL), code 0 (REL_X), value -1
> Event: time 1680037386.318058, type 2 (EV_REL), code 1 (REL_Y), value -1
> Event: time 1680037386.318058, -------------- SYN_REPORT ------------
> Event: time 1680037386.328087, type 2 (EV_REL), code 0 (REL_X), value -1
> Event: time 1680037386.328087, type 2 (EV_REL), code 1 (REL_Y), value -1
> Event: time 1680037386.328087, -------------- SYN_REPORT ------------
> Event: time 1680037386.338046, type 2 (EV_REL), code 0 (REL_X), value -1
> Event: time 1680037386.338046, type 2 (EV_REL), code 1 (REL_Y), value -2
> Event: time 1680037386.338046, -------------- SYN_REPORT ------------
>   
> I couldn't see any relevant changes in alps.c between those versions,
> so this is likely a breakage in a lower layer.
> 
> Could you guys take a look?

I believe this is caused by the kernel now using -funsigned-char
everywhere and this should be fixed by this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab

And there is a similar issue in the focaltech touchpad driver:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=8980f190947ba29f23110408e712444884b74251

Dmitry, since this is hitting 6.2 users, perhaps you can send
a pull-req for your current for-linus branch to get the fix
on its way to stable ?

Regards,

Hans




