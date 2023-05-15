Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B83A937
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684141023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOmPAdOjTw0+fn4Xbj1cUOUc0rHyTV5xc4HudNudDw4=;
	b=fqhCESygieyIjjHRxyoZn11vJybAYu7eys9LletZl8/LzGUxu6AEBvnwQ0XxE+Be6mtPhJ
	Yrqy+zZx6h4OaYh7wgV3nebi6+uVCbXzr+KtN02MOQ+xW41UG+hRoPwqCtM83ZcFU1FpSH
	nUJAG9mDLbRhb1IKjoicvIH6cZ7JmYU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-Mu7Zl2MMOgGLkGzrGa8QFg-1; Mon, 15 May 2023 04:57:00 -0400
X-MC-Unique: Mu7Zl2MMOgGLkGzrGa8QFg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso1580148466b.2
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 01:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684141019; x=1686733019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOmPAdOjTw0+fn4Xbj1cUOUc0rHyTV5xc4HudNudDw4=;
        b=LBjHLyjtNcYBd8jL1WKIrl8mTgWyYn7GdEoNZfqkk1YA6kF60LA/vfKxq/LoeQrHd3
         sKtV7ZdBftUWb+8j9W9Z8m+iehzi7UJNlswAazJQpeUjix9+J8dhViKSAYDl6q3u9ZsT
         snwc/2no1sl5jxwJVIt+bdn+Qbbdlzgh6RH0Rcwo6PFmi1A5Q04StQdPZ/81Nysp8ftB
         eacSqibzz9krIOfTPchX39PRV3ac9D3uuKiesA52u8qEOVCpLP70Y+WGfng+Hd8G+7xD
         u9x4IoXigiOwr5Q1LKUE4tmlAEPnhGUHkMDGCvr9Y6158QXtSlbSPGoAG/HkHOwwdjvY
         Igqg==
X-Gm-Message-State: AC+VfDyX2sQ3lPYSu5R9WFtbejUz4HQbgFhdgcejqEQhn7slpRGyGYSw
	192S5Ucr8N4mZzrcwDQjFLHzk44+ZjkRglGlSAfVCVojD/tUxt9grT1WLGwG3H8wmNeUiSBuvGz
	7EdfNA+bgQIbmHr1h3dbCU+Q=
X-Received: by 2002:a17:907:629b:b0:94e:2db:533e with SMTP id nd27-20020a170907629b00b0094e02db533emr29845032ejc.49.1684141019379;
        Mon, 15 May 2023 01:56:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6huIguzGMh5b7eclldzzWFH1scw2tuhsvPlcXGbQtacAwciuSYhOs0prmIiuEpUaL8qGZ5Zw==
X-Received: by 2002:a17:907:629b:b0:94e:2db:533e with SMTP id nd27-20020a170907629b00b0094e02db533emr29845007ejc.49.1684141018980;
        Mon, 15 May 2023 01:56:58 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kn3-20020a1709079b0300b0096a27dbb5b2sm7152565ejc.209.2023.05.15.01.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 01:56:58 -0700 (PDT)
Message-ID: <f629341e-5920-8061-6120-cb954d22ffe9@redhat.com>
Date: Mon, 15 May 2023 10:56:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: Freeze after resuming from hibernation (culprit is brcmfmac
 change?)
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Broadcom 80211 Devices <brcm80211-dev-list.pdl@broadcom.com>,
 SHA cyfmac Subsystem <SHA-cyfmac-dev-list@infineon.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>
Cc: Hante Meuleman <hante.meuleman@broadcom.com>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, julien.falque@gmail.com
References: <018f62d0-ee1d-9198-9c38-e45b10921e2e@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <018f62d0-ee1d-9198-9c38-e45b10921e2e@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/15/23 04:21, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on bugzilla [1]. Quoting from it:
> 
>>  julien.falque@gmail.com 2023-05-14 09:55:38 UTC
>>
>> Since a Kernel update a few weeks ago, my laptop freezes when resuming from hibernation. It seems to handle the resume process normally but at the moment I should see Gnome login screen, I either get a black screen with just a white underscore instead, or nothing displayed at all (no backlight). I can't do anything at that point and I have to hard reboot.
>>
>> Steps to reproduce:
>> - hibernate
>> - resume
>> - wait until the resuming process should finish: black screen instead of e.g. Gnome's login screen
>>
>> journalctl gives nothing between the beginning of the resume and the crash, as if it never happened.
>>
>> I have a Dell XPS 15 (9550) with Arch Linux. The issue happens on linux (since v6.2.0 I think) but linux-lts (currently v6.1.28) is fine.
>>
>> A bisect on linux-git gave commit da6d9c8ecd00 as the cause of the problem.
> 
> See bugzilla for the full thread.
> 
> Julien: I asked you to also provide dmesg log as I don't know
> what exactly happened, but you mentioned the culprit was
> da6d9c8ecd00e2 ("wifi: brcmfmac: add firmware vendor info in driver info"),
> which implies that the crash involves your wifi device. From my experience
> though, GDM crashes are usually caused by xwayland.
> 
> Anyway, I'm adding this to regzbot:
> 
> #regzbot introduced: da6d9c8ecd00e2 https://bugzilla.kernel.org/show_bug.cgi?id=217442
> #regzbot title: brcmfmac firmware vendor info addition triggers GDM crash on resuming from hibernation

da6d9c8ecd00e2 is known to cause a NULL pointer deref on resume,
which is likely what is happening here. This is fixed by:

https://lore.kernel.org/regressions/20230510141856.46532-1-hdegoede@redhat.com/

This patch is ready for merging and is waiting for the wireless-maintainer
to merge it and send it to Linus.

Regards,

Hans


> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217442
> 

