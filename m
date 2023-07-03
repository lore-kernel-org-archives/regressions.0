Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A0F9C6
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 13:25:49 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b895a06484so5245645ad.1
        for <regressions@lists.linux.dev>; Mon, 03 Jul 2023 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688390749; x=1690982749;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ga6xNVvtp+lNzVIC5GM49mPA6xqLDAki2KCiSYDekHg=;
        b=ByElqpxaXLmLNtmWy2TYSJO/JUFTGZy2h49CLboWSt/xi11ecZfZ0ehCMNkPnbtmoT
         WXfPqsIo0AqSit+UQaDRRb2wsE1jDsK7ggXZA0jvOsJXqDKt/amZ4wVhd7jU4b3LIDHz
         vcnn6hrg+41HOaENnZtgt+OmMMJkmr+9KEm8y4q3T/3qmgQFVrKdPg5OcpOlktQECzeE
         3QKrviG2Y6o81oyLc5pmwupobhwSvT7bP63ogRAzvzknIF8IW/B3/gRMciHy4gysaqVf
         6NeADxjR+CglePxOO7t6ZZHhDT47VrVK33Q8tNl1V4P3vpPJ1/Ozd4RNiP584TD01Y5g
         hhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390749; x=1690982749;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ga6xNVvtp+lNzVIC5GM49mPA6xqLDAki2KCiSYDekHg=;
        b=dbjQAqptUfSSUJNJY55OBPzugrC7PjzLGkSUlShBO60t9suD3G5oq+9M7JXnwoE2Ld
         MQAsWf9bzgsTDg4bD8zZskpjp4y27LEhfaoDQU9/FF2e66HxBKxUkq6lWPEe4tit5GT8
         Mows6qEhBjggJZsTWR0vmbCPJEMX/getZn7HrctLOz52jKAq1g8LlchgENz/a8LMsnUB
         kTPqFoalsSXG2yyXL48JXagaPFV7VvwP+GADgSyHPVL203bqOA0azZ+Hz5a11A+Iz7SC
         dVkBnwzWIxycjkZtduXps/syD6M0KTfevOb6mCck5wNGej81n0XqvC7TIpzS2alxTVeR
         TIEQ==
X-Gm-Message-State: ABy/qLa8IXdLndL72sV6O1XYtnfCNT41Z1xsbXJcDgDQ5SBkqZdYo/A8
	g2sDt3UHvxY2iirET1neN8E=
X-Google-Smtp-Source: APBJJlGJ2K9GY+2bcZXbHVRCdunLIb1dR6F7DBiszDdzV3UC3p3rDMFzkNgSX8R+ppFGaZyRzNTATA==
X-Received: by 2002:a17:903:1c9:b0:1b8:76cb:3e50 with SMTP id e9-20020a17090301c900b001b876cb3e50mr6928046plh.47.1688390749077;
        Mon, 03 Jul 2023 06:25:49 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id jl23-20020a170903135700b001aafa2e212esm15272064plb.52.2023.07.03.06.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:25:48 -0700 (PDT)
Message-ID: <591e089a-6ccd-c5f3-4cd4-a332e2eae724@gmail.com>
Date: Mon, 3 Jul 2023 20:25:35 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Carsten Hatger <xmb8dsv4@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, x86@kernel.org
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Read from RTC broken upon resume from suspend on HP Pro x360 435
 G9 w/ AMD Ryzen 7 5825U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Dear all,
> 
> read access to the device's RTC fails upon resume from suspend with the following error message grabbed from the kernel ring buffer:
> 
> [409610.163139] Unable to read current time from RTC
> 
> The issue is rare and more likely to appear if the system has been in standby for more than 24hrs w/o interruption.
> 
> Same issue is reported to appear on HP Elite G9 devices, cf. https://bbs.archlinux.org/viewtopic.php?id=283620
> 
> The issue screws up the systems time resulting in erroneous dated log entries, failing authentication, ..., thus requiring a reboot.
> 
> Please see attached dmesg output (line 2069) for further information. 
> 
> AMD staff member suspected commit d2a632a8a11756197deb1341bbb09c09abaf20ce to cause a race condition, thus being responsible for the issue. They suggested to increase the delays introduced by latter commmit to 300us. Unfortunately this does not resolve the issue.
> 
> Any help would be appreciated.

See Bugzilla for the full thread and attached dmesg.

Mateusz: It looks like this regression is caused by a commit of yours.
Would you like to take a look on it?

Anyway, I'm adding it to regzbot:

#regzbot introduced: d2a632a8a11756 https://bugzilla.kernel.org/show_bug.cgi?id=217626
#regzbot title: reducing RTC_UIP polling period causes broken RTC on resume from suspend

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217626

-- 
An old man doll... just what I always wanted! - Clara
