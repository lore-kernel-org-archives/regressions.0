Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31564A52
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 02:03:19 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i3so9773043pfc.11
        for <regressions@lists.linux.dev>; Sun, 16 Oct 2022 19:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1BS7apVGydAoGXKK3mWx1ARgbYb7rbvDgjOAr00me8=;
        b=gumgJxY0iWgaOgtxDWM4lbi1rxHRMJvLC1voY8Sg4GSvbUrTECdtotn2PqFeM4O7FW
         e0shF8OMEmVtZ4LL406n8//jRr9qKoiQ7RF4/Vs5mKrYpmm4XP5KmH47AGiAi8f/RRGh
         /tFB7XJdbfTiuwpt+daKechWqUJML1RnEka4jembFzta9OmRYWYXnfjRqkSJNWg1ZPz7
         gJk+LTu7uQEy+9QrrvLNK/e30DQVYepr8XJu28HSXErrm3uLriH/n6J7Tea2c0uKYw33
         bDrtk9eKF8JlGqV84wXqdzF4m2yQmGZAwHz7wUYf/YDso4IjzIOoZdug/XvhAAws8j4I
         46CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1BS7apVGydAoGXKK3mWx1ARgbYb7rbvDgjOAr00me8=;
        b=Cj+HP+3RZXcP2hB6XxuTqIRMQI0fkCgW0wtqY8UR47sZM0JioMJqgYYMPGEe3ERp1l
         PKArqM7ITb7YBPOfmi1LSE9Bb+AC6/OPwRCdQU8vjbgq7aozsDFyYLU7D0xhHfKI3MpW
         7HZe5ZwO5kL/OoZCY/Vqx2B2gQhd7xj0F6G6zgPflWq0Wiocau76fbGH+6gxcrkMzx40
         YyaC18WK3yzf+BinLevJwXYh7nIhddViRD3KTQjhig/jAU0EzoJcIsioZXW3Ly9sJ5lT
         fbwpmIgkNSSzEedV0lkgQlK2ij4XluI5HKou9EEwuq6WuuzyX5eF8FSszP39N0LYHUD/
         bp/w==
X-Gm-Message-State: ACrzQf2fYU0B1nEyRaVX0KBtV+y3lxTeqAkg6SGtc0UGDBBAC03ytjQU
	a5FIAJi6qZGQdEuzVLUYHTQ=
X-Google-Smtp-Source: AMsMyM7LE4fU3zgV59qA/N/CelhXcyazQi9dex79qO3Bmzf6whdrJrKvig02GYdrrVMgOQRLUa89VQ==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:6302 with SMTP id b12-20020a056a00114c00b005282c7a6302mr10148839pfm.37.1665972198533;
        Sun, 16 Oct 2022 19:03:18 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-87.three.co.id. [180.214.233.87])
        by smtp.gmail.com with ESMTPSA id x4-20020aa79404000000b005614f8f0f43sm5654281pfo.125.2022.10.16.19.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 19:03:18 -0700 (PDT)
Message-ID: <32ee551f-5642-4efb-02a0-500e7c92be5f@gmail.com>
Date: Mon, 17 Oct 2022 09:03:12 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
 regressions@leemhuis.info
Cc: linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 regressions@lists.linux.dev, srw@sladewatkins.net, phillip.lougher@gmail.com
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <ff2b901d-9491-c886-5330-a244101978ab@alu.unizg.hr>
 <b71f4e2d-23bb-3eb4-3928-fe66c4357e5b@squashfs.org.uk>
 <beba6259-6049-4f5b-6e54-a9c1faba0d5f@squashfs.org.uk>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <beba6259-6049-4f5b-6e54-a9c1faba0d5f@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/17/22 03:19, Phillip Lougher wrote:
> On 16/10/2022 20:55, Phillip Lougher wrote:
>>
>> Tracking down bugs of this sort is always a process of elimination,
>> and gathering information to pinpoint the exact circumstances of why
>> it is triggering.
>>
>> Next step is to download the exact snap(s) where the problems are occurring, as this may provide some insights.
>>
>> I don't run Ubuntu, and I don't use snaps.  Can you provide the
>> download link(s) of the snap(s) that cause problems?  If there's
>> any firefox snaps that don't cause problems those will be useful
>> too.
>>
> 
> It appears there's a searchable "Snap Store" https://snapcraft.io,
> but, it doesn't give any download links to the actual snaps which
> is rather annoying.
> 
> Does anyone know how to get the download link?  I have not run
> Ubuntu for over 14 years and have absolutely no wish to do so
> now either.
> 

You need to have snapd installed, unfortunately.

You can start the testing with hello-world snap, which can be installed
with `snap install hello-world`. Then run the snap with `snap run 
hello-world`. After that, reboot and repeat until the regression
occurs.

You can also try other snaps. For GUI applications, try krita, gimp,
gitkraken, and libreoffice. For server applications, try spinning up
containers with lxd or store data with nextcloud.

My guess is that the problem is in snapd when trying to execute
snaps, hence all snaps are affected.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

