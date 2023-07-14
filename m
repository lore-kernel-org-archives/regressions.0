Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B41C35
	for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 06:34:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e292cf214so1825886a12.2
        for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 23:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689316460; x=1691908460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS1AOO8wrdMOqrn4/eZWq/2oCOWchIFR7dxMKy3TfmM=;
        b=orGs/LPJgNswnrHBOwwEO7UnM2tFFR3bJIYvjZboyfGcsofoaV55VWIXrpMhVUeZRv
         K6DYJF2EVq7rTwZpIpbU5o+Kvbge+h/EIZ8Ke9dOecE4N7YgmplrERVYBLqnCepDwPn3
         WODv/yTnfKMJLdVweyUyfPs2y4nxpom0sbfP4rm0vSBE+OLjsLKYSCsO4nrbU8ss4nG7
         gormcZnf1s7GQfkCZpcs7OwXEbJOxssZFbvBSIu0Ldg/Wk5+sscs49hkvlun7ACmXHTN
         HQkI9T7juWBF4BSLIQjuJ6tTnc4cOqqlY9dX+jUpoOGSYuYnxEtISUnSjLPNzt9M4J+S
         Gd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689316460; x=1691908460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS1AOO8wrdMOqrn4/eZWq/2oCOWchIFR7dxMKy3TfmM=;
        b=X9N4ZrHoCjZzXgrkxKSW4Hs7vKnJXT3J9bbMlukkrymubaXV+AXkhUbonYnoEGw0W+
         0o79wWyWsZ7wwlspKHdsCtTw+/Xto/4T9O+WBRRUM5o4QP8aZXVAI8sIWdQv88jJiZcU
         TAREvGSf7XhdANryguML8suaokRxw5WgusnvtMIzRfmqvV+oAJYpdIE/g6svDe1K7wXY
         5l0GYJmbsy0D2eYo13E23QQAa9zgTlmyqSkuUz/oBBFgTz+av9RHryFHSPTZYVKaCiTZ
         FozbLOtXNkJ7vet+yDzcxVlA+833bP31ujYSo0uIMj1SQ/apyls+H+zSV91h2KqHxjz2
         qINw==
X-Gm-Message-State: ABy/qLaQWn+UAvOuZgFug9VsX+tn116Ibu4Usex2RLYGkz2h7znMYsqK
	DjfUW60jd+bp6SXrjOsjomSDygCQWZM=
X-Google-Smtp-Source: APBJJlGWSo5rVq92my6uYwW+klAeWUlQ3mA86B9vN3yBpxC1sO7CKjt+j6+7o+lEsGRRT7Farbe0RA==
X-Received: by 2002:aa7:cd65:0:b0:51e:36b8:34e3 with SMTP id ca5-20020aa7cd65000000b0051e36b834e3mr3688383edb.25.1689316460395;
        Thu, 13 Jul 2023 23:34:20 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72e8:a200:99ec:cf51:6f55:b3af? (dynamic-2a01-0c22-72e8-a200-99ec-cf51-6f55-b3af.c22.pool.telefonica.de. [2a01:c22:72e8:a200:99ec:cf51:6f55:b3af])
        by smtp.googlemail.com with ESMTPSA id dy23-20020a05640231f700b0051e22d3f328sm5246918edb.96.2023.07.13.23.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:34:20 -0700 (PDT)
Message-ID: <a42f129b-d64b-2d86-0758-143e99a534a0@gmail.com>
Date: Fri, 14 Jul 2023 08:34:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net] r8169: fix ASPM-related problem for chip version 42
 and 43
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, joey.joey586@gmail.com
References: <82ea9e63-d8c8-0b86-cd88-913cc249fa9a@gmail.com>
 <d644f048-970c-71fe-a556-a2c80444dae2@leemhuis.info>
 <17c638ca-5343-75e0-7f52-abf86026f75d@gmail.com>
 <fff3067d-5a7f-b328-ef65-fa68138f8b0f@leemhuis.info>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <fff3067d-5a7f-b328-ef65-fa68138f8b0f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2023 08:30, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 14.07.23 07:34, Heiner Kallweit wrote:
>> On 14.07.2023 05:31, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 13.07.23 21:46, Heiner Kallweit wrote:
>>
>>>> Fixes: 5fc3f6c90cca ("r8169: consolidate disabling ASPM before EPHY access")
>>>  Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217635 # [0]
>>> A "Cc: stable@vger.kernel.org" would be nice, too, to get this fixed in
>>> 6.4, where this surfaced (reminder: no, a Fixes: tag is not enough to
>>> ensure the backport there).
>> That's different in the net subsystem. The net (vs. net-next) annotation
>> ensures the backport.
> 
> Huh, how does that work? I thought "net" currently means "for 6.5" while
> "net-next" implies 6.6?
> 

https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt

See question:
I see a network patch and I think it should be backported to stable.
Should I request it via "stable@vger.kernel.org" like the references in
the kernel's Documentation/process/stable-kernel-rules.rst file say?

> Ciao, Thorsten

Heiner

