Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781832F35
	for <regressions@lists.linux.dev>; Sat,  3 Sep 2022 23:47:43 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id o4so5248342pjp.4
        for <regressions@lists.linux.dev>; Sat, 03 Sep 2022 16:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=UYS35+vgl4uSzx/ZZvBFrUCMhv7wMfsL4fdM4w7RvjQ=;
        b=JGSPN0puLvr7p6D66ret/qP+3z2vOOz5AcAw50/FBFDWsxOckA/KiEkf4sQipbLnU4
         WTLz+Zbk2yGweN7x/r0Ys3gKHzI6b78/6kI41Ch7txyrvv76dEyLIBWIe1YEFQ8LNw/S
         Yznx2pq85OtflqcimEh+dKxF33io0jInTqSBzCw6GOQ3uQ236pSBhiEWY0dEx+3n2ziz
         ma0U7Qf2mvT/OaJw6amVtyHPTuCxNQCzxyFzehO3mGG+jpo7ZykQIOLnovoTfANa9fBe
         szmHGOoEnREkhdRwJdBQK5J6OV9y1ke8MNRKNX6VWL9EFN0z2msyUQeXNxmIEXokV0iE
         ZALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=UYS35+vgl4uSzx/ZZvBFrUCMhv7wMfsL4fdM4w7RvjQ=;
        b=Ki8prd4tN8K6FBxbjUZxtm8pW/LhjdgyNxKJ/h6VNz106PraYMufCfABYEyXBKInNK
         9Td/Ifquhd78UWl+nlJoe4dVOq4HzCmW71FheMdU+iUS2WN/1Qwz5MPyfhqGaDMlg6RY
         G/K7XNnWx4+2cQfE7mE5C1zLKJe14ZmX3nNLKGNgQ9r6eW2UDQmYMDTtB3Dy9a4ZMWle
         L+9o2Zu6CwygYiTpJsUd/e5dY22xtV+KDWHCZz9yyJq9DMrAaKPJX8xuCnc5qegygNUT
         15VEypacLinP47uq8Wu1dq1oE62EDgUbQGR2RP4uXZn7L8oB+iKucd6sfnbIgX68uKkr
         ZHjg==
X-Gm-Message-State: ACgBeo089GlxjcB4/LpvYka3DnaMr0OpiYR3iHzjUNuobFzmG5vW3UEk
	tnY1PDdOUT+dZIeQAe6xq38=
X-Google-Smtp-Source: AA6agR45o2OA06cBbkS6IlhspwVrvctBRi6D37hSZa6PAp2/x1Ea4CvK2Jf4eqOyTEI8pStXXwRaEQ==
X-Received: by 2002:a17:902:ccd1:b0:172:5c49:34be with SMTP id z17-20020a170902ccd100b001725c4934bemr41444324ple.23.1662248862739;
        Sat, 03 Sep 2022 16:47:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4-20020a631204000000b0042b08b6158dsm3685816pgl.56.2022.09.03.16.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 16:47:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
Date: Sat, 3 Sep 2022 16:47:39 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
 regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
 <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
 <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/22 15:37, Eugene Shalygin wrote:
> On Sun, 4 Sept 2022 at 00:00, Guenter Roeck <linux@roeck-us.net> wrote:
>> What does the name of the struct platform_driver data structure
>> have to do with __init ?
> 
> That's what the modpost warning message suggests:
> WARNING: modpost:
> /home/eugene/develop/asus-ec-sensors/asus-ec-sensors.o(.data+0x60):
> Section mismatch in reference from the variable
> asus_ec_sensors_platform_driver to the function
> .init.text:asus_ec_probe()
> The variable asus_ec_sensors_platform_driver references
> the function __init asus_ec_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> 

A driver with a probe function can be unloaded and reloaded manually.
I don't see how you can do that if the functions are marked __init
and the driver is built into the kernel.

Besides that, I _really_ dislike side effect programming.

Guenter
