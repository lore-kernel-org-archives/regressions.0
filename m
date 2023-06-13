Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A43C25
	for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 11:23:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b3d29cfb17so16758035ad.3
        for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686655431; x=1689247431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Y7yi+Okgc5sTCMPfTkh6DdWUXsya0gJ+xteKBizfC8=;
        b=VYJsYkRhmamDj0aNWQJOkE+7ttXipRe/tLvjw4RXVYlJrxUeo3Tix2IPWS/huLQCzm
         G2O12J9IHZGKb06YSDZZX/Qg7iCKNo/mQ7jh93hlk9RHonsEvI08W6+kihAkVEeQL1j5
         J67c+KII/42VyBcPj8WN7Htnuum9/ImWAmBrd5IWkX31RSC0TTyXK0CrLZTcta7JCO91
         AMGDjHkX41C5SORTelhnqblJt2THuHdwLcSBeo5smjfjjTgtYT784wO6bJV2FAL5uq8Z
         6OYs5ydA8eiDht8ia7y1h2DHlQn+8uX/0ITdFNx2lLK8Gq+b5k1u7AVGDtVumOx407tb
         8woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686655431; x=1689247431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y7yi+Okgc5sTCMPfTkh6DdWUXsya0gJ+xteKBizfC8=;
        b=W/XP0VG7Jd45HQdQyUW8XopCJDdkIchPigSC3mDE5brQNkLqBZ0A6GNcDEUFh1Rddp
         heCfoSlegRzvy4dwOrjYUDjZAN882uthaA6/PbKe4PTitFzbuVzknZds3ajL545DzBCG
         aPigOtbQ7Z1Wt+E4KZ0OHXq/pX9wPJ7Vy8ue8UduhnqEpGpoLS3sM3ZesQD8HphSdQAx
         AA27o1nU0b2RAqxhtzb332eW/toNHz7HeTGEACDTG5GamsG4Do1VR9RG9RiDgYi/YSyg
         0iDGnS59xo1VmQVWprw8m5u1fLShNAtvDWIUxmLJT+ltpaAG3GmjpNfcmDMCi0mepgWV
         fzJw==
X-Gm-Message-State: AC+VfDxlOw70IoY3jQeqNsmzUnK1qZvQ4c+xwA7F1WKn4wTBFpoUZqAl
	TdHEWOjN8wz7a6id+/wvIDE=
X-Google-Smtp-Source: ACHHUZ5ZMtmfWu4aONz4T6VLColaAUqpKiQI9Drl624Ken5HRMAMAu3DDnkq0vW0Jy6kR2QfcsVLhw==
X-Received: by 2002:a17:902:b10b:b0:1ae:35ba:8c8f with SMTP id q11-20020a170902b10b00b001ae35ba8c8fmr8408423plr.13.1686655430967;
        Tue, 13 Jun 2023 04:23:50 -0700 (PDT)
Received: from [192.168.0.103] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b00198d7b52eefsm9946916plh.257.2023.06.13.04.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:23:50 -0700 (PDT)
Message-ID: <cc577237-7814-0bea-a152-8acdea844088@gmail.com>
Date: Tue, 13 Jun 2023 18:23:30 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Fwd: w_scan hangs on 6.3.7 and does not react on kill -9
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Kalamlacki <kalamlacki@gmail.com>, Hyunwoo Kim <imv4bel@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Stefan Lippers-Hollmann <s.l-h@gmx.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <67afa974-835a-77cc-d4bb-49cba0ff5bf5@gmail.com>
Content-Language: en-US
In-Reply-To: <67afa974-835a-77cc-d4bb-49cba0ff5bf5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/23 20:52, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> w_scan tool on kernel 6.3.7 hangs so badly that it cannot be killed by kill -9 
>> I tried also w_scan_cpp 20230604 but it also fails I have 2040:8268 Hauppauge soloHD device as reported by lsusb. During reboot of the OS it prints a lot of kernel errors but it is after syslog is killed I guess and in syslog messages I do not see anything. On default Debian kernel 5.10.0-23 this problem does not exists.
> 
> 
> See Bugzilla for the full thread and attached dmesg and kernel config.
> 
> Lukasz: On what hardware you have this regression? Also, it is really
> helpful if you can perform bisection (as outlined
> in Documentation/admin-guide/bug-bisect.html) to find the culprit,
> when developers can't figure it out by inspecting the code alone.
> Last but not least, please also try latest mainline (currently v6.4-rc6).
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: v5.10..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217540
> #regzbot title: w_scan zombie (unkillable) on kernel v6.3
> 

Another reporter on Bugzilla with similar regression as this one had
bisected the culprit, so:

Hyunwoo Kim: It looks like this regression is caused by a backported
commit of yours. Would you like to take a look on it?

#regzbot introduced: 8994830135b38b

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

