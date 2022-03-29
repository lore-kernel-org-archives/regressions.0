Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320929A2
	for <regressions@lists.linux.dev>; Tue, 29 Mar 2022 21:34:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id k21so32554519lfe.4
        for <regressions@lists.linux.dev>; Tue, 29 Mar 2022 14:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=phALv9mY0wITJH6lJS6EVyuXuWVc0bzsLfvwtVve004=;
        b=E1sNVQUgcCs1YlYBuXLH9oWXstFhkuBfb996QIHwQijCyxUljxyVeCWzy8R3i0vRmk
         QuPSyqF1xU+p8XqZG7qIB+ooUtyAySCobuC83AdhgLDv1C6OffZ5JRAcHl8h9Yamg1ti
         NoShiuABosOiFa2MfhkBIXahRdOfVn/whImZwvyaeTrUngcZMj6MPXsnRmi2AxXaP8If
         SvyxqAMhkTOWQTWCg5pNQvgpz/U7wHhM9LmpOxYcvM5b+mrxucR63zLP/cwYRmrC/r6M
         CRPq9Ra0XQBtTPbrr+l7MF/KyxnmlmzkBhGohe3flNkrF/tyjvZHOKH1Dy/RqKWa1Q0t
         snTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=phALv9mY0wITJH6lJS6EVyuXuWVc0bzsLfvwtVve004=;
        b=r3U9aalFdx7LfpPocVrQOQSL9zc4gfhTy+pcDsuYNHy79iqpMohDmFwYOvS6VOXckH
         9bdAwAOPokqCrrG1j/QjxVbCw68ZPs6QGtVopRmJFQ4mhcrhSAXxzxthuuTLzWSOYVt9
         vnWen1gMhwf6vlxenUFamNAwIK0FOsnoXxjsO5cft5/q3P36EW9RTQ1Oj4fwGjYhzxat
         E/0M8IlqNNJvGxg6zHD6wQK8eoKZh3f+Mz/vme/XMxR8b7nBbi/aHcDxJnPYCgs2r7vU
         XW6bMQkLTPgZTYiHpyiG+YshBrM5/k7kD2oB2mj1aDAaGtXGY/scGjhjDVP6V4ia2dOu
         ypSw==
X-Gm-Message-State: AOAM531phWozlSdH7eN7A2RVzqh3QsEFHMSuWDqKH0woFbba937gPQm1
	vWtyRG5vPOlv8TiGAhMinGY=
X-Google-Smtp-Source: ABdhPJygl7RpwWEJA7JHCK5Gy8tSqC5GhaXKLrCdbJbTw3pohtg4V8j6NJPgcz2XJeyLop4nodEL4A==
X-Received: by 2002:a05:6512:13a9:b0:448:9dd3:b84 with SMTP id p41-20020a05651213a900b004489dd30b84mr4470218lfa.556.1648589638575;
        Tue, 29 Mar 2022 14:33:58 -0700 (PDT)
Received: from [192.168.1.2] (235.132.246.94.ip4.artcom.pl. [94.246.132.235])
        by smtp.googlemail.com with ESMTPSA id b14-20020a19670e000000b0044a3adf07d3sm2117198lfc.64.2022.03.29.14.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 14:33:58 -0700 (PDT)
Message-ID: <57df6bed-3b74-df63-0c5c-7218aef8534b@gmail.com>
Date: Tue, 29 Mar 2022 23:33:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Bug 215726 - si2157.c: mention name of the missing firmware file
Content-Language: pl-PL
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Antti Palosaari <crope@iki.fi>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Robert Schlabbach <robert_s@gmx.net>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 az0123456@gmx.de, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <5f660108-8812-383c-83e4-29ee0558d623@leemhuis.info>
From: Piotr Chmura <chmooreck@gmail.com>
In-Reply-To: <5f660108-8812-383c-83e4-29ee0558d623@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

It's supposed to be fixed by:
https://lore.kernel.org/linux-media/trinity-6009a608-b0ff-4e1a-9b91-ba4a97f10324-1648057812747@3c-app-gmx-bs71/T/#t

Test it please.

Best regards,
Piotr Chmura

W dniu 29.03.2022 o 10:33, Thorsten Leemhuis pisze:
> Hi, this is your Linux kernel regression tracker.
>
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=215726 :
>
>> I get the following error messages when trying to use si2157.ko in linux 5.17:
>> si2157 13-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
>> si2157 13-0060: Can't continue without a firmware
>> I did work in linux 5.16.16 without a firmware file. Unfortunately the driver does not tell me the name of the missing firmware file.
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
>
> Anyway, to get this tracked:
>
> #regzbot introduced: v5.16..v5.17
> #regzbot from: az0123456@gmx.de <az0123456@gmx.de>
> #regzbot title: media: si2157.c: mention name of the missing firmware file
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215726
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
>

