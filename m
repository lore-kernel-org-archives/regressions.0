Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA0224D3
	for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 09:08:57 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bfb1167277so10674441fa.2
        for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694682535; x=1695287335; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myXNrdTUEfnJ2uywIxDILlGjQxJb0RUxKt0pQrpz5qA=;
        b=jIaiEB8Asjil20Q1ZN1FxBf7mtCWOkGDyEmLemEh8cUw9zMsXOrBIVTjaNwfjAihwS
         XnK0SDT1a8lvhTV92A/KuttZyCxbEoM0DAQEF48mAItGgmTxgpqTlff4W8JQhSK+G7hP
         lsFbOFY3rzyWdHuSA/fkt3xUMeS8fOfXvbzLy43ZXQFN7qoSq08ehVqRV0QhmJiMWou4
         JOSD06W4N4kSCm9NP+H/NiFlT2OMXJMJ/meC8hwYoZDP0N/L/yUc5GjYHsfW3yoqu2JP
         dd+clQsKZiUn8s4zv+5Th2in5BUt/kUh1XCmaZBUPvrlpXFPeYzBhTyRanX5MHCffjot
         gllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694682535; x=1695287335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myXNrdTUEfnJ2uywIxDILlGjQxJb0RUxKt0pQrpz5qA=;
        b=RcmYHrByxrxxK42FtKDE4MK9EC5z24Y+quci824Hu5qoTTPCQjLsnNLZMcXdLuUJ0k
         eNJzK19tAeIYSMcLnYZ4zCS0+BBm5a3Nwl7tXON0o/6WmafLixERB8APrdZJjUOmwoSc
         3RZOnqILCOfZKhfvDEl5QA3xZHKdePv/4brYYJ65U7cjDVaQQr2RBFB50wUbzb3RlKg7
         QhDLMnyNpAv/Q/sUpOzUD2JT+MCsv172erLTwRHkrZVlwua7foJrRKlpCuLNj9p6tJch
         ZyqiXVv7sjLqWbE7zFF+heDCn7O/8EbaQyGYovBcvLDv67FeEfofTngK8mrb69Bloxn0
         +ZkA==
X-Gm-Message-State: AOJu0YwlU4luLy73aCKoATeKsb4SqTS27Q8JX2rl1voAui2aBDEJQk/V
	yzmkmRusQPNR/G8ZRPfjVuA=
X-Google-Smtp-Source: AGHT+IFp2fWyTGFQ1Fj84/0q9IqOqinfqhJAJgpqjCg4C+5joAjuLN3cMBtNNAgv69Rv6rPZaNe/pg==
X-Received: by 2002:a2e:9517:0:b0:2be:4d3a:ad6a with SMTP id f23-20020a2e9517000000b002be4d3aad6amr4114996ljh.26.1694682535015;
        Thu, 14 Sep 2023 02:08:55 -0700 (PDT)
Received: from [172.24.134.61] ([193.205.131.2])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003feee8d8011sm4277553wmj.41.2023.09.14.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 02:08:54 -0700 (PDT)
Message-ID: <65ec6171-b47e-4d1e-9bd7-a61f2acfb959@gmail.com>
Date: Thu, 14 Sep 2023 11:08:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To: Linus Walleij <linus.walleij@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, regressions@lists.linux.dev,
 Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com>
 <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com>
 <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com>
 <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
 <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
 <4246946d-40e3-7df7-3fc4-9aa10e1dee10@redhat.com>
 <b9f879d5-55b8-401d-b154-8066cb66d20f@amd.com>
 <0522393f-9f0c-4c59-b961-9b8d865a645d@amd.com>
 <CACRpkdamAs=c6YBW2jgQ48kUPHqUGT=b89NSXYYttf0RbnpctQ@mail.gmail.com>
Content-Language: en-US
From: Luca Pigliacampo <lucapgl2001@gmail.com>
In-Reply-To: <CACRpkdamAs=c6YBW2jgQ48kUPHqUGT=b89NSXYYttf0RbnpctQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/23 10:43, Linus Walleij wrote:

> On Wed, Sep 13, 2023 at 11:21 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>
>> 2. In better news updating the BIOS fixed the issue in both Linux and
>> Windows, no kernel patches needed.
>>
>> So no further work will be done on this series.
> Is it easy for users to update BIOS? I.e. does
> fwupdmgr update work?
>
> Or does it require flashing special USB drives with FAT filesystems...?
>
> Because I'm not sure all users will do that. Or even be aware that
> they should. In that case detecting the situation and emitting
> a dev_err() telling the user to update their BIOS would be
> desirable I think?
>
> Yours,
> Linus Walleij

sadly it's not convenient,

the only way lenovo offers to update the bios

is an executable to run on windows.


So a user should either have a dual boot

or install windows on an external drive and boot from that,

also the update process might wipe every boot entry beside windows.


I read that some bios updaters also run on freedos, but i didn't try

