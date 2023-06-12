Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F110797
	for <regressions@lists.linux.dev>; Mon, 12 Jun 2023 13:52:54 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-651ffcc1d3dso3256168b3a.3
        for <regressions@lists.linux.dev>; Mon, 12 Jun 2023 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686577973; x=1689169973;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kbv3PFtGp+JNdvKh4QJEj5gSxVAqbUOQ4hjxsPiiBA=;
        b=aCiwCVfmCFrvDVHKxS/YiPaZVp4okZplYzc8EMQ6eScIEZegTvaYZVu/3EPq9v0Meh
         QIWJ1ptu9NtY52AL4qnsSW4i/bour84pSTkmj3WIl8XbalUz420zbgecQOfpcvypVyg+
         TvFkxt6lqR1guZA21jnTzisD2l65JT7xYGEz90EVIuChqsUhetNULFHQzufzQNduscPA
         GsnaD/1z6spVqJ1mnqfpIaoeHpo+OWMCD/W7+mE1+4XGiDko04FJYTltUCAvNPPmHeoz
         VSjvYVKb1k0GTZKV8IX5qZ5Cz3TLfbu1mmfzOX4VW/rdWoD/+ShiG43gyw2YSWlAYWRe
         +6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686577973; x=1689169973;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Kbv3PFtGp+JNdvKh4QJEj5gSxVAqbUOQ4hjxsPiiBA=;
        b=UldfYLyQQ6YRdUmfhx1a+erIl2f6kE2XVZdkV5QCYo0jd+y+vVt6JhwF4vLL+ie9iq
         m2a2A91jX2Ngaqr1w80L1+iLZioXPW6gu6GEwbYQTzKROs2NqgjMeFTQu4bxSY/r7y40
         /As71UPRRzjPzYBL7hBV0Lexc+1Ae/4uG1N4tDOZgbVtus1Uzx7MQSYZEyzSv6r4ov63
         VeCirUJbEpVewZVXAJmHwmCwJQE2U8vYgoKCf5Z5qvq95xGIgOlE7JYgBUSyL4v9y5ur
         mnVQK14W6JveFndWiE4qdmJnKbLiGO0s9oqEM8FdxK9WRTAraEDd4t9lq+Y0FqQv60zg
         eFRg==
X-Gm-Message-State: AC+VfDy1hHpN+7mQXlnAA3MzaO/2bJhG7nN/2ly4zLMkzfJTjGqf60FO
	o+izZN4gAdq3wuvH2Ak5WrA=
X-Google-Smtp-Source: ACHHUZ58h+luk0LktID8x6yR94SKolsflfBUZWQFQZBJ7NYlUf+nxgvari4wbsVoI3IeEmCDIFoD9w==
X-Received: by 2002:a05:6a00:84c:b0:65f:1990:c03c with SMTP id q12-20020a056a00084c00b0065f1990c03cmr11287167pfk.25.1686577973509;
        Mon, 12 Jun 2023 06:52:53 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-21.three.co.id. [180.214.232.21])
        by smtp.gmail.com with ESMTPSA id r1-20020a62e401000000b00662b551e5c4sm7150363pfh.94.2023.06.12.06.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 06:52:53 -0700 (PDT)
Message-ID: <67afa974-835a-77cc-d4bb-49cba0ff5bf5@gmail.com>
Date: Mon, 12 Jun 2023 20:52:48 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Kalamlacki <kalamlacki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: w_scan hangs on 6.3.7 and does not react on kill -9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> w_scan tool on kernel 6.3.7 hangs so badly that it cannot be killed by kill -9 
> I tried also w_scan_cpp 20230604 but it also fails I have 2040:8268 Hauppauge soloHD device as reported by lsusb. During reboot of the OS it prints a lot of kernel errors but it is after syslog is killed I guess and in syslog messages I do not see anything. On default Debian kernel 5.10.0-23 this problem does not exists.


See Bugzilla for the full thread and attached dmesg and kernel config.

Lukasz: On what hardware you have this regression? Also, it is really
helpful if you can perform bisection (as outlined
in Documentation/admin-guide/bug-bisect.html) to find the culprit,
when developers can't figure it out by inspecting the code alone.
Last but not least, please also try latest mainline (currently v6.4-rc6).

Anyway, I'm adding it to regzbot:

#regzbot introduced: v5.10..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217540
#regzbot title: w_scan zombie (unkillable) on kernel v6.3

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217540

-- 
An old man doll... just what I always wanted! - Clara
