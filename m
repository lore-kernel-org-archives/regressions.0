Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C48BA53
	for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 08:27:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9829a5ae978so59644666b.2
        for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686904035; x=1689496035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SalSihqMLPtzIyuuTKaEAb4CYXiE1PWXJIIS5x5bFLo=;
        b=aFnBTsMNSDWDL+s8/PLotVo2dqsRSG/88z+9GTQYzBiP7zsdP5zuVpL2Mk+6lPUM0X
         57x/QHQPe5RUoHHX54t3/h8IaGrFeYLm2MqCSBZKaWdsHW1CsNth4KS1RLDPEfIY42kd
         XbLFgSn6xilTA8L6apDX1PJ3/Hznbf0gMu+TeQrHlvLtzD3nznd7DehEX4mrY8hZiDzo
         wv8WWtOSKPpUMG7YwiCnn8h1SwKcW7aKIVaLonc/EEj7ZDsUEzpBh7E+/SllpiDqSqaS
         6c6xDGjepYG5XgrGtszVcnfXAmFfGBRfDvIoOw0fgHXvT9XDTI6rDRB0ioqYa6qe9y4f
         J5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904035; x=1689496035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SalSihqMLPtzIyuuTKaEAb4CYXiE1PWXJIIS5x5bFLo=;
        b=hFpZjNTvcrtJjsSnIYSS0Jh01pEZP87QrUedeYsm4dWyqWJr1Lh7ZAWcDhDd1EMdMG
         j0jgA3J3ptfxs0bgIAIL4Rxl32Fdx3/hWQJ6B4WAqavEB0Q4LXL0yeZQHXJX6B8LNm2g
         fjUGipmFKxeSwjG0Sn76237YN2TcZrOG8Sisxg/LmBjY48xneHjf6p5wBw3czD8+YTgV
         uqPfJnkm8o4biD3n4+8JuFk9ZCA9ZVYwZsTLzmVWJ7JKZ1e99TQTEBSRDDU80/q3uGiE
         l/pEYz7X+pLEA4ezw5YY0QS56V4up9TArMqd9W+MLTrEN4wfhJxXXMro9MRigz2eUmXc
         5zHA==
X-Gm-Message-State: AC+VfDzn0z3IgLp1KEIw6O4gk5kdTbfOxFIYzmwC9EwgmY6wVBe2xtsj
	5fMA6nu4sIzXRCSEuHYf6tmUsA==
X-Google-Smtp-Source: ACHHUZ5cdvB6iF7YV+DEQL55UZ8AdMTJv+eLxXn27VC6oyxlt/Ce6HXJBButYotJL9zIiEQciZQcBw==
X-Received: by 2002:a17:907:2d28:b0:982:8bd5:4224 with SMTP id gs40-20020a1709072d2800b009828bd54224mr1434332ejc.45.1686904034627;
        Fri, 16 Jun 2023 01:27:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709066b1200b0096a6be0b66dsm10381979ejr.208.2023.06.16.01.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 01:27:14 -0700 (PDT)
Message-ID: <12d6b687-5e5a-bd7c-ff5c-007a74753edb@linaro.org>
Date: Fri, 16 Jun 2023 10:27:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes
 up
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info>
 <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
 <CAMi1Hd0=KV7k82ARadF45nqX+Cv6zPLCxfDvOyAPeXiFd8jpVA@mail.gmail.com>
 <0ec6c988-d678-c96c-a7a2-af38e6701404@linaro.org>
 <CAMi1Hd33_Ccxkf9C5_QBO3tvOZcGnYh+_CKcACUtoY2qAuOzRA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMi1Hd33_Ccxkf9C5_QBO3tvOZcGnYh+_CKcACUtoY2qAuOzRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2023 18:09, Amit Pundir wrote:
