Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843321803E
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 16:24:04 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4474c7fce20so996258137.3
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20221208.gappssmtp.com; s=20221208; t=1691166243; x=1691771043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmkPH1Bvr/jHuXA813MIlzTOyB5g7yoVu7rMhg38M04=;
        b=XnI4Z6pkgjcmwtZpv8x6FMkee1/nibtf7Ma/Bxz1Z3xMUHTxRp7FGYhpBQudDChZXX
         qP+kzEQ9lw5o8Yj/sUnF7h5Wb82rIzuxXhfPad0xDXifitsP4yRPzL270zEf5zVZgfwt
         1eDuI5+7HvHW1qWSAfkz8yQWcQsDdT1mIIsPfclZx654XRFuZg0xSCLKm1ql0koFaDYw
         L2Ju/zD2mZEl2v6c+79OyU/DnpOvN7hlw5K3aPENfkdXLdQ0/pAGpggRTiq/CaaxFRwM
         1s7QOW8h3djqEk9l6jc4o9QJbDcDP2wJwwkmJGxa2+vbtpxfNzoXRrJQNdIuP/AfpcSM
         mx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691166243; x=1691771043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmkPH1Bvr/jHuXA813MIlzTOyB5g7yoVu7rMhg38M04=;
        b=K/MtgwouTvn6Co4NZnQ7ufi/tyUYs20ArGRIvYEHfTw5bJ4HEzD74hvMW4pXQngRC9
         5jGZbHLTH9jfS4pMspvHEp3uLKf+HMtF1oAOTqJ0OLrmO8f9d/RI6sSX5rgY/NkAx6tN
         BZU2DkcIoRThk/SJ2WgkuXAeCiXQqqZ1B71pUhWKirlhNHMucv0ooPUPImDg3OCtcKfG
         m8/z4ypOmhCjFv/DBu+VE2EogGVsdpB5oOpBcPR52bNUBZobe2UGOZ8n130hNH1sBr01
         zK4eUrbT8yUlbjjrfEm1hziY9+j759RQ+2ndhPNK04rLHm7al6EhLkvvc0TBYaDyJ6wJ
         CBEg==
X-Gm-Message-State: AOJu0YwTGr4gR9M2bDsqxbS88kIGUxcNulJluSC2cd0AyiTeJimYSya8
	kHdhQu/iOJb3nu1i54uF97fjPVU0ba8u+53qDVYU+w==
X-Google-Smtp-Source: AGHT+IGI+M2wXRRcEDRe0zlkG6F9e0Pa2pCE+U3TAl/AgeY1J+EybttwtFgXosRog6vBFBA4Gmufj5GHXTGOx1DCYnc=
X-Received: by 2002:a67:cd0a:0:b0:447:c1fd:4846 with SMTP id
 u10-20020a67cd0a000000b00447c1fd4846mr1835625vsl.22.1691166243247; Fri, 04
 Aug 2023 09:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6209:0:b0:794:1113:bb24 with HTTP; Fri, 4 Aug 2023
 09:24:02 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
In-Reply-To: <CAL_JsqLrErF__GGHfanRFCpfbOh6fvz4-aJv32h8OfDjUeZPSg@mail.gmail.com>
References: <CADyTPEzqf8oQAPSFRWJLxAhd-WE4fX2zdoe9Vu6V9hZMn1Yc8g@mail.gmail.com>
 <CAL_JsqLrErF__GGHfanRFCpfbOh6fvz4-aJv32h8OfDjUeZPSg@mail.gmail.com>
From: Nick Bowler <nbowler@draconx.ca>
Date: Fri, 4 Aug 2023 12:24:02 -0400
Message-ID: <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
Subject: Re: PROBLEM: Broken or delayed ethernet on Xilinx ZCU104 since 5.18 (regression)
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 04/08/2023, Rob Herring <robh@kernel.org> wrote:
> On Fri, Aug 4, 2023 at 9:27=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> w=
rote:
>>   commit e461bd6f43f4e568f7436a8b6bc21c4ce6914c36
>>   Author: Robert Hancock <robert.hancock@calian.com>
>>   Date:   Thu Jan 27 10:37:36 2022 -0600
>>
>>       arm64: dts: zynqmp: Added GEM reset definitions
>>
>> Reverting this fixes the problem on 5.18.  Reverting this fixes the
>> problem on 6.1.  Reverting this fixes the problem on 6.4.  In all of
>> these versions, with this change reverted, the network device appears
>> without delay.
>
> With the above change, the kernel is going to be waiting for the reset
> driver which either didn't exist or wasn't enabled in your config
> (maybe kconfig needs to be tweaked to enable it automatically).

The dts defines a reset-controller node with

  compatible =3D "xlnx,zynqmp-reset"

As far as I can see, this is supposed to be handled by the code in
drivers/reset/zynqmp-reset.c driver, it is enabled by CONFIG_ARCH_ZYNQMP,
and I have that set to "y", and it appears to be getting compiled in (that
is, there is a drivers/reset/zynqmp-reset.o file in the build directory).

However, unlike with the other firmware devices, I do not see this driver
under /sys/bus/platform/drivers, and there is no "driver" symlink under
/sys/bus/platform/devices/firmware:zynqmp-firmware:reset-controller

Is there some other config option that I need?  Is the reset driver just
completely not working?

>> Unfortunately, it seems this is not sufficient to correct the problem on
>> 6.5-rc4 -- there is no apparent change in behaviour, so maybe there is
>> a new, different problem?
>
> Probably. You might check what changed with fw_devlink in that period.
> (Offhand, I don't recall many changes)
>
>> I guess I can kick off another bisection to find out when this revert
>> stops fixing things...
>
> That always helps.

I'll do that.

Thanks,
  Nick
