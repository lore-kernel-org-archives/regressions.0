Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A0EA3
	for <regressions@lists.linux.dev>; Sat, 15 Apr 2023 07:37:27 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso640278b3a.3
        for <regressions@lists.linux.dev>; Sat, 15 Apr 2023 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681544247; x=1684136247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLN+c02TASIAiZAxTjvtJhCNuPlByu12AChb+JeIKgo=;
        b=HnEFBD24or9NNXSEt05PV2b2lWA1xu3zDts7mAT3tCpmXelaa3JTswPt0XvCmkdFJM
         G2MtiSJF5WGfd5nAWBh4IDrRzlh3FBYCf7/B2i2m/bZYZXoiteppvRnrprG3a1MNu5lt
         fNi8l/fmzNPz3QpTRahstHbYzFqRtnAaM9F+oBWMaN6RFX0BTunZg7aTZ+4RZ2fHeV7k
         Be0FiJb8da0U3tYPDU/ApCGmSHhV+I85vJoX/oT+fv5kgvHBio2EC5guoEdMHLvR7txX
         KX/1ukvXbH1AKf9Vp+q7a+h3bvRZ+SgmJgZUrzAPgk5nIvyQk56B+rmxrzpEeCe1fsH4
         ppcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681544247; x=1684136247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLN+c02TASIAiZAxTjvtJhCNuPlByu12AChb+JeIKgo=;
        b=Da/6XL8Oevo4LdYBmpWvFErdiZDciGWrMu18f6hd95PvYLouLZ2/2xfrK1mqnQlGu/
         nhFiT8Ja67PUGWjtF+HPtBNBK+UKYMrsdpOK2EYfL+EpF+Eux7HqR9R9KV9c9a4ssNII
         WQMuQoBzDF/Mxrd24AiAGHosWvuh4sp50kv27Lnh29+4St9jKcyzsQA+U3lG5vySOvqS
         4rQXq3dfL7f+06LDI3zz10jCDRkDLJg79d62p71CrEs0Ol30TpRXhKfAoJsNcMIMw9uX
         0MT8Xe+sRdA/7ri6ERJoBae7J/Vy2ETJ5ROCzHKOvcNQrCCQ2FTuiyEU6nOTotJm+2iJ
         SrmQ==
X-Gm-Message-State: AAQBX9cRTNoZ2Fd+RrG8bK0VhpAnVHUr4qJPoyzlblMf/lKpJ0TWxifJ
	J66nTl5FXVAPVEpQCWSCgfg=
X-Google-Smtp-Source: AKy350agWvuQm7leUafw+gUduLmt/CoJ227PsKwb7+H43BCO7VOSJPw3Ppo3hea+qUunX+4bj+sOIg==
X-Received: by 2002:a05:6a00:248a:b0:63b:64a6:570 with SMTP id c10-20020a056a00248a00b0063b64a60570mr6497037pfv.26.1681544246931;
        Sat, 15 Apr 2023 00:37:26 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-70.three.co.id. [180.214.233.70])
        by smtp.gmail.com with ESMTPSA id i26-20020aa787da000000b00636caef0714sm4245137pfo.144.2023.04.15.00.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 00:37:26 -0700 (PDT)
Message-ID: <ca1aecf9-241a-6623-69cc-12d08bd61c80@gmail.com>
Date: Sat, 15 Apr 2023 14:37:20 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
To: Acid Bong <acidbong@tilde.cafe>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: stable@vger.kernel.org, linux-acpi@vger.kernel.org
References: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
 <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>
 <b2edf1ed-2777-03ef-4d5e-e355a6074f78@leemhuis.info>
 <CRWCUOAB4JKZ.3EKQN1TFFMVQL@bong>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CRWCUOAB4JKZ.3EKQN1TFFMVQL@bong>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/23 16:07, Acid Bong wrote:
>> Thorsten
>> why do you pass pci=nomsi
> It's a workaround for another issue i've been facing for about 2 or 3
> years, since when I first tried out Linux (started with loading Kubuntu
> and Mint live images). Without that workaround Kubuntu didn't boot for
> me - on kernel 5.8 it only reached the graphic installer part, but hung
> after language selection menu, on 5.4 and 5.11 - didn't even reach the
> graphic session. With Mint it was more severe - the screen was flooded
> with PCIe errors, like so:
> 
> 	Apr 10 18:47:08 bong last message buffered 3 times
> 	Apr 10 18:47:08 bong kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask

Hardware issue? Or is this another kernel issue? If it is the latter,
file separate report (see Documentation/admin-guide/reporting-issues.rst
for how to report kernel issues).

-- 
An old man doll... just what I always wanted! - Clara