> On Thu, 15 Jun 2023 at 20:33, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/06/2023 15:47, Amit Pundir wrote:
>>> On Thu, 15 Jun 2023 at 00:38, Amit Pundir <amit.pundir@linaro.org> wrote:
>>>>
>>>> On Thu, 15 Jun 2023 at 00:17, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>>
>>>>> On 14/06/2023 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>> On 02.06.23 18:12, Amit Pundir wrote:
>>>>>>> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
>>>>>>> list to workaround a boot regression uncovered by the upstream
>>>>>>> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
>>>>>>> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
>>>>>>>
>>>>>>> Without this fix DB845c fail to boot at times because one of the
>>>>>>> lvs1 or lvs2 regulators fail to turn ON in time.
>>>>>>
>>>>>> /me waves friendly
>>>>>>
>>>>>> FWIW, as it's not obvious: this...
>>>>>>
>>>>>>> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
>>>>>>
>>>>>> ...is a report about a regression. One that we could still solve before
>>>>>> 6.4 is out. One I'll likely will point Linus to, unless a fix comes into
>>>>>> sight.
>>>>>>
>>>>>> When I noticed the reluctant replies to this patch I earlier today asked
>>>>>> in the thread with the report what the plan forward was:
>>>>>> https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com/
>>>>>>
>>>>>> Dough there replied:
>>>>>>
>>>>>> ```
>>>>>> Of the two proposals made (the revert vs. the reordering of the dts),
>>>>>> the reordering of the dts seems better. It only affects the one buggy
>>>>>> board (rather than preventing us to move to async probe for everyone)
>>>>>> and it also has a chance of actually fixing something (changing the
>>>>>> order that regulators probe in rpmh-regulator might legitimately work
>>>>>> around the problem). That being said, just like the revert the dts
>>>>>> reordering is still just papering over the problem and is fragile /
>>>>>> not guaranteed to work forever.
>>>>>> ```
>>>>>>
>>>>>> Papering over obviously is not good, but has anyone a better idea to fix
>>>>>> this? Or is "not fixing" for some reason an viable option here?
>>>>>>
>>>>>
>>>>> I understand there is a regression, although kernel is not mainline
>>>>> (hash df7443a96851 is unknown) and the only solutions were papering the
>>>>> problem. Reverting commit is a temporary workaround. Moving nodes in DTS
>>>>> is not acceptable because it hides actual problem and only solves this
>>>>> one particular observed problem, while actual issue is still there. It
>>>>> would be nice to be able to reproduce it on real mainline with normal
>>>>> operating system (not AOSP) - with ramdiks/without/whatever. So far no
>>>>> one did it, right?
>>>>
>>>> No, I did not try non-AOSP system yet. I'll try it tomorrow, if that
>>>> helps. With mainline hash.
>>>
>>> Hi, here is the crash report on db845c running vanilla v6.4-rc6 with a
>>> debian build https://bugs.linaro.org/attachment.cgi?id=1142
>>>
>>> And fwiw here is the db845c crash log with AOSP running vanilla
>>> v6.4-rc6 https://bugs.linaro.org/attachment.cgi?id=1141
>>>
>>> Regards,
>>> Amit Pundir
>>>
>>> PS: rootfs in this bug report doesn't matter much because I'm loading
>>> all the kernel modules from a ramdisk and in the case of a crash the
>>> UFS doesn't probe anyway.
>>
>> I just tried current next with defconfig (I could not find your config,
>> neither here, nor in your previous mail thread nor in bugzilla). Also
>> with REGULATOR_QCOM_RPMH as module.
>>
>> I tried also v6.4-rc6 - also defconfig with default and module
>> REGULATOR_QCOM_RPMH.
>>
>> All the cases work on my RB3 - no warnings reported.
>>
>> If you do not use defconfig, then in all reports please mention the
>> differences (the best) or at least attach it.
> 
> Argh.. Sorry about that. Big mistake from my side. I did want to
> upload my defconfig but forgot. Defconfig plays a key role because, as
> I mentioned in one of my previous email, it is a timing/race bug and
> if I do any much changes in my defconfig (i.e. enable ftrace for
> example or as little as add printk in qcom_rpmh_regulator code) then I
> can't reproduce this bug. So needless to say that I can't reproduce
> this bug with default arm64 defconfig.
> 
> Please find my custom (but upstream) defconfig here
> https://bugs.linaro.org/attachment.cgi?id=1143 and prebuilt binaries
> here https://people.linaro.org/~amit.pundir/db845c-userdebug/rpmh_bug/.
> "fastboot flash boot ./boot.img-6.4-rc6 reboot" and/or a few (<5)
> reboots should be enough to trigger the crash.
> 
> I have downloaded the initrd from here
> https://snapshots.linaro.org/96boards/dragonboard845c/linaro/debian/569/initrd.img-5.15.0-qcomlt-arm64
> but edited ramdisk/init to run "load_module" function early in the
> boot and ramdisk/conf/initramfs.conf has "MODULES=list" instead of
> "MODULES=most", where all the kernel modules are listed at
> /etc/initramfs-tools/modules.

So you have interconnect as module - this is not a supported setup. It
might work with if all the modules are loaded very early or might not.
Pinctrl is another driver which should be built-in.

With your defconfig I see regular issue - console and system dies
because of lack of interconnects, most likely. I don't see your WARNs -
I just see usual hang.

See:
https://lore.kernel.org/all/20221021032702.1340963-1-krzysztof.kozlowski@linaro.org/

If you want them to really be modules, then you need to fix all the
dependencies (SOFTDEP?), probe ordering glitches. It's not a problem of
DTS. Just because something can be built as module, does not mean it
will work. We don't test it, we don't work with them as modules.

It's kind of the same as here:
https://lore.kernel.org/all/ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com/

I understand that we might have here regression, if these were working
as modules, but I don't think we ever really committed to it. We can as
well make it non-module to solve the regression.

Best regards,
Krzysztof

